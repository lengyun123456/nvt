###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_vmware_workstation_code_exec_n_info_disc_vuln_win.nasl 6588 2017-07-07 08:21:40Z santu $
#
# VMware Workstation Code Execution And Information Disclosure Vulnerabilities (Windows)
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

CPE = "cpe:/a:vmware:workstation";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810969");
  script_version("$Revision: 6588 $");
  script_cve_id("CVE-2017-4902", "CVE-2017-4903", "CVE-2017-4904", "CVE-2017-4905");
  script_bugtraq_id(97163, 97160, 97165, 97164);
  script_tag(name:"cvss_base", value:"7.2");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-07-07 10:21:40 +0200 (Fri, 07 Jul 2017) $");
  script_tag(name:"creation_date", value:"2017-07-03 15:15:42 +0530 (Mon, 03 Jul 2017)");
  script_tag(name:"qod_type", value:"registry");
  script_name("VMware Workstation Code Execution And Information Disclosure Vulnerabilities (Windows)");

  script_tag(name: "summary" , value:"The host is installed with VMware Workstation
  and is prone to information disclosure and multiple code execution 
  vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"Multiple flaws are due to,
  - A heap buffer overflow and uninitialized stack memory usage in SVGA.
  - An uninitialized memory usage in XHCI controller.");

  script_tag(name: "impact" , value:"Successful exploitation will allow a
  guest to execute code on the host and may also lead to information leak.

  Impact Level: System/Application");

  script_tag(name: "affected" , value:"VMware Workstation 12.x before 12.5.5 on 
  Windows.");

  script_tag(name: "solution" , value:"Upgrade to VMware Workstation version 
  12.5.5 or later. For updates refer to http://www.vmware.com");

  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name : "URL" , value : "https://www.vmware.com/security/advisories/VMSA-2017-0006.html");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("General");
  script_dependencies("gb_vmware_prdts_detect_win.nasl");
  script_mandatory_keys("VMware/Workstation/Installed");
  exit(0);
}


include("host_details.inc");
include("version_func.inc");

## Variable Initialization
vmwareVer = "";

## Get version
if(!vmwareVer = get_app_version(cpe:CPE)){
  exit(0);
}

## Grep for vulnerable version
if(vmwareVer =~ "^12\.")
{
  if(version_is_less(version:vmwareVer, test_version:"12.5.5"))
  {
    report = report_fixed_ver(installed_version:vmwareVer, fixed_version:"12.5.5");
    security_message(data:report);
    exit(0);
  }
}
