###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_winamp_mult_code_exec_n_dos_vuln.nasl 6853 2017-08-04 11:45:08Z santu $
#
# Winamp '.flv' File Processing Denial of Service And Code Execution Vulnerabilities
#
# Authors:
# Rinu Kuriakose <krinu@secpod.com>
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:nullsoft:winamp";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811547");
  script_version("$Revision: 6853 $");
  script_cve_id("CVE-2017-10725", "CVE-2017-10726", "CVE-2017-10727", "CVE-2017-10728");
  script_tag(name:"cvss_base", value:"6.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-08-04 13:45:08 +0200 (Fri, 04 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-02 16:51:17 +0530 (Wed, 02 Aug 2017)");
  script_name("Winamp '.flv' File Processing Denial of Service And Code Execution Vulnerabilities");

  script_tag(name: "summary" , value:"This host is installed with Winamp and
  is prone to multiple denial of service and code execution vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to multiple memory 
  corruption errors when handling malicious '.flv' files.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code or cause a denial of service.

  Impact Level: Application");

  script_tag(name: "affected" , value:"Winamp version 5.666 Build 3516(x86).");

  script_tag(name: "solution" , value:"No solution or patch is available as of
  2nd August 2017, Information regarding this issue will be updated once the 
  solution details are available.");

  script_xref(name : "URL" , value : "https://github.com/wlinzi/security_advisories/tree/master/CVE-2017-10725");
  script_xref(name : "URL" , value : "https://github.com/wlinzi/security_advisories/tree/master/CVE-2017-10728");
  script_xref(name : "URL" , value : "https://github.com/wlinzi/security_advisories/tree/master/CVE-2017-10727");
  script_xref(name : "URL" , value : "https://github.com/wlinzi/security_advisories/tree/master/CVE-2017-10726");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_family("General");
  script_dependencies("secpod_winamp_detect.nasl");
  script_mandatory_keys("Winamp/Version");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

## Variable Initialization
version = "";

## Get the version
if(!version = get_app_version(cpe:CPE)){
  exit(0);
}

## Check the vulnerable version, 5.666 build 3516= 5.6.6.3516
if(version_is_equal(version:version, test_version:"5.6.6.3516"))
{
  report = report_fixed_ver(installed_version:version, fixed_version:"Noneavailable");
  security_message(data:report);
  exit(0);
}