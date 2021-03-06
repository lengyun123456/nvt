##############################################################################
# OpenVAS Vulnerability Test
# $Id: nopsec_php_5_3_9.nasl 4589 2016-11-22 08:40:50Z cfi $
#
# PHP Version < 5.3.9 Multiple Vulnerabilities
#
# Authors:
# Songhan Yu <syu@nopsec.com>
#
# Copyright:
# Copyright NopSec Inc. 2012, http://www.nopsec.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.110012");
  script_version("$Revision: 4589 $");
  script_tag(name:"last_modification", value:"$Date: 2016-11-22 09:40:50 +0100 (Tue, 22 Nov 2016) $");
  script_tag(name:"creation_date", value:"2012-06-14 13:15:22 +0200 (Thu, 14 Jun 2012)");
  script_tag(name:"cvss_base", value:"6.4");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:P");
  script_cve_id("CVE-2011-4566", "CVE-2011-4885", "CVE-2012-0057", "CVE-2012-0781", "CVE-2012-0788", "CVE-2012-0789");
  script_bugtraq_id(50907, 51193, 51806, 51952, 51992, 52043);
  script_name("PHP Version < 5.3.9 Multiple Vulnerabilities");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_copyright("Copyright NopSec Inc. 2012");
  script_dependencies("gb_php_detect.nasl");
  script_require_ports("Services/www", 80);
  script_mandatory_keys("php/installed");

  tag_solution = "Upgrade PHP to 5.3.9 or versions after.";
  tag_summary = "PHP version < 5.3.9 suffers from multiple vulnerabilities such as DOS by sending crafted requests
  including hash collision parameter values. Several errors exist in some certain functions as well.";

  script_tag(name:"solution", value:tag_solution);
  script_tag(name:"summary", value:tag_summary);

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if( isnull( port = get_app_port( cpe:CPE ) ) ) exit( 0 );
if( ! vers = get_app_version( cpe:CPE, port:port ) ) exit( 0 );

if( version_is_less( version:vers, test_version:"5.3.9" ) ) {
  report = report_fixed_ver( installed_version:vers, fixed_version:"5.3.9" );
  security_message( data:report, port:port );
  exit( 0 );
}

exit( 99 );