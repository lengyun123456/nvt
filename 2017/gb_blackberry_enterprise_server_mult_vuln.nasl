###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_blackberry_enterprise_server_mult_vuln.nasl 5012 2017-01-16 09:54:11Z ckuerste $
#
# BlackBerry Enterprise Server Multiple Vulnerabilities
#
# Authors:
# Christian Kuersteiner <christian.kuersteiner@greenbone.net>
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH
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

CPE = "cpe:/a:blackberry:enterprise_server";

if (description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.106519");
  script_version("$Revision: 5012 $");
  script_tag(name: "last_modification", value: "$Date: 2017-01-16 10:54:11 +0100 (Mon, 16 Jan 2017) $");
  script_tag(name: "creation_date", value: "2017-01-16 10:12:31 +0700 (Mon, 16 Jan 2017)");
  script_tag(name:"cvss_base", value: "6.4");
  script_tag(name:"cvss_base_vector", value: "AV:N/AC:L/Au:N/C:P/I:P/A:N");

  script_cve_id("CVE-2016-3128", "CVE-2016-3130");

  script_tag(name: "qod_type", value: "remote_banner");

  script_tag(name: "solution_type", value: "VendorFix");

  script_name("BlackBerry Enterprise Server Multiple Vulnerabilities");

  script_category(ACT_GATHER_INFO);

  script_copyright("This script is Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("gb_blackberry_enterprise_server_detect.nasl");
  script_mandatory_keys("blackberry_bes/installed");

  script_tag(name: "summary", value: "BlackBerry Enterprise Server 12 is prone to multiple vulnerabilities.");

  script_tag(name: "vuldetect", value: "Checks the version.");

  script_tag(name: "insight", value: "BlackBerry Enterprise Server 12 is prone to multiple vulnerabilities:

- A spoofing vulnerability in the Core of BlackBerry Enterprise Server (BES) 12 allows remote attackers to enroll
an illegitimate device to the BES, gain access to device parameters for the BES, or send false information to the
BES by gaining access to specific information about a device that was legitimately enrolled on the BES.
(CVE-2016-3128)

- An information disclosure vulnerability in the Core and Management Console in BlackBerry Enterprise Server (BES)
12 allows remote attackers to obtain local or domain credentials of an administrator or user account by sniffing
traffic between the two elements during a login attempt.");

  script_tag(name: "affected", value: "BlackBerry Enterprise Server 12 version 12.5.2 and prior.");

  script_tag(name: "solution", value: "Upgrade to Version 12.6 or later");

  script_xref(name: "URL", value: "http://support.blackberry.com/kb/articleDetail?articleNumber=000038913");
  script_xref(name: "URL", value: "http://support.blackberry.com/kb/articleDetail?articleNumber=000038914");

  exit(0);
}

include("host_details.inc");
include("version_func.inc");

if (!port = get_app_port(cpe: CPE))
  exit(0);

if (!version = get_app_version(cpe: CPE, port: port))
  exit(0);

if (version_is_less(version: version, test_version: "12.6")) {
  report = report_fixed_ver(installed_version: version, fixed_version: "12.6");
  security_message(port: port, data: report);
  exit(0);
}

exit(0);
