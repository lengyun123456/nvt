##############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_isc_bind_nxdomain_redirect_dos_vuln_win.nasl 7543 2017-10-24 11:02:02Z cfischer $
#
# ISC BIND 'nxdomain-redirect' Feature Response DoS Vulnerability (Windows)
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

CPE = "cpe:/a:isc:bind";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.810291");
  script_version("$Revision: 7543 $");
  script_cve_id("CVE-2016-9778");
  script_bugtraq_id(95388);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 13:02:02 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2017-01-16 16:59:09 +0530 (Mon, 16 Jan 2017)");
  script_tag(name:"qod_type", value:"remote_banner");
  script_name("ISC BIND 'nxdomain-redirect' Feature Response DoS Vulnerability (Windows)");

  script_tag(name: "summary" , value:"The host is installed with ISC BIND and is
  prone to denial of service vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name: "insight" , value:"The flaw exists due to an error in handling 
  certain queries when a server is using the nxdomain-redirect feature.");

  script_tag(name:"impact", value:"Successful exploitation will allow remote
  attackers to cause a denial of service (assertion failure and daemon exit) via
  crafted data.

  Impact Level: Application");

  script_tag(name:"affected", value:"ISC BIND 9.9.8-S1 through 9.9.8-S3, 
  9.9.9-S1 through 9.9.9-S6 and 9.11.0 through 9.11.0-P1 on Windows.");

  script_tag(name:"solution", value:"Upgrade to ISC BIND version 9.11.0-P2 or 9.9.9-S7 
  later on Windows. For updates refer to https://www.isc.org");

  script_tag(name:"solution_type", value:"VendorFix");

  script_xref(name : "URL" , value : "https://kb.isc.org/article/AA-01441/0");

  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Denial of Service");
  script_dependencies("bind_version.nasl", "os_detection.nasl");
  script_mandatory_keys("ISC BIND/installed", "Host/runs_windows");
  exit(0);
}

include("version_func.inc");
include("host_details.inc");
include("revisions-lib.inc");

## Get port
if( ! bindPort = get_app_port( cpe:CPE ) ) exit( 0 );
if( ! infos = get_app_version_and_proto( cpe:CPE, port:bindPort ) ) exit( 0 );

bindVer = infos["version"];
proto = infos["proto"];

if(bindVer =~ "^(9\.)")
{
  if(bindVer =~ "^(9\.9\.9\.S[1-6])" || bindVer =~ "^(9\.9\.8\.S[1-3])")
  {
    fix = "9.9.9-S7";
    VULN = TRUE;
  }

  else if(bindVer =~ "^(9\.11\.0)")
  {
    if(version_is_less(version:bindVer, test_version: "9.11.0.P2"))
    {
      fix = "9.11.0-P2";
      VULN = TRUE;
    }
  }
}

if(VULN)
{
  report = report_fixed_ver(installed_version:bindVer, fixed_version:fix);
  security_message(data:report, port:bindPort, proto:proto);
  exit(0);
}

exit(99);