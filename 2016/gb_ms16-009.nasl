###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-009.nasl 5612 2017-03-20 10:00:41Z teissa $
#
# Microsoft Internet Explorer Multiple Vulnerabilities (3134220)
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2016 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:microsoft:ie";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.806680");
  script_version("$Revision: 5612 $");
  script_cve_id("CVE-2016-0041", "CVE-2016-0059", "CVE-2016-0060", "CVE-2016-0061",
                "CVE-2016-0062", "CVE-2016-0063", "CVE-2016-0064", "CVE-2016-0067",
                "CVE-2016-0068", "CVE-2016-0069", "CVE-2016-0071", "CVE-2016-0072",
                "CVE-2016-0077");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 11:00:41 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-02-10 08:17:47 +0530 (Wed, 10 Feb 2016)");
  script_tag(name:"qod_type", value:"executable_version");
  script_name("Microsoft Internet Explorer Multiple Vulnerabilities (3134220)");

  script_tag(name: "summary" , value:"This host is missing a critical security
  update according to Microsoft Bulletin MS16-009.");

  script_tag(name: "vuldetect" , value:"Get the vulnerable file version and check
  appropriate patch is applied or not.");

  script_tag(name: "insight" , value:"Multiple flaws exists due to,
  - An improper validation of input before loading dynamic link library (DLL) files.
  - An error in Hyperlink Object Library which improperly discloses the contents of
    its memory.
  - Multiple memory corrupt errors.
  - An improper parsing of HTTP responses.
  - An improper enforcing of cross-domain policies.");

  script_tag(name: "impact" , value:"Successful exploitation will allow remote
  attackers to execute arbitrary code, gain access to potentially sensitive
  information, conduct redirection attack and gain elevated privileges on the
  affected system.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"Microsoft Internet Explorer version
  9.x/10.x/11.x");

  script_tag(name: "solution" , value:"Run Windows Update and update the listed
  hotfixes or download and update mentioned hotfixes in the advisory from the
  https://technet.microsoft.com/library/security/MS16-009");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3134814");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3134220");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3134220");
  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3141092");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/library/security/MS16-009");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("gb_ms_ie_detect.nasl");
  script_mandatory_keys("MS/IE/Version");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("host_details.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
ieVer   = "";
dllVer  = NULL;

## Check for OS and Service Pack
if(hotfix_check_sp(winVista:3, win7:2, win7x64:2, win2008:3, win2008r2:2,
                   win2012:1,  win2012R2:1, win8_1:1, win8_1x64:1, win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get IE Version
ieVer = get_app_version(cpe:CPE);
if(!ieVer || !(ieVer =~ "^(9|10|11)")){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version from Mshtml.dll
dllVer = fetch_file_version(sysPath, file_name:"system32\Mshtml.dll");
if(!dllVer){
  exit(0);
}

## Windows Vista and Server 2008
if(hotfix_check_sp(winVista:3, win2008:3) > 0)
{
  ## Check for Mshtml.dll version
  if(version_in_range(version:dllVer, test_version:"9.0.8112.16000", test_version2:"9.0.8112.16747")){
    Vulnerable_range = "9.0.8112.16000 - 9.0.8112.16747";
    VULN = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"9.0.8112.20000", test_version2:"9.0.8112.20862")){
    Vulnerable_range = "9.0.8112.20000 - 9.0.8112.20862";
    VULN = TRUE ;
  }
}

## Windows 7 and Server 2008r2
else if(hotfix_check_sp(win7:2, win7x64:2, win2008r2:2, win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Mshtml.dll version
  ##Combining https://support.microsoft.com/en-us/kb/3134814 and https://support.microsoft.com/en-us/kb/3141092
  ##https://support.microsoft.com/en-us/kb/3134814 == less than 11.0.9600.18205
  ##https://support.microsoft.com/en-us/kb/3141092 == less than 11.0.9600.18212
  if(version_in_range(version:dllVer, test_version:"11.0.9600.00000", test_version2:"11.0.9600.18211"))
  {
     Vulnerable_range = "11.0.9600.00000 - 11.0.9600.18211";
     VULN = TRUE ;
  }
}

else if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Mshtml.dll version
  if(version_in_range(version:dllVer, test_version:"10.0.9200.16000", test_version2:"10.0.9200.17639"))
  {
    Vulnerable_range = "10.0.9200.16000 - 10.0.9200.17639";
    VULN = TRUE ;
  }
  else if(version_in_range(version:dllVer, test_version:"10.0.9200.20000", test_version2:"10.0.9200.21758"))
  {
    Vulnerable_range = "10.0.9200.20000 - 10.0.9200.21758";
    VULN = TRUE ;
  }
}

###Windows 10
else if(hotfix_check_sp(win10:1, win10x64:1) > 0)
{
  ## Check for Mshtml.dll version
  ## Windows 10 Core
  ## Check for Mshtml.dll version
  if(version_is_less(version:dllVer, test_version:"11.0.10240.16683"))
  {
    Vulnerable_range = "Less than 11.0.10240.16683";
    VULN = TRUE ;
  }

  ## Windows 10 version 1511
  ## Check for Mshtml.dll version
  else if(version_in_range(version:dllVer, test_version:"11.0.10586.0", test_version2:"11.0.10586.102"))
  {
    Vulnerable_range = "11.0.10586.0 - 11.0.10586.102";
    VULN = TRUE ;
  }
}

if(VULN)
{
  report = 'File checked:     ' + sysPath + "\system32\Mshtml.dll" + '\n' +
           'File version:     ' + dllVer  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
