###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_mult_vuln01_jul14.nasl 5621 2017-03-20 13:56:15Z cfi $
#
# PHP Multiple Vulnerabilities - 01 - Jul14
#
# Authors:
# Shakeel <bshakeel@secpod.com>
#
# Copyright:
# Copyright (C) 2014 Greenbone Networks GmbH, http://www.greenbone.net
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

CPE = "cpe:/a:php:php";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.804683");
  script_version("$Revision: 5621 $");
  script_cve_id("CVE-2014-3478", "CVE-2014-3515", "CVE-2014-0207", "CVE-2014-3487",
                "CVE-2014-3479", "CVE-2014-3480");
  script_bugtraq_id(68239, 68237, 68243, 68120, 68241, 68238);
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"last_modification", value:"$Date: 2017-03-20 14:56:15 +0100 (Mon, 20 Mar 2017) $");
  script_tag(name:"creation_date", value:"2014-07-18 16:56:10 +0530 (Fri, 18 Jul 2014)");
  script_name("PHP Multiple Vulnerabilities - 01 - Jul14");
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  tag_summary = "This host is installed with PHP and is prone to multiple vulnerabilities.";

  tag_vuldetect = "Get the installed version of PHP with the help of detect NVT and check
  the version is vulnerable or not.";

  tag_insight = "The flaws exist due to,
  - A buffer overflow in the 'mconvert' function in softmagic.c script.
  - Two type confusion errors when deserializing ArrayObject and SPLObjectStorage objects.
  - An unspecified boundary check issue in the 'cdf_read_short_sector' function related to Fileinfo.
  - Some boundary checking issues in the 'cdf_read_property_info', 'cdf_count_chain' and
  'cdf_check_stream_offset' functions in cdf.c related to Fileinfo.";

  tag_impact = "Successful exploitation will allow remote attackers to conduct denial of
  service attacks or potentially execute arbitrary code.

  Impact Level: Application";

  tag_affected = "PHP version 5.4.x before 5.4.30 and 5.5.x before 5.5.14";

  tag_solution = "Upgrade to PHP version 5.4.30 or 5.5.14 or later,
  For updates refer to http://php.net";

  script_tag(name:"summary", value:tag_summary);
  script_tag(name:"vuldetect", value:tag_vuldetect);
  script_tag(name:"insight", value:tag_insight);
  script_tag(name:"impact", value:tag_impact);
  script_tag(name:"affected", value:tag_affected);
  script_tag(name:"solution", value:tag_solution);

  script_xref(name:"URL", value:"http://php.net/ChangeLog-5.php");
  script_xref(name:"URL", value:"http://secunia.com/advisories/59575");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( vers =~ "^(5\.(4|5))" ) {
  if( version_in_range( version:vers, test_version:"5.5.0", test_version2:"5.5.13" ) ||
      version_in_range( version:vers, test_version:"5.4.0", test_version2:"5.4.29" ) ) {
    report = report_fixed_ver( installed_version:vers, fixed_version:"5.4.30/5.5.14" );
    security_message( port:port, data:report );
    exit( 0 );
  }
}

exit( 99 );