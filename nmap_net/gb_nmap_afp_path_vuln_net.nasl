###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_nmap_afp_path_vuln_net.nasl 8095 2017-12-13 07:30:19Z teissa $
#
# Autogenerated NSE wrapper
#
# Authors:
# NSE-Script: Patrik Karlsson
# NASL-Wrapper: autogenerated
#
# Copyright:
# NSE-Script: The Nmap Security Scanner (http://nmap.org)
# Copyright (C) 2011 Greenbone Networks GmbH, http://www.greenbone.net
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

tag_summary = "Detects the Mac OS X AFP directory traversal vulnerability, CVE-2010-0533.

This script attempts to iterate over all AFP shares on the remote host. For each share it attempts
to access the parent directory by exploiting the directory traversal vulnerability as described in
CVE-2010-0533.

The script reports whether the system is vulnerable or not. In addition it lists the contents of the
parent and child directories to a max depth of 2. When running in verbose mode, all items in the
listed directories are shown.  In non verbose mode, output is limited to the first 5 items. If the
server is not vulnerable, the script will not return any information.

SYNTAX:

afp.password:  The password to use for authentication. (If unset it first attempts to use credentials found by 'afp-brute' then no credentials)



afp.username:  The username to use for authentication. (If unset it first attempts to use credentials found by 'afp-brute' then no credentials)";

if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.104146");
    script_version("$Revision: 8095 $");
    script_cve_id("CVE-2010-0533");
    script_tag(name:"last_modification", value:"$Date: 2017-12-13 08:30:19 +0100 (Wed, 13 Dec 2017) $");
    script_tag(name:"creation_date", value:"2011-06-01 16:32:46 +0200 (Wed, 01 Jun 2011)");
    script_tag(name:"cvss_base", value:"7.5");
    script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
    script_name("Nmap NSE net: afp-path-vuln");

    script_xref(name:"URL", value:"http://www.cqure.net/wp/2010/03/detecting-apple-mac-os-x-afp-vulnerability-cve-2010-0533-with-nmap");
    script_xref(name:"URL", value:"http://support.apple.com/kb/HT1222");

    script_category(ACT_INIT);
    script_tag(name:"qod_type", value:"remote_analysis");
    script_copyright("NSE-Script: The Nmap Security Scanner; NASL-Wrapper: Greenbone Networks GmbH");
    script_family("Nmap NSE net");
    script_dependencies("nmap_nse_net.nasl");
    script_mandatory_keys("Tools/Launch/nmap_nse_net");

    script_add_preference(name:"afp.password", value:"", type:"entry");
    script_add_preference(name:"afp.username", value:"", type:"entry");

    script_tag(name : "summary" , value : tag_summary);
    exit(0);
}


include("nmap.inc");


phase = 0;
if (defined_func("scan_phase")) {
    phase = scan_phase();
}

if (phase == 1) {
    # Get the preferences
    argv = make_array();

    pref = script_get_preference("afp.password");
    if (!isnull(pref) && pref != "") {
        argv["afp.password"] = string('"', pref, '"');
    }
    pref = script_get_preference("afp.username");
    if (!isnull(pref) && pref != "") {
        argv["afp.username"] = string('"', pref, '"');
    }
    nmap_nse_register(script:"afp-path-vuln", args:argv);
} else if (phase == 2) {
    res = nmap_nse_get_results(script:"afp-path-vuln");
    foreach portspec (keys(res)) {
        output_banner = 'Result found by Nmap Security Scanner (afp-path-vuln.nse) http://nmap.org:\n\n';
        if (portspec == "0") {
            security_message(data:output_banner + res[portspec], port:0);
        } else {
            v = split(portspec, sep:"/", keep:0);
            proto = v[0];
            port = v[1];
            security_message(data:output_banner + res[portspec], port:port, protocol:proto);
        }
    }
}
