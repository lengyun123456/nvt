# OpenVAS Vulnerability Test
# $Id: asp_source_space.nasl 9348 2018-04-06 07:01:19Z cfischer $
# Description: ASP source using %20 trick
#
# Authors:
# Michel Arboi <arboi@alussinan.org> hacked asp_source_data.nasl which
# was written by Renaud Deraison <deraison@cvs.nessus.org>
# Script audit and contributions from Carmichael Security <http://www.carmichaelsecurity.com>
# Erik Anderson <eanders@carmichaelsecurity.com>
# Added BugtraqID and CAN
#
# Copyright:
# Copyright (C) 2002 Michel Arboi
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

tag_summary = "It is possible to get the source code of the remote
ASP scripts by appending %20 at the end
of the request (like GET /default.asp%20)


ASP source code usually contains sensitive information such
as logins and passwords.";

tag_solution = "install all the latest security patches";

# References:
# Date:  Fri, 29 Jun 2001 13:01:21 -0700 (PDT)
# From: "Extirpater" <extirpater@yahoo.com>
# Subject: 4 New vulns. vWebServer and SmallHTTP
# To: bugtraq@securityfocus.com, vuln-dev@securityfocus.com

if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.11071");
 script_version("$Revision: 9348 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:01:19 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2005-11-03 14:08:04 +0100 (Thu, 03 Nov 2005)");
 script_bugtraq_id(2975);
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
 script_cve_id("CVE-2001-1248");
 name = "ASP source using %20 trick";
 script_name(name);
 



 
 
 script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"remote_vul");
 
 # In fact, Renaud wrote more than halt of this script!
 script_copyright("This script is Copyright (C) 2002 Michel Arboi");
 family = "Web application abuses";
 script_family(family);
 script_dependencies("find_service.nasl", "webmirror.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

#
# The script code starts here
#

include("http_func.inc");
include("http_keepalive.inc");

function check(file, port)
{
  req = http_get(item:string(file, "%20"), port:port);
  r   = http_keepalive_send_recv(port:port, data:req);
  if ( ! r ) exit(0);
  if ( ! ereg(pattern:"^HTTP/.* 200 .*", string:r) ) exit(0);
  if("Content-Type: application/octet-stream" >< r){
  	security_message(port);
	return(1);
	}
  if (("<%" >< r) && ("%>" >< r)) {
	security_message(port);
	return(1);
  }
 return(0);
}


port = get_http_port(default:80);
if ( ! can_host_asp(port:port) ) exit(0);

if(check(file:"/default.asp", port:port))exit(0);
files = get_kb_list(string("www/", port, "/content/extensions/asp"));
if(isnull(files))exit(0);
files = make_list(files);
check(file:files[0], port:port); 
