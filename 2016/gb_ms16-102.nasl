###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms16-102.nasl 5568 2017-03-14 10:00:33Z teissa $
#
# Microsoft Windows PDF Library Remote Code Execution Vulnerability (3182248)
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.808647");
  script_version("$Revision: 5568 $");
  script_cve_id("CVE-2016-3319");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-03-14 11:00:33 +0100 (Tue, 14 Mar 2017) $");
  script_tag(name:"creation_date", value:"2016-08-10 09:19:34 +0530 (Wed, 10 Aug 2016)");
  script_name("Microsoft Windows PDF Library Remote Code Execution Vulnerability (3182248)");

  script_tag(name:"summary", value:"This host is missing an important security
  update according to Microsoft Bulletin MS16-102");

  script_tag(name:"vuldetect", value:"Get the vulnerable file version and
  check appropriate patch is applied or not.");

  script_tag(name:"insight", value:"The flaw is due to Windows PDF Library
  improperly handles objects in memory."); 

  script_tag(name:"impact", value:"Successful exploitation will allow a
  remote attacker to execute arbitrary code in the context of the current user.

  Impact Level: System");

  script_tag(name:"affected", value:"
  Microsoft Windows 8.1 x32/x64 Edition
  Microsoft Windows Server 2012/2012R2
  Microsoft Windows 10 x32/x64
  Microsoft Windows 10 Version 1511 x32/x64");

  script_tag(name:"solution", value:"Run Windows Update and update the
  listed hotfixes or download and update mentioned hotfixes in the advisory
  from the below link,
  https://technet.microsoft.com/library/security/MS16-102");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name : "URL" , value : "https://support.microsoft.com/en-us/kb/3182248");
  script_xref(name : "URL" , value : "https://technet.microsoft.com/en-us/library/security/ms16-102");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2016 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Variables Initialization
sysPath = "";
sysVer = "";

## Check for OS and Service Pack
if(hotfix_check_sp(win2012:1, win2012R2:1, win8_1:1, win8_1x64:1,
                   win10:1, win10x64:1) <= 0){
  exit(0);
}

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

dllVer1 = fetch_file_version(sysPath, file_name:"System32\Glcndfilter.dll");
dllVer2 = fetch_file_version(sysPath, file_name:"System32\Windows.data.pdf.dll");
if(!dllVer1 && !dllVer2){
  exit(0);
}

# Windows server 2012
if(hotfix_check_sp(win2012:1) > 0)
{
  ## Check for Glcndfilter.dll version
  if(version_is_less(version:dllVer1, test_version:"6.2.9200.21924"))
  {
     Vulnerable_range = "Less than 6.2.9200.21924";
     VULN1 = TRUE ;
  }
}

## Windows 8.1 and Server 2012R2
else if(hotfix_check_sp(win8_1:1, win8_1x64:1, win2012R2:1) > 0)
{
  ## Check for Glcndfilter.dll version
  if(version_is_less(version:dllVer1, test_version:"6.3.9600.18403"))
  {
    Vulnerable_range = "Less than 6.3.9600.18403";
    VULN1 = TRUE ;
  }
}

##Windows 10
else if(hotfix_check_sp(win10:1, win10x64:1) > 0 && dllVer2)
{
  ## Check for Windows.data.pdf.dll version
  if(version_is_less(version:dllVer2, test_version:"10.0.10240.17071"))
  {
    Vulnerable_range = "Less than 10.0.10240.17071";
    VULN2 = TRUE ;
  }
  ##Windows 10 Version 1511
  else if(version_in_range(version:dllVer2, test_version:"10.0.10586.0", test_version2:"10.0.10586.544"))
  {
    Vulnerable_range = "10.0.10586.0 - 10.0.10586.544";
    VULN2 = TRUE ;
  }
}

if(VULN2)
{
  report = 'File checked:     ' + sysPath + "\system32\windows.data.pdf.dll"+ '\n' +
           'File version:     ' + dllVer2  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;   
  security_message(data:report);
  exit(0);
}

if(VULN1)
{
  report = 'File checked:     ' + sysPath + "\system32\Glcndfilter.dll" + '\n' +
           'File version:     ' + dllVer1  + '\n' +
           'Vulnerable range: ' + Vulnerable_range + '\n' ;
  security_message(data:report);
  exit(0);
}
