###############################################################################
# OpenVAS Vulnerability Test
#
# Fedora Update for python-oauth2 FEDORA-2014-12475
#
# Authors:
# System Generated Check
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
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.868433");
  script_version("$Revision: 6769 $");
  script_tag(name:"last_modification", value:"$Date: 2017-07-20 11:56:33 +0200 (Thu, 20 Jul 2017) $");
  script_tag(name:"creation_date", value:"2014-10-29 05:49:55 +0100 (Wed, 29 Oct 2014)");
  script_cve_id("CVE-2013-4347", "CVE-2013-4346");
  script_tag(name:"cvss_base", value:"5.8");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:P/I:P/A:N");
  script_name("Fedora Update for python-oauth2 FEDORA-2014-12475");
  script_tag(name: "summary", value: "Check the version of python-oauth2");
  script_tag(name: "vuldetect", value: "Get the installed version with the help of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "Oauth2 was originally forked from Leah Culver and Andy Smith's oauth.py
code. Some of the tests come from a fork by Vic Fryzel, while a revamped
Request class and more tests were merged in from Mark Paschal's fork. A
number of notable differences exist between this code and its forefathers:

- 100% unit test coverage.
- The DataStore object has been completely ripped out. While creating unit
  tests for the library I found several substantial bugs with the
  implementation and confirmed with Andy Smith that it was never fully
  baked.
- Classes are no longer prefixed with OAuth.
- The Request class now extends from dict.
- The library is likely no longer compatible with Python 2.3.
- The Client class works and extends from httplib2. It's a thin wrapper
  that handles automatically signing any normal HTTP request you might
  wish to make.
");
  script_tag(name: "affected", value: "python-oauth2 on Fedora 20");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  script_xref(name: "FEDORA", value: "2014-12475");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/pipermail/package-announce/2014-October/141492.html");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2014 Greenbone Networks GmbH");
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

if(release == "FC20")
{

  if ((res = isrpmvuln(pkg:"python-oauth2", rpm:"python-oauth2~1.5.211~8.fc20", rls:"FC20")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}