###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_wordpress_simple-download-monitor_xss_vuln.nasl 8493 2018-01-23 06:43:13Z ckuersteiner $
#
# WordPress Simple Download Monitor Plugin Stored XSS Vulnerabilities
#
# Authors:
# Adrian Steins <adrian.steins@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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

CPE = "cpe:/a:wordpress:wordpress";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.112177");
  script_version("$Revision: 8493 $");
  script_tag(name: "last_modification", value: "$Date: 2018-01-23 07:43:13 +0100 (Tue, 23 Jan 2018) $");
  script_tag(name: "creation_date", value: "2018-01-05 14:08:51 +0100 (Fri, 05 Jan 2018)");
  script_tag(name:"cvss_base", value:"3.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:S/C:N/I:P/A:N");

  script_cve_id("CVE-2018-5212", "CVE-2018-5213");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("WordPress Simple Download Monitor Plugin Stored XSS Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("secpod_wordpress_detect_900182.nasl");
  script_mandatory_keys("wordpress/installed");

  script_tag(name: "summary", value: "The Simple Download Monitor plugin for WordPress has stored-XSS via the sdm_upload and sdm_upload_thumbnail parameter
in an edit action to wp-admin/post.php.");
  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "affected", value: "WordPress Simple Download Monitor plugin before version 3.5.4.");

  script_tag(name: "solution", value: "Update to version 3.5.4 or later.");

  script_xref(name: "URL", value: "https://github.com/Arsenal21/simple-download-monitor/issues/27");
  script_xref(name: "URL", value: "https://wordpress.org/plugins/simple-download-monitor/#developers");

  exit(0);
}

include("host_details.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!dir = get_app_location(cpe: CPE, port: port))
  exit(0);

if (dir == "/")
  dir = "";

res = http_get_cache(port: port, item: dir + "/wp-content/plugins/simple-download-monitor/readme.txt");

if ("Simple Download Monitor" >< res && "Changelog" >< res) {

  vers = eregmatch(pattern: "Stable tag: ([0-9.]+)", string: res);

  if (!isnull(vers[1]) && version_is_less(version: vers[1], test_version: "3.5.4")) {
    report = report_fixed_ver(installed_version: vers[1], fixed_version: "3.5.4");
    security_message(port: port, data: report);
    exit(0);
  }
}
exit(0);
