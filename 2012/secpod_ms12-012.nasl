###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ms12-012.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# MS Windows Color Control Panel Remote Code Execution Vulnerability (2643719)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 SecPod, http://www.secpod.com
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

tag_impact = "Successful exploitation allows an attackers to use the vulnerable application
  to open a file from a network share location that contains a specially
  crafted Dynamic Link Library (DLL) file.
  Impact Level: System/Application";
tag_affected = "Microsoft Windows Server 2008 Service Pack 2 and prior.";
tag_insight = "The flaw is due to a Color Control Panel library used by the Color
  Control Panel application is loading libraries in an insecure manner.";
tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http://technet.microsoft.com/en-us/security/bulletin/ms12-012";
tag_summary = "This host is missing an important security update according to
  Microsoft Bulletin MS12-012.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.902791");
  script_version("$Revision: 9352 $");
  script_bugtraq_id(44157);
  script_cve_id("CVE-2010-5082");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-02-15 11:45:39 +0530 (Wed, 15 Feb 2012)");
  script_name("MS Windows Color Control Panel Remote Code Execution Vulnerability (2643719)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/41874/");
  script_xref(name : "URL" , value : "http://securitytracker.com/id/1026682");
  script_xref(name : "URL" , value : "http://technet.microsoft.com/en-us/security/bulletin/ms12-012");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2012 SecPod");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("version_func.inc");
include("secpod_smb_func.inc");

## Check for OS and Service Pack
if(hotfix_check_sp(win2008:3) <= 0){
  exit(0);
}

## MS12-012 Hotfix (2643719)
if(hotfix_missing(name:"2643719") == 0){
  exit(0);
}

## Variable Initiazation
sysPath = "";
exeVer = "";

## Get System Path
sysPath = smb_get_systemroot();
if(!sysPath ){
  exit(0);
}

## Get Version of Colorcpl.exe file
exeVer = fetch_file_version(sysPath, file_name:"system32\Colorcpl.exe");
if(!exeVer){
  exit(0);
}

## Windows Vista and Windows Server 2008
if(hotfix_check_sp(win2008:3) > 0)
{
  ## Check for Colorcpl.exe version
  if(version_is_less(version:exeVer, test_version:"6.0.6002.18552")||
     version_in_range(version:exeVer, test_version:"6.0.6002.20000", test_version2:"6.0.6002.22756")){
    security_message(0);
  }
}
