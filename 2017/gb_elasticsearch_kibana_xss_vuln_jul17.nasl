###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_elasticsearch_kibana_xss_vuln_jul17.nasl 9011 2018-03-02 13:09:15Z cfischer $
#
# Elasticsearch Kibana Cross Site Scripting Vulnerability - Jul17
#
# Authors:
# Kashinath T <tkashinath@secpod.com>
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

CPE = "cpe:/a:elasticsearch:kibana";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.811408");
  script_version("$Revision: 9011 $");
  script_cve_id("CVE-2016-10366");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_tag(name:"last_modification", value:"$Date: 2018-03-02 14:09:15 +0100 (Fri, 02 Mar 2018) $");
  script_tag(name:"creation_date", value:"2017-07-03 20:18:52 +0530 (Mon, 03 Jul 2017)");
  script_name("Elasticsearch Kibana Cross Site Scripting Vulnerability - Jul17");

  script_tag(name:"summary", value:"This host is running Elasticsearch Kibana
  and is prone to cross site scripting vulnerability.");

  script_tag(name:"vuldetect", value:"Get the installed version with the help
  of detect NVT and check the version is vulnerable or not.");

  script_tag(name:"insight", value:"The flaw is due to an improper validation
  of user's input.");

  script_tag(name:"impact", value:"Successful exploitation will lead an attacker to
  execute arbitrary JavaScript in users' browsers.

  Impact Level: Application");

  script_tag(name:"affected", value:"Elasticsearch Kibana version 4.3 prior to 4.6.2");

  script_tag(name:"solution", value:"Upgrade to Elasticsearch Kibana version
  4.6.2 or later. For updates refer to https://www.elastic.co");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_banner_unreliable");
  script_xref(name:"URL", value:"https://www.elastic.co/community/security");
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_category(ACT_GATHER_INFO);
  script_family("Web application abuses");
  script_dependencies("gb_elasticsearch_kibana_detect.nasl");
  script_mandatory_keys("Elasticsearch/Kibana/Installed");
  script_require_ports("Services/www", 5601);
  exit(0);
}

include("version_func.inc");
include("host_details.inc");

if(!kibanaPort = get_app_port(cpe:CPE)){
 exit(0);
}

if(!kibanaVer = get_app_version(cpe:CPE, port:kibanaPort)){
 exit(0);
}

if(version_in_range(version:kibanaVer, test_version:"4.3", test_version2:"4.6.1"))
{
  report = report_fixed_ver(installed_version:kibanaVer, fixed_version:"4.6.2");
  security_message(data:report, port:kibanaPort);
  exit(0);
}
