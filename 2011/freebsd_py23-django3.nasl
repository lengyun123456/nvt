#
#VID 14a37474-1383-11e0-8a58-00215c6a37bb
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 14a37474-1383-11e0-8a58-00215c6a37bb
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#

include("revisions-lib.inc");
tag_insight = "The following packages are affected:
   py23-django
   py24-django
   py25-django
   py26-django
   py27-django
   py30-django
   py31-django
   py23-django-devel
   py24-django-devel
   py25-django-devel
   py26-django-devel
   py27-django-devel
   py30-django-devel
   py31-django-devel";
tag_solution = "Update your system with the appropriate patches or
software upgrades.

https://bugzilla.redhat.com/show_bug.cgi?id=665373
http://secunia.com/advisories/42715/
http://www.vuxml.org/freebsd/14a37474-1383-11e0-8a58-00215c6a37bb.html";
tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.68824");
 script_version("$Revision: 9351 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:05:43 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2011-01-24 17:55:59 +0100 (Mon, 24 Jan 2011)");
 script_tag(name:"cvss_base", value:"4.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:S/C:P/I:N/A:N");
  script_cve_id("CVE-2010-4534");
 script_bugtraq_id(45562,45563);
 script_name("django -- multiple vulnerabilities");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2011 E-Soft Inc. http://www.securityspace.com");
 script_family("FreeBSD Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/freebsdrel", "login/SSH/success");
 script_tag(name : "insight" , value : tag_insight);
 script_tag(name : "solution" , value : tag_solution);
 script_tag(name : "summary" , value : tag_summary);
 script_tag(name:"qod_type", value:"package");
 script_tag(name:"solution_type", value:"VendorFix");
 exit(0);
}

#
# The script code starts here
#

include("pkg-lib-bsd.inc");

txt = "";
vuln = 0;
bver = portver(pkg:"py23-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py23-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py23-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py24-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py24-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py24-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py25-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py25-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py25-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py26-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py26-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py26-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py27-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py27-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py27-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py30-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py30-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py30-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py31-django");
if(!isnull(bver) && revcomp(a:bver, b:"1.2")>0 && revcomp(a:bver, b:"1.2.4")<0) {
    txt += 'Package py31-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"1.1")>0 && revcomp(a:bver, b:"1.1.3")<0) {
    txt += 'Package py31-django version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py23-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py23-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py24-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py24-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py25-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py25-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py26-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py26-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py27-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py27-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py30-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py30-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}
bver = portver(pkg:"py31-django-devel");
if(!isnull(bver) && revcomp(a:bver, b:"15032,1")<0) {
    txt += 'Package py31-django-devel version ' + bver + ' is installed which is known to be vulnerable.\n';
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt));
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
