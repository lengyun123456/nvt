###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_oracle_virtualbox_unspecified_dos_vuln_win.nasl 9352 2018-04-06 07:13:02Z cfischer $
#
# Oracle VM VirtualBox Unspecified Denial of Service Vulnerability (Windows)
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2012 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_insight = "Unspecified error in the VirtualBox Core subcomponent.

  Note: No further information is currently available.";

tag_solution = "Apply the patch from below link,
  http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html

  *****
  NOTE: Ignore this warning, if above mentioned workaround is manually applied.
  *****";

tag_impact = "Successful exploitation allow local users to cause a Denial of Service.
  Impact Level: Application";
tag_affected = "Oracle VM VirtualBox version 3.2, 4.0 and 4.1 on Windows";
tag_summary = "This host is installed with Oracle VM VirtualBox and is prone to
  denial of service vulnerability.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803103");
  script_version("$Revision: 9352 $");
  script_cve_id("CVE-2012-3221");
  script_bugtraq_id(56045);
  script_tag(name:"cvss_base", value:"2.1");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2012-10-19 15:10:56 +0530 (Fri, 19 Oct 2012)");
  script_name("Oracle VM VirtualBox Unspecified Denial of Service Vulnerability (Windows)");

  script_xref(name : "URL" , value : "http://secunia.com/advisories/51007/");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuoct2012-1515893.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("secpod_sun_virtualbox_detect_win.nasl");
  script_require_keys("Oracle/VirtualBox/Win/Ver");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"registry");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

## Variable Initialization
version = "";

## Get version from KB
version = get_kb_item("Oracle/VirtualBox/Win/Ver");
if(version)
{
  ## Check for Oracle VM VirtualBox versions 4.1, 4.0 and 3.2
  if(version_is_equal(version:version, test_version:"4.1") ||
     version_is_equal(version:version, test_version:"4.0") ||
     version_is_equal(version:version, test_version:"3.2")){
    security_message(0);
  }
}
