###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_dla_1349.nasl 10219 2018-06-15 12:00:55Z cfischer $
#
# Auto-generated from advisory DSA 1349-1 using nvtgen 1.0
# Script version: 1.0
#
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
  script_oid("1.3.6.1.4.1.25623.1.0.891349");
  script_version("$Revision: 10219 $");
  script_cve_id("CVE-2017-5715");
  script_name("Debian LTS Advisory ([SECURITY] [DLA 1349-1] linux-tools security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-06-15 14:00:55 +0200 (Fri, 15 Jun 2018) $");
  script_tag(name:"creation_date", value:"2018-04-17 00:00:00 +0200 (Tue, 17 Apr 2018)");
  script_tag(name:"cvss_base", value:"4.7");
  script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:C/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://lists.debian.org/debian-lts-announce/2018/04/msg00014.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages", re:"ssh/login/release=DEB7\.[0-9]+");
  script_tag(name:"affected", value:"linux-tools on Debian Linux");
  script_tag(name:"insight", value:"This package depends on the package containing the 'perf' performance
analysis tools for the latest Linux kernel.");
  script_tag(name:"solution", value:"For Debian 7 'Wheezy', these problems have been fixed in version
3.2.101-1.

We recommend that you upgrade your linux-tools packages.");
  script_tag(name:"summary",  value:"This update doesn't fix a vulnerability in linux-tools, but provides
support for building Linux kernel modules with the 'retpoline'
mitigation for CVE-2017-5715 (Spectre variant 2).

This update also includes bug fixes from the upstream Linux 3.2 stable
branch up to and including 3.2.101.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"linux-kbuild-3.2", ver:"3.2.101-1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"linux-tools-3.2", ver:"3.2.101-1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
# nb: The two versions here differs from the advisory (preceding 1.1.1+) and was manually changed.
# Take care of this when overriding this NVT with a new auto-generated one.
if ((res = isdpkgvuln(pkg:"usbip", ver:"1.1.1+3.2.101-1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libusbip-dev", ver:"1.1.1+3.2.101-1", rls_regex:"DEB7\.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99);
}
