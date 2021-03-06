###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_asa_detect.nasl 10297 2018-06-22 09:03:44Z ckuersteiner $
#
# Cisco ASA SSL VPN Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2014 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.105033");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 10297 $");
 script_tag(name:"last_modification", value:"$Date: 2018-06-22 11:03:44 +0200 (Fri, 22 Jun 2018) $");
 script_tag(name:"creation_date", value:"2014-05-26 15:00:41 +0200 (Mon, 26 May 2014)");
 script_name("Cisco ASA SSL VPN Detection");

 script_tag(name:"summary", value:"The script sends a connection request to the server and attempts
to extract the version number from the reply.");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2014 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 443);
 script_exclude_keys("Settings/disable_cgi_scanning");

 script_tag(name:"qod_type", value:"remote_banner");

 exit(0);
}

include("http_func.inc");
include("misc_func.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:443 );

host = http_host_name( port:port );
uid = rand_str(length:128, charset:'ABCDEF0123456789');

url = '/%2bCSCOE%2b/win.js';
req = http_get( item:url, port:port );
buf = http_send_recv( port:port, data:req, bodyonly:FALSE );

if( "CSCO_WebVPN" >!< buf ) exit( 0 );

url = '/%2bCSCOE%2b/logon.html';
req = http_get( item:url, port:port );
buf = http_send_recv( port:port, data:req, bodyonly:FALSE );

if( buf !~ 'HTTP/1.. 200' ) exit( 0 );

set_kb_item( name:"cisco_asa/webvpn/installed",value:TRUE );

xml = '<?xml version="1.0" encoding="UTF-8"?>\r\n' +
      '<config-auth client="vpn" type="init" aggregate-auth-version="2">\r\n' +
      '<version who="vpn">3.1.05160</version>\r\n' +
      '<device-id device-type="MacBookAir4,1" platform-version="10.9.2" unique-id="' + uid + '">mac-intel</device-id>\r\n' +
      '<mac-address-list>\r\n' +
      '<mac-address>00:00:00:00:00:00</mac-address></mac-address-list>\r\n' +
      '<group-select>VPN</group-select>\r\n' +
      '<group-access>https://' + host + '</group-access>\r\n' +
      '</config-auth>';

len = strlen( xml );

req = 'POST / HTTP/1.1\r\n' +
      'Connection: close\r\n' +
      'Content-Length: ' + len + '\r\n' +
      'X-Transcend-Version: 1\r\n' +
      'Accept: */*\r\n' +
      'Host: ' + host + '\r\n' +
      'X-AnyConnect-Platform: mac-intel\r\n' +
      'Accept-Encoding: identity\r\n' +
      'X-Aggregate-Auth: 1\r\n' +
      'User-Agent: AnyConnect Darwin_i386 3.1.05160\r\n\r\n' +
      xml;
buf = http_send_recv( port:port, data:req, bodyonly:FALSE );

vers = 'unknown';
version = eregmatch( string:buf, pattern:'<version.*>([^<]+)</version>' );
if( ! isnull( version[1] ) ) vers = version[1]; # Example: 9.0(2)

cpe = build_cpe( value:vers, exp:"^([0-9.()]+)", base:"cpe:/a:cisco:asa:" );
if( isnull( cpe ) )
  cpe = 'cpe:/a:cisco:asa';

register_product( cpe:cpe, location:'/', port:port, service: "www" );

log_message(data: build_detection_report(app:"Cisco ASA SSL VPN",
                                         version:vers,
                                         install:'/+CSCOE+/logon.html',
                                         cpe:cpe,
                                         concluded: version[0]),
            port:port);

exit( 0 );

