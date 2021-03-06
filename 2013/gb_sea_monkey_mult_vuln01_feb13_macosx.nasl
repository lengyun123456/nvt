###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_sea_monkey_mult_vuln01_feb13_macosx.nasl 9353 2018-04-06 07:14:20Z cfischer $
#
# SeaMonkey Multiple Vulnerabilities -01 Feb13 (Mac OS X)
#
# Authors:
# Thanga Prakash S <tprakash@secpod.com>
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

tag_impact = "Successful exploitation will allow attackers to execute arbitrary code,
  memory corruption, bypass certain security restrictions and compromise
  a user's system.
  Impact Level: System/Application";

tag_affected = "SeaMonkey Version prior to 2.16 on Mac OS X";
tag_insight = "- Error when handling a WebIDL object
  - Error in displaying the content of a 407 response of a proxy
  - Unspecified errors in 'nsSaveAsCharset::DoCharsetConversion()' function,
    Chrome Object Wrappers (COW) and in System Only Wrappers (SOW).
  - Use-after-free error in the below functions
    'nsDisplayBoxShadowOuter::Paint()'
    'nsPrintEngine::CommonPrint()'
    'nsOverflowContinuationTracker::Finish()'
    'nsImageLoadingContent::OnStopContainer()'
  - Out-of-bound read error in below functions
    'ClusterIterator::NextCluster()'
    'nsCodingStateMachine::NextState()'
    'mozilla::image::RasterImage::DrawFrameTo()', when rendering GIF images.";
tag_solution = "Upgrade to SeaMonkey version 2.16 or later,
  For updates refer to http://www.mozilla.com/en-US/seamonkey";
tag_summary = "This host is installed with SeaMonkey and is prone to multiple
  vulnerabilities.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803429");
  script_version("$Revision: 9353 $");
  script_cve_id("CVE-2013-0784", "CVE-2013-0783", "CVE-2013-0782", "CVE-2013-0781",
                "CVE-2013-0780", "CVE-2013-0779", "CVE-2013-0778", "CVE-2013-0777",
                "CVE-2013-0765", "CVE-2013-0772", "CVE-2013-0773", "CVE-2013-0774",
                "CVE-2013-0775", "CVE-2013-0776");
  script_bugtraq_id(58040, 58037, 58047, 58049, 58043, 58051, 58050, 58048, 58036,
                    58034, 58041, 58038, 58042, 58044);
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:14:20 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-02-21 19:46:30 +0530 (Thu, 21 Feb 2013)");
  script_name("SeaMonkey Multiple Vulnerabilities -01 Feb13 (Mac OS X)");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/52249");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/52280");
  script_xref(name : "URL" , value : "https://bugzilla.mozilla.org/show_bug.cgi?id=827070");
  script_xref(name : "URL" , value : "http://packetstormsecurity.com/files/cve/CVE-2013-0784");
  script_xref(name : "URL" , value : "http://www.mozilla.org/security/announce/2013/mfsa2013-28.html");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2013 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl", "ssh_authorization_init.nasl");
  script_require_keys("SeaMonkey/MacOSX/Version");
  script_tag(name : "impact" , value : tag_impact);
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "summary" , value : tag_summary);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("version_func.inc");

# Variable initialization
ffVer = "";

# Get the version from the kb
ffVer = get_kb_item("SeaMonkey/MacOSX/Version");

if(ffVer)
{
  # Check for vulnerable version
  if(version_is_less(version:ffVer, test_version:"2.16"))
  {
    security_message(0);
    exit(0);
  }
}
