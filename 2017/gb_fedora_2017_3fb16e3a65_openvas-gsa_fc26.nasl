###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_3fb16e3a65_openvas-gsa_fc26.nasl 6850 2017-08-04 07:23:54Z santu $
#
# Fedora Update for openvas-gsa FEDORA-2017-3fb16e3a65
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.873008");
  script_version("$Revision: 6850 $");
  script_tag(name:"last_modification", value:"$Date: 2017-08-04 09:23:54 +0200 (Fri, 04 Aug 2017) $");
  script_tag(name:"creation_date", value:"2017-08-04 12:46:19 +0530 (Fri, 04 Aug 2017)");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for openvas-gsa FEDORA-2017-3fb16e3a65");
  script_tag(name: "summary", value: "Check the version of openvas-gsa");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "The Greenbone Security Assistant (GSA) is 
a lean web service offering a user web interface for the Open Vulnerability 
Assessment System (OpenVAS). The GSA uses XSL transformation style-sheets that 
converts OMP responses from the OpenVAS infrastructure into presentable HTML.
");
  script_tag(name: "affected", value: "openvas-gsa on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-3fb16e3a65");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/RP3QSOV32ZHOU3HGKZAZ3AAENFR7PEN4");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"openvas-gsa", rpm:"openvas-gsa~7.0.2~2.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
