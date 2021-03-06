###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_apple_macosx_HT208849_03.nasl 10124 2018-06-07 13:56:22Z santu $
#
# Apple MacOSX Security Updates(HT208849)-03
#
# Authors:
# Rajat Mishra <rajatm@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.813512");
  script_version("$Revision: 10124 $");
  script_cve_id("CVE-2018-8897", "CVE-2018-4171");
  script_tag(name:"cvss_base", value:"10.0");	
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-06-07 15:56:22 +0200 (Thu, 07 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-06-04 14:09:18 +0530 (Mon, 04 Jun 2018)");
  script_name("Apple MacOSX Security Updates(HT208849)-03");

  script_tag(name:"summary", value:"This host is installed with Apple Mac OS X
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,

  - The operating system unable to properly handle an Intel architecture debug
    exception after certain instructions.

  - An information disclosure issue in device properties.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code and determine kernel memory layout.

  Impact Level: System");

  script_tag(name: "affected" , value:"Apple Mac OS X versions,
  10.11.x through 10.11.6, 10.12.x through 10.12.6");

  script_tag(name: "solution" , value:"Upgrade to Apple Mac OS X 10.11.6 build
  15G21012 for 10.11.x versions or Apple Mac OS X 10.12 build 16G1408 for 10.12.x 
  versions. For updates refer to Reference links.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");
  script_xref(name : "URL" , value : "https://support.apple.com/en-in/HT208849");
  script_xref(name : "URL" , value : "https://www.apple.com");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Mac OS X Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/osx_name", "ssh/login/osx_version");
  exit(0);
}

include("version_func.inc");

osName = get_kb_item("ssh/login/osx_name");
if(!osName){
  exit (0);
}

osVer = get_kb_item("ssh/login/osx_version");
if(!osVer || osVer !~ "^(10\.(11|12))" || "Mac OS X" >!< osName){
  exit(0);
}

buildVer = get_kb_item("ssh/login/osx_build");

if(osVer =~ "^(10.11)")
{
  if(version_is_less(version:osVer, test_version:"10.11.6")){
    fix = "Upgrade to latest OS(10.11.6) release and apply patch from vendor";
  }

  else if(osVer == "10.11.6"  && version_is_less(version:buildVer, test_version:"15G21012"))
  {
    fix = "Apply patch from vendor";
    osVer = osVer + " Build " + buildVer;
  }
}

if(osVer =~ "^(10.12)")
{
  if(version_is_less(version:osVer, test_version:"10.12.6")){
    fix = "Upgrade to latest OS(10.12.6) release and apply patch from vendor";
  }

  else if(osVer == "10.12.6" && version_is_less(version:buildVer, test_version:"16G1408"))
  {
    fix = "Apply patch from vendor";
    osVer = osVer + " Build " + buildVer;
  }
}

if(fix)
{
  report = report_fixed_ver(installed_version:osVer, fixed_version:fix);
  security_message(data:report);
}
exit(0);