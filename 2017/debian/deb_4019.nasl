###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4019.nasl 7689 2017-11-08 05:46:44Z teissa $
#
# Auto-generated from advisory DSA 4019-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.704019");
  script_version("$Revision: 7689 $");
  script_cve_id("CVE-2017-11446", "CVE-2017-11523", "CVE-2017-11533", "CVE-2017-11535", "CVE-2017-11537", "CVE-2017-11639", "CVE-2017-11640", "CVE-2017-12428", "CVE-2017-12431", "CVE-2017-12432", "CVE-2017-12434", "CVE-2017-12587", "CVE-2017-12640", "CVE-2017-12671", "CVE-2017-13139", "CVE-2017-13140", "CVE-2017-13141", "CVE-2017-13142", "CVE-2017-13143", "CVE-2017-13144", "CVE-2017-13145", "CVE-2017-9500");
  script_name("Debian Security Advisory DSA 4019-1 (imagemagick - security update)");
  script_tag(name:"last_modification", value:"$Date: 2017-11-08 06:46:44 +0100 (Wed, 08 Nov 2017) $");
  script_tag(name:"creation_date", value:"2017-11-05 00:00:00 +0100 (Sun, 05 Nov 2017)");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2017/dsa-4019.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2017 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"imagemagick on Debian Linux");
  script_tag(name:"insight", value:"ImageMagick is a software suite to create, edit, and compose bitmap images.
It can read, convert and write images in a variety of formats (over 100)
including DPX, EXR, GIF, JPEG, JPEG-2000, PDF, PhotoCD, PNG, Postscript,
SVG, and TIFF. Use ImageMagick to translate, flip, mirror, rotate, scale,
shear and transform images, adjust image colors, apply various special
effects, or draw text, lines, polygons, ellipses and B�zier curves.
All manipulations can be achieved through shell commands as well as through
an X11 graphical interface (display).");
  script_tag(name:"solution", value:"For the stable distribution (stretch), this problem has been fixed in
version 8:6.9.7.4+dfsg-11+deb9u2.

We recommend that you upgrade your imagemagick packages.");
  script_tag(name:"summary",  value:"This update fixes several vulnerabilities in imagemagick: Various memory
handling problems and cases of missing or incomplete input sanitising may
result in denial of service, memory disclosure or the execution of
arbitrary code if malformed image files are processed.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"imagemagick", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-6-common", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-6-doc", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-6.q16", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-6.q16hdri", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-common", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"imagemagick-doc", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimage-magick-perl", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimage-magick-q16-perl", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libimage-magick-q16hdri-perl", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-6-headers", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-6.q16-7", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-6.q16-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-6.q16hdri-7", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-6.q16hdri-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagick++-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6-arch-config", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6-headers", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16-3", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16-3-extra", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16hdri-3", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16hdri-3-extra", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-6.q16hdri-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickcore-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-6-headers", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-6.q16-3", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-6.q16-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-6.q16hdri-3", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-6.q16hdri-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libmagickwand-dev", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"perlmagick", ver:"8:6.9.7.4+dfsg-11+deb9u2", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
