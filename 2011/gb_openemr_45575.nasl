###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_openemr_45575.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# OpenEMR Multiple Input Validation Vulnerabilities
#
# Authors:
# Michael Meyer <michael.meyer@greenbone.net>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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

tag_summary = "OpenEMR is prone to SQL-injection, HTML-injection, and cross-site-
scripting vulnerabilities.

Exploiting these issues could allow an attacker to steal cookie-
based authentication credentials, compromise the application,
access or modify data, or exploit latent vulnerabilities in the
underlying database.

OpenEMR 3.2.0 is vulnerable; other versions may also be affected.";


if (description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.103019");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-01-07 13:52:38 +0100 (Fri, 07 Jan 2011)");
 script_bugtraq_id(45575);

 script_name("OpenEMR Multiple Input Validation Vulnerabilities");

 script_xref(name : "URL" , value : "https://www.securityfocus.com/bid/45575");
 script_xref(name : "URL" , value : "http://www.sourceforge.net/projects/openemr/");
 script_xref(name : "URL" , value : "http://www.oemr.org/");

 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_tag(name:"qod_type", value:"remote_banner");
 script_category(ACT_GATHER_INFO);
 script_family("Web application abuses");
 script_copyright("This script is Copyright (C) 2011 Greenbone Networks GmbH");
 script_dependencies("gb_openemr_detect.nasl");
 script_require_ports("Services/www", 80);
 script_mandatory_keys("openemr/installed");
 script_tag(name : "summary" , value : tag_summary);
 exit(0);
}

include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);

if(vers = get_version_from_kb(port:port,app:"OpenEMR")) {

  if(version_is_equal(version: vers, test_version: "3.2.0")) {
      security_message(port:port);
      exit(0);
  }

}

exit(0);
