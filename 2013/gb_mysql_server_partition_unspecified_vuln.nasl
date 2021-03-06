###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_mysql_server_partition_unspecified_vuln.nasl 9986 2018-05-28 14:50:35Z cfischer $
#
# MySQL Server Component Partition Unspecified Vulnerability
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

CPE = "cpe:/a:mysql:mysql";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.803801");
  script_version("$Revision: 9986 $");
  script_cve_id("CVE-2012-1697");
  script_bugtraq_id(53064);
  script_tag(name:"last_modification", value:"$Date: 2018-05-28 16:50:35 +0200 (Mon, 28 May 2018) $");
  script_tag(name:"creation_date", value:"2013-06-04 13:21:11 +0530 (Tue, 04 Jun 2013)");
  script_tag(name:"cvss_base", value:"4.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:N/I:N/A:P");
  script_name("MySQL Server Component Partition Unspecified Vulnerability");
  script_xref(name : "URL" , value : "http://secunia.com/advisories/48890");
  script_xref(name : "URL" , value : "http://www.oracle.com/technetwork/topics/security/cpuapr2012-366314.html#AppendixMSQL");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("Databases");
  script_tag(name:"qod_type", value:"remote_banner");
  script_dependencies("mysql_version.nasl", "os_detection.nasl");
  script_require_ports("Services/mysql", 3306);
  script_mandatory_keys("MySQL/installed","Host/runs_windows");
  script_tag(name : "impact" , value : "Successful exploitation could allow remote authenticated users to affect
  availability via unknown vectors.

  Impact Level: Application");
  script_tag(name : "affected" , value : "MySQL version 5.5.x before 5.5.22");
  script_tag(name : "insight" , value : "Unspecified error in MySQL Server component related to Partition.");
  script_tag(name : "solution" , value : "Apply the patch from the below link,
  http://www.oracle.com/technetwork/topics/security/cpuapr2012-366314.html");
  script_tag(name : "summary" , value : "The host is running MySQL and is prone to unspecified
  vulnerability.");

  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!sqlPort = get_app_port(cpe:CPE)) exit(0);
mysqlVer = get_app_version(cpe:CPE, port:sqlPort);

if(mysqlVer && mysqlVer =~ "^(5\.5)")
{
  if(version_in_range(version:mysqlVer, test_version:"5.5", test_version2:"5.5.21"))
  {
    security_message(sqlPort);
    exit(0);
  }
}
