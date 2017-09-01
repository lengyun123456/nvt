###############################################################################
# OpenVAS Vulnerability Test
# Id: gb_mozilla_firefox_mfsa_2017-18_2017-19_macosx.nasl 32268 2016-02-24 14:01:01Z antu123 $
#
# Mozilla Firefox Security Updates(mfsa_2017-18_2017-19)-MAC OS X
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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

CPE = "cpe:/a:mozilla:firefox";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811572");
  script_version("$Revision: 6892 $");
  script_cve_id("CVE-2017-7798", "CVE-2017-7800", "CVE-2017-7801", "CVE-2017-7809", 
                "CVE-2017-7784", "CVE-2017-7802", "CVE-2017-7785", "CVE-2017-7786", 
                "CVE-2017-7806", "CVE-2017-7753", "CVE-2017-7787", "CVE-2017-7807", 
                "CVE-2017-7792", "CVE-2017-7791", "CVE-2017-7808", "CVE-2017-7779",
                "CVE-2017-7781", "CVE-2017-7803", "CVE-2017-7799", "CVE-2017-7783", 
                "CVE-2017-7788", "CVE-2017-7789", "CVE-2017-7797", "CVE-2017-7780");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"$Date: 2017-08-10 15:03:58 +0200 (Thu, 10 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-10 11:40:50 +0530 (Thu, 10 Aug 2017)");
  script_name("Mozilla Firefox Security Updates( mfsa_2017-18_2017-19 )-MAC OS X");

  script_tag(name: "summary" , value:"This host is installed with Mozilla Firefox
  and is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect" , value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The multiple flaws exists due to,
  - XUL injection in the style editor in devtools.
  - Use-after-free in WebSockets during disconnection.
  - Use-after-free with marquee during window resizing.
  - Use-after-free while deleting attached editor DOM node.
  - Use-after-free with image observers.
  - Use-after-free resizing image elements.
  - Buffer overflow manipulating ARIA attributes in DOM.
  - Buffer overflow while painting non-displayable SVG.
  - Use-after-free in layer manager with SVG.
  - Out-of-bounds read with cached style data and pseudo-elements.
  - Same-origin policy bypass with iframes through page reloads.
  - Domain hijacking through AppCache fallback.
  - Buffer overflow viewing certificates with an extremely long OID.
  - Spoofing following page navigation with data: protocol and modal alerts.
  - CSP information leak with frame-ancestors containing paths.
  - Elliptic curve point addition error when using mixed Jacobian-affine coordinates.
  - CSP containing sandbox improperly applied.
  - Self-XSS XUL injection in about:webrtc.
  - DOS attack through long username in URL.
  - Sandboxed about:srcdoc iframes do not inherit CSP directives.
  - Failure to enable HSTS when two STS headers are sent for a connection.
  - Response header name interning leaks across origins.
  - Memory safety bugs.");

  script_tag(name: "impact" , value:"Successful exploitation of these
  vulnerabilities will allow remote attackers to run arbitrary code, 
  obtain sensitive information, cause denial of service, conduct cross-site 
  scripting (XSS) attack, spoofing attack and bypass existing memory 
  protections.

  Impact Level: Application.");

  script_tag(name: "affected" , value:"Mozilla Firefox version before 55.0 on MAC OS X.");

  script_tag(name: "solution" , value:"Upgrade to Mozilla Firefox version 55.0
  or later, For updates refer to http://www.mozilla.com/en-US/firefox/all.html");

  script_tag(name:"solution_type", value:"VendorFix");

  script_tag(name:"qod_type", value:"executable_version");

  script_xref(name:"URL", value:"https://www.mozilla.org/en-US/security/advisories/mfsa2017-18/");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("General");
  script_dependencies("gb_mozilla_prdts_detect_macosx.nasl");
  script_mandatory_keys("Mozilla/Firefox/MacOSX/Version");
  exit(0);
}

include("host_details.inc");
include("version_func.inc");

## Variable Initialization
ffVer = "";

## Get version
if(!ffVer = get_app_version(cpe:CPE)){
   exit(0);
}

# Check for vulnerable version
if(version_is_less(version:ffVer, test_version:"55.0"))
{
  report = report_fixed_ver(installed_version:ffVer, fixed_version:"55.0");
  security_message(data:report);
  exit(0);
}