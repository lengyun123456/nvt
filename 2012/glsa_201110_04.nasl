#
# OpenVAS Vulnerability Test
# $
# Description: Auto generated from Gentoo's XML based advisory
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
# or at your option, GNU General Public License version 3,
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
tag_insight = "Multiple vulnerabilities were found in Dovecot, the worst of which
    allowing for remote execution of arbitrary code.";
tag_solution = "All Dovecot 1 users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=net-mail/dovecot-1.2.17'
    

All Dovecot 2 users should upgrade to the latest version:

      # emerge --sync
      # emerge --ask --oneshot --verbose '>=net-mail/dovecot-2.0.13'
    

NOTE: This is a legacy GLSA. Updates for all affected architectures are
      available since May 28, 2011. It is likely that your system is
already no
      longer affected by this issue.

http://www.securityspace.com/smysecure/catid.html?in=GLSA%20201110-04
http://bugs.gentoo.org/show_bug.cgi?id=286844
http://bugs.gentoo.org/show_bug.cgi?id=293954
http://bugs.gentoo.org/show_bug.cgi?id=314533
http://bugs.gentoo.org/show_bug.cgi?id=368653";
tag_summary = "The remote host is missing updates announced in
advisory GLSA 201110-04.";

                                                                                
                                                                                
if(description)
{
 script_oid("1.3.6.1.4.1.25623.1.0.70767");
 script_tag(name:"cvss_base", value:"7.5");
 script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
 script_cve_id("CVE-2009-3235", "CVE-2009-3897", "CVE-2010-0745", "CVE-2010-3304", "CVE-2010-3706", "CVE-2010-3707", "CVE-2010-3779", "CVE-2010-3780", "CVE-2011-1929", "CVE-2011-2166", "CVE-2011-2167");
 script_version("$Revision: 9352 $");
 script_tag(name:"last_modification", value:"$Date: 2018-04-06 09:13:02 +0200 (Fri, 06 Apr 2018) $");
 script_tag(name:"creation_date", value:"2012-02-12 10:04:39 -0500 (Sun, 12 Feb 2012)");
 script_name("Gentoo Security Advisory GLSA 201110-04 (Dovecot)");



 script_category(ACT_GATHER_INFO);

 script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
 script_family("Gentoo Local Security Checks");
 script_dependencies("gather-package-list.nasl");
 script_mandatory_keys("ssh/login/gentoo", "ssh/login/pkg");
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

include("pkg-lib-gentoo.inc");
res = "";
report = "";
if((res = ispkgvuln(pkg:"net-mail/dovecot", unaffected: make_list("rge 1.2.17", "ge 2.0.13"), vulnerable: make_list("lt 2.0.13"))) != NULL ) {
    report += res;
}

if(report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
