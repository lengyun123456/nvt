###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_f5_big_iq_web_detect.nasl 8078 2017-12-11 14:28:55Z cfischer $
#
# F5 Networks  BIG-IQ Webinterface Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.105165");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_tag(name:"qod_type", value:"remote_banner");
 script_version ("$Revision: 8078 $");
 script_tag(name:"last_modification", value:"$Date: 2017-12-11 15:28:55 +0100 (Mon, 11 Dec 2017) $");
 script_tag(name:"creation_date", value:"2015-01-12 14:37:50 +0100 (Mon, 12 Jan 2015)");
 script_name("F5 Networks BIG-IQ Webinterface Detection");

 script_tag(name: "summary" , value: "The script sends a connection
request to the server and attempts to extract the version number
from the reply.");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2015 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("global_settings.inc");
include("host_details.inc");

port = get_http_port( default:443 );

url = '/ui/login/';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( "Server: webd" >!< buf || "<title>BIG-IQ" >!< buf || "F5 Networks" >!< buf ) exit( 0 );

_version = 'unknown';
_build = 'unknown';

set_kb_item( name:"f5/big_iq/web_management/installed", value:TRUE );
set_kb_item( name:"f5/big_iq/web_management/port", value:port );

cpe = 'cpe:/h:f5:big-iq';

vers = eregmatch( pattern:"\?ver=([0-9.]+)", string: buf );

if( ! isnull( vers[1] ) ) {

  version = vers[1];
  _vers = split( version, sep:'.', keep:FALSE );

  _version = _vers[0] + '.' + _vers[1] + '.' + _vers[2];
  _build = version - ( _version + '.' );

  cpe += ':' + _version;

}

register_product( cpe:cpe, location:url, port:port );

if( _version != "unknown" )
  if( ! get_kb_item( "f5/big_iq/version" ) ) set_kb_item( name:"f5/big_iq/version", value:_version );

if( _build != "unknown" )
  if( ! get_kb_item( "f5/big_iq/build" ) ) set_kb_item( name:"f5/big_iq/build", value:_build );

log_message( data: build_detection_report( app:"F5 BIG-IQ Webinterface",
                                           version:_version,
                                           install:url,
                                           cpe:cpe,
                                           concluded: vers[0] ),
             port:port );

exit(0);

