###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_ms08-023.nasl 9351 2018-04-06 07:05:43Z cfischer $
#
# Description: Microsoft 'hxvz.dll' ActiveX Control Memory Corruption Vulnerability (948881)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_solution = "Run Windows Update and update the listed hotfixes or download and
  update mentioned hotfixes in the advisory from the below link,
  http: http://www.microsoft.com/technet/security/bulletin/ms08-023.mspx

  Workaround:
  Set the killbit for the following CLSIDs,
  {314111b8-a502-11d2-bbca-00c04f8ec294}, {314111c6-a502-11d2-bbca-00c04f8ec294}";

tag_impact = "Successful exploitation will let the remote attackers execute arbitrary code.
  Impact Level: System.";
tag_affected = "Microsoft Windows 2K  Service Pack 4 and prior
  Microsoft Windows XP  Service Pack 2 and prior
  Microsoft Windows 2K3 Service Pack 2 and prior
  Microsoft Windows Vista Service Pack 1 and prior.
  Microsoft Windows Server 2008 Service Pack 1/2 and prior.";
tag_insight = "The flaw is due to an error in 'hxvz.dll' ActiveX control.";
tag_summary = "This host is missing a critical security update according to
  Microsoft Bulletin MS08-023.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.801491");
  script_version("$Revision: 9351 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2011-01-10 14:22:58 +0100 (Mon, 10 Jan 2011)");
  script_bugtraq_id(28606);
  script_cve_id("CVE-2008-1086");
  script_tag(name:"cvss_base", value:"9.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_name("Microsoft 'hxvz.dll' ActiveX Control Memory Corruption Vulnerability (948881)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/29714");
  script_xref(name : "URL" , value : "http://xforce.iss.net/xforce/xfdb/41464");
  script_xref(name : "URL" , value : "http://securitytracker.com/alerts/2008/Apr/1019800.html");
  script_xref(name : "URL" , value : "http://www.microsoft.com/technet/security/bulletin/MS10-023.mspx");

  script_tag(name:"qod_type", value:"registry");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2011 Greenbone Networks GmbH");
  script_family("Windows : Microsoft Bulletins");
  script_dependencies("secpod_reg_enum.nasl");
  script_require_ports(139, 445);
  script_mandatory_keys("SMB/WindowsVersion");

  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  exit(0);
}


include("smb_nt.inc");
include("secpod_reg.inc");
include("secpod_activex.inc");

## Check For OS and Service Packs
if(hotfix_check_sp(win2k:5, xp:4, win2003:3, winVista:3, win2008:3) <= 0){
  exit(0);
}

## MS08-023 Hotfix check
if(hotfix_missing(name:"948881") == 0){
  exit(0);
}

## CLSID List
clsids = make_list(
  "{314111b8-a502-11d2-bbca-00c04f8ec294}",
  "{314111c6-a502-11d2-bbca-00c04f8ec294}"
 );

foreach clsid (clsids)
{
  ## Check if Kill-Bit is set for ActiveX control
  if(is_killbit_set(clsid:clsid) == 0)
  {
    security_message(0);
    exit(0);
  }
}
