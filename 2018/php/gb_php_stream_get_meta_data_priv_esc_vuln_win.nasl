###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_php_stream_get_meta_data_priv_esc_vuln_win.nasl 9094 2018-03-14 07:52:16Z cfischer $
#
# PHP 'stream_get_meta_data' Privilege Escalation Vulnerability (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.812513");
  script_version("$Revision: 9094 $");
  script_cve_id("CVE-2016-10712");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-03-14 08:52:16 +0100 (Wed, 14 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-02-20 12:16:20 +0530 (Tue, 20 Feb 2018)");
  script_name("PHP 'stream_get_meta_data' Privilege Escalation Vulnerability (Windows)");

  script_tag(name:"summary", value:"This host is installed with PHP and is prone
  to privilege escalation vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of the detect NVT and check if the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw exists due to error in the function
  stream_get_meta_data of the component File Upload. The manipulation as part
  of a Return Value leads to a privilege escalation vulnerability (Metadata).");

  script_tag(name:"impact", value:"Successfully exploitation will allow an attacker
  to update the 'metadata' and affect on confidentiality, integrity,and availability.

  Impact Level: Application");

  script_tag(name:"affected", value:"PHP versions before 5.5.32, 7.0.x before 
  7.0.3, and 5.6.x before 5.6.18 on Windows.");

  script_tag(name:"solution", value:"Upgrade to PHP version 5.5.32, 7.0.3, 
  or 5.6.18 or later. For updates refer to http://www.php.net");

  script_xref(name:"URL", value:"https://vuldb.com/?id.113055");
  script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=71323");
  script_xref(name:"URL", value:"https://git.php.net/?p=php-src.git;a=commit;h=6297a117d77fa3a0df2e21ca926a92c231819cd5");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner");
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_php_detect.nasl", "os_detection.nasl");
  script_mandatory_keys("php/installed", "Host/runs_windows");
  script_require_ports("Services/www", 80);
  exit(0);
}


include("version_func.inc");
include("host_details.inc");

if(isnull(phpPort = get_app_port(cpe:CPE))) exit(0);

if(!infos = get_app_version_and_location(cpe:CPE, port:phpPort, exit_no_version:TRUE)) exit(0);
phpVers = infos['version'];
path = infos['location'];

if(version_is_less(version:phpVers, test_version:"5.5.32")){
  fix = "5.5.32";
}

else if(version_in_range(version:phpVers, test_version:"7.0.0", test_version2:"7.0.2")){
  fix = "7.0.3";
}

else if(phpVers =~ "^5\.6" && version_is_less(version:phpVers, test_version:"5.6.18")){
  fix = "5.6.18";
}

if(fix)
{
  report = report_fixed_ver(installed_version:phpVers, fixed_version:fix, install_path:path);
  security_message(port:phpPort, data:report);
  exit(0);
}
exit(0);
