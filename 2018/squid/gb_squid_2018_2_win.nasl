###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_squid_2018_2_win.nasl 9081 2018-03-12 07:31:35Z cfischer $
#
# Squid Proxy Cache Security Update Advisory SQUID-2018:2
#
# Authors:
# Tameem Eissa <tameem.eissa@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

CPE = 'cpe:/a:squid-cache:squid';

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.107297");
  script_version("$Revision: 9081 $");
  script_cve_id("CVE-2018-1000027");
  script_tag(name:"last_modification", value:"$Date: 2018-03-12 08:31:35 +0100 (Mon, 12 Mar 2018) $");
  script_tag(name: "creation_date", value: "2018-02-09 19:08:28 +0100 (Fri, 09 Feb 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");

  # Only vuln with other configuration deployments described in the Advisory
  script_tag(name: "qod_type", value: "remote_banner_unreliable");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("Squid Proxy Cache Security Update Advisory SQUID-2018:2");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_squid_detect.nasl");
  script_mandatory_keys("squid_proxy_server/installed");

  script_tag(name: "summary", value: "Squid is vulnerable to denial of service attack 
  when processing ESI responses.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "Due to incorrect pointer handling Squid is vulnerable
  to denial of service attack when processing ESI responses or downloading intermediate CA
  certificates.");

  script_tag(name: "impact", value: "This problem allows a remote server delivering certain 
  ESI response syntax to trigger a denial of service for all clients accessing the Squid service.");

  script_tag(name: "affected", value: "Squid 3.x -> 3.5.27, Squid 4.x -> 4.0.22 with specific
  deployment variants described in the referenced Advisory.");

  script_tag(name: "solution", value: "Updated Packages:

  This bug is fixed by Squid version 4.0.23.

  In addition, patches addressing this problem for the stable
  releases can be found in our patch archives:

  Squid 3.5:
  <http://www.squid-cache.org/Versions/v3/3.5/changesets/SQUID-2018_2.patch>

  Squid 4:
  <http://www.squid-cache.org/Versions/v4/changesets/SQUID-2018_2.patch>

  If you are using a prepackaged version of Squid then please refer
  to the package vendor for availability information on updated
  packages.");

  script_xref(name: "URL", value: "http://www.squid-cache.org/Advisories/SQUID-2018_2.txt");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version =~ "^3\.") {
  if (version_is_less_equal(version: version, test_version: "3.5.27")) {
    report = report_fixed_ver(installed_version: version, fixed_version:"" );
  }
} else if (version =~ "^4\.") {
  if (version_is_less_equal(version: version, test_version: "4.0.22")) {
    report = report_fixed_ver(installed_version: version, fixed_version:"" );
  }
}

if (! isnull (report))
{
    security_message(port: port, data: report);
    exit(0);
}

exit(99);
