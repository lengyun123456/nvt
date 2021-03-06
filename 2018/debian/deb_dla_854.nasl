###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_854.nasl 10219 2018-06-15 12:00:55Z cfischer $
#
# Auto-generated from advisory DLA 854-1 using nvtgen 1.0
# Script version:1.0
# #
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.890854");
  script_version("$Revision: 10219 $");
  script_cve_id("CVE-2017-6009", "CVE-2017-6010", "CVE-2017-6011");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 854-1] icoutils security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 14:00:55 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-01-12 00:00:00 +0100 (Fri, 12 Jan 2018)");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2017/03/msg00011.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"icoutils on Debian Linux");
  script_tag(name:"insight", value:"Icoutils is a set of programs that deal with MS Windows icons and
cursors. Resources such as icons and cursors can be extracted from MS
Windows executable and library files with 'wrestool'. Conversion of
these files to and from PNG images is done with 'icotool'. 'extresso'
automates these tasks with the help of special resource scripts.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
0.29.1-5deb7u2.

We recommend that you upgrade your icoutils packages.");
  script_tag(name:"summary",  value:"Icoutils is a set of programs that deal with MS Windows icons and
cursors. Resources such as icons and cursors can be extracted from
MS Windows executable and library files with wrestool.

Three vulnerabilities has been found in these tools.

CVE-2017-6009

A buffer overflow was observed in wrestool.

CVE-2017-6010

A buffer overflow was observed in the extract_icons function.
This issue can be triggered by processing a corrupted ico file
and will result in an icotool crash.

CVE-2017-6011

An out-of-bounds read leading to a buffer overflow was observed
icotool.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"icoutils", ver:"0.29.1-5deb7u2", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
