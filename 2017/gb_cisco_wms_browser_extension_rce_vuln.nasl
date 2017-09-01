###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_cisco_wms_browser_extension_rce_vuln.nasl 6851 2017-08-04 07:31:24Z asteins $
#
# Cisco WebEx Meetings Server Browser Extension Remote Code Execution Vulnerability
#
# Authors:
# Shakeel <bshakeel@secpod.com>
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

CPE = 'cpe:/a:cisco:webex_meetings_server';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811240");
  script_version("$Revision: 6851 $");
  script_cve_id("CVE-2017-6753");
  script_bugtraq_id(99614);
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-08-04 09:31:24 +0200 (Fri, 04 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-07-18 12:06:48 +0530 (Tue, 18 Jul 2017)");
  script_name("Cisco WebEx Meetings Server Browser Extension Remote Code Execution Vulnerability");

  script_tag(name: "summary" , value: "This host is running Cisco WebEx Meetings
  Server and is prone to remote code execution vulnerability.");

  script_tag(name: "vuldetect" , value: "Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value: "The flaw exists due to a design defect in
  the browser extension.");

  script_tag(name: "impact" , value: "Successful exploitation will allow remote
  attackers to execute arbitrary code with the privileges of the affected browser.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Cisco WebEx Meetings Server versions
  1.1 Base, 1.5 Base, 1.5.1.6, 1.5.1.131, 2.0 Base, 2.0.1.107, 2.0 MR2 through
  2.0 MR9, 2.0 MR9 Patch 1 through 2.0 MR9 Patch 3, 2.5 Base, 2.5.99.2, 2.5 MR1,
  2.5.1.5, 2.5.1.29, 2.5 MR2, 2.5 MR2 Patch 1, 2.5 MR3 through 2.5 MR5, 2.5 MR5
  Patch 1, 2.5 MR6, 2.5 MR6 Patch 1 through 2.5 MR6 Patch 4, 2.6.0, 2.6.1.39,
  2.6 MR1, 2.6 MR1 Patch 1, 2.6 MR2, 2.6 MR2 Patch 1, 2.6 MR3, 2.6 MR3 Patch 1,
  2.6 MR3 Patch 2, 2.7 Base, 2.7.1, 2.7 MR1, 2.7 MR1 Patch 1, 2.7 MR2, 2.7 MR2
  Patch 1, 2.8 Base and 2.8 prior to 2.8 Patch 3");

  script_tag(name: "solution" , value:"Upgrade to Cisco WebEx Meetings Server
  version 2.7MR2 Patch 9 or 2.8 Patch 3 or later. For updates refer to
  http://www.cisco.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");

  script_xref(name : "URL" , value : "https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-20170717-webex");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("CISCO");
  script_dependencies("gb_cisco_webex_meetings_server_detect.nasl");
  script_mandatory_keys("cisco/webex/detected");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
ciscoPort = "";
vers = "";
fix = "";

## Get port
if(!ciscoPort = get_app_port(cpe:CPE)){
  exit( 0 );
}

## Get version 
if(!vers = get_app_version(cpe:CPE, port:ciscoPort)){
  exit( 0 );
}


## Check for vulnerable version
## 2.8 Patch 3 == 2.8.1.39
if(vers =~ "^(2\.8)" && version_is_less(version:vers, test_version:"2.8.1.39")){
  fix = "2.8 Patch 3";
}

## 2.7MR2 Patch 9 == 2.7.1.2103
else if(version_is_less(version:vers, test_version:"2.7.1.2103")){
  fix = "2.7MR2 Patch 9";
}

if(fix)
{
  report = report_fixed_ver(installed_version:vers, fixed_version:fix);
  security_message(port:ciscoPort, data:report);
  exit(0);
}