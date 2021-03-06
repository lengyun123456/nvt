###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_database_auth_protocol_sec_bypass_vuln.nasl 6086 2017-05-09 09:03:30Z teissa $
#
# Oracle Database Server Authentication Protocol Security Bypass Vulnerability
#
# Authors:
# Shashi Kiran N <nskiran@secpod.com>
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.803957";
CPE = 'cpe:/a:oracle:database_server';

if(description)
{
  script_oid(SCRIPT_OID);
  script_version("$Revision: 6086 $");
  script_cve_id("CVE-2012-3137");
  script_bugtraq_id(55651);
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:N");
 script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_tag(name:"last_modification", value:"$Date: 2017-05-09 11:03:30 +0200 (Tue, 09 May 2017) $");
  script_tag(name:"creation_date", value:"2013-10-28 17:27:36 +0530 (Mon, 28 Oct 2013)");
  script_name("Oracle Database Server Authentication Protocol Security Bypass Vulnerability");

  tag_summary =
"This host is installed with Oracle Database Server and is prone to security
bypass vulnerability.";

  tag_vuldetect =
"Get the installed version with the help of tnslsnr service and check it is
vulnerable or not.";

  tag_insight =
"Flaw is due to an error occurs in the authentication protocol.

A flaw exist in authentication protocol, which allows arbitrary users to obtain
session key and salt.";

  tag_impact =
"Successful exploitation will allow attackers to to bypass the authentication
process, gain unauthorized access to the database and obtain sensitive
information.

Impact Level: Application";

  tag_affected =
"Oracle Database Server versions 10.2.0.3, 10.2.0.4, 10.2.0.5, 11.1.0.7,
11.2.0.2, and 11.2.0.3";

  tag_solution =
"Apply patches from below link,
http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html

*****
NOTE: Ignore this warning if above mentioned patch is installed.
*****";


  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "vuldetect" , value : tag_vuldetect);
  script_tag(name : "summary" , value : tag_summary);

  script_xref(name : "URL" , value : "http://securitytracker.com/id?1027558");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/22069");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/117503");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html");
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Databases");
  script_dependencies("oracle_tnslsnr_version.nasl");
  script_mandatory_keys("OracleDatabaseServer/installed");
  exit(0);
}


include("version_func.inc");
include("host_details.inc");
include("global_settings.inc");

## Variable initialisation
port = "";
ver = "";

## Get Port
if(!port = get_app_port(cpe:CPE, nvt:SCRIPT_OID))exit(0);

## Get Version
if(!ver = get_app_version(cpe:CPE, nvt:SCRIPT_OID, port:port))exit(0);

if(ver =~ "^(11\.[1|2]\.0|10\.2\.0)")
{
  if(version_in_range(version:ver, test_version:"10.2.0.3", test_version2:"10.2.0.5")||
     version_in_range(version:ver, test_version:"11.2.0.2", test_version2:"11.2.0.3")||
     version_is_equal(version:ver, test_version:"11.1.0.7"))
  {
    security_message(port);
  }
}
