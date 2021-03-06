###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_github_enterprise_web_detect.nasl 5604 2017-03-17 16:42:21Z mime $
#
# GitHub Enterprise Management Console Detection
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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
 script_oid("1.3.6.1.4.1.25623.1.0.140195");
 script_tag(name:"cvss_base", value:"0.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version ("$Revision: 5604 $");
 script_tag(name:"last_modification", value:"$Date: 2017-03-17 17:42:21 +0100 (Fri, 17 Mar 2017) $");
 script_tag(name:"creation_date", value:"2017-03-17 16:36:11 +0100 (Fri, 17 Mar 2017)");
 script_name("GitHub Enterprise Management Console Detection");

 script_tag(name: "summary" , value: "This script performs HTTP based detection of GitHub Enterprise Management Console.");

 script_tag(name:"qod_type", value:"remote_banner");

 script_category(ACT_GATHER_INFO);
 script_family("Product detection");
 script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
 script_dependencies("find_service.nasl", "http_version.nasl");
 script_require_ports("Services/www", 8443, 8080);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("host_details.inc");

port = get_http_port( default:8443 );

url = '/setup/unlock';
req = http_get( item:url, port:port );
buf = http_keepalive_send_recv( port:port, data:req, bodyonly:FALSE );

if( buf !~ "<title>(Setup )?GitHub Enterprise( preflight check)?</title>" ||
     ( "Please enter your password to unlock the GitHub Enterprise management" >!< buf ) &&
     ( "GitHub Enterprise requires one of the following" >!< buf ) &&
     ( 'enterprise.github.com/support">contact support' >!< buf )
    )
  exit( 0 );

set_kb_item( name:"github/enterprise/webmanagement/detected", value:TRUE);

cpe = 'cpe:/a:github:github_enterprise';

register_product( cpe:cpe, location:"/setup", port:port, service:"www" );

log_message( port:port, data:'GitHub Enterprise Management Console is running at this port.\nCPE: ' + cpe + '\n' );

exit( 0 );

