#
#VID 9b2a5e88-02b8-11e2-92d1-000d601460a4
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from VID 9b2a5e88-02b8-11e2-92d1-000d601460a4
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
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
   php5
   php52
   php53

CVE-2012-0789
Memory leak in the timezone functionality in PHP before 5.3.9 allows
remote attackers to cause a denial of service (memory consumption) by
triggering many strtotime function calls, which are not properly
handled by the php_date_parse_tzfile cache.";
tag_solution = "Update your system with the appropriate patches or
software upgrades.";

tag_summary = "The remote host is missing an update to the system
as announced in the referenced advisory.";



if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.72401");
 script_tag(name:"cvss_base", value:"5.0");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:P");
 script_cve_id("CVE-2012-0789");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-09-19 11:49:14 -0400 (Wed, 19 Sep 2012)");
 script_name("FreeBSD Ports: php5");

 script_xref(name:"URL", value:"https://bugs.php.net/bug.php?id=53502");
 script_xref(name:"URL", value:"http://www.vuxml.org/freebsd/9b2a5e88-02b8-11e2-92d1-000d601460a4.html");


 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
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
vuln = 0;
txt = "";
bver = portver(pkg:"php5");
if(!isnull(bver) && revcomp(a:bver, b:"5.2")>=0 && revcomp(a:bver, b:"5.2.17_11")<0) {
    txt += "Package php5 version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
if(!isnull(bver) && revcomp(a:bver, b:"5.3")>=0 && revcomp(a:bver, b:"5.3.9")<0) {
    txt += "Package php5 version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
bver = portver(pkg:"php52");
if(!isnull(bver) && revcomp(a:bver, b:"5.2.17_11")<0) {
    txt += "Package php52 version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}
bver = portver(pkg:"php53");
if(!isnull(bver) && revcomp(a:bver, b:"5.3.9")<0) {
    txt += "Package php53 version " + bver + " is installed which is known to be vulnerable.\n";
    vuln = 1;
}

if(vuln) {
    security_message(data:string(txt ));
} else if (__pkg_match) {
    exit(99);
}
