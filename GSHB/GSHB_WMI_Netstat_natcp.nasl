###############################################################################
# OpenVAS Vulnerability Test
# $Id: GSHB_WMI_Netstat_natcp.nasl 7551 2017-10-24 12:24:05Z cfischer $
#
# Get Windows TCP Netstat over win_cmd_exec
#
# Authors:
# Thomas Rotter <Thomas.Rotter@greenbone.net>
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH, http://www.greenbone.net
#
# Set in an Workgroup Environment under Windows Vista and greater,
# with enabled UAC this DWORD to access WMI:
# HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system\LocalAccountTokenFilterPolicy to 1
#
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

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.94251");
  script_version("$Revision: 7551 $");
  script_tag(name:"last_modification", value:"$Date: 2017-10-24 14:24:05 +0200 (Tue, 24 Oct 2017) $");
  script_tag(name:"creation_date", value:"2015-09-08 13:12:52 +0200 (Tue, 08 Sep 2015)");
  script_tag(name:"cvss_base", value:"0.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_name("Get Windows TCP Netstat over win_cmd_exec");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2015 Greenbone Networks GmbH");
  script_family("IT-Grundschutz");
  script_dependencies("toolcheck.nasl", "smb_login.nasl", "os_detection.nasl");
  script_mandatory_keys("Compliance/Launch/GSHB", "Tools/Present/wmi", "SMB/password", "SMB/login", "Host/runs_windows");

  script_tag(name:"summary", value:"Get Windows TCP Netstat over win_cmd_exec");

  script_tag(name:"qod_type", value:"remote_active");

  exit(0);
}

include("smb_nt.inc");
include("host_details.inc");

samba = get_kb_item( "SMB/samba" );
if( samba ) exit( 0 );

if( ! defined_func("win_cmd_exec") ) exit( 0 );

host    = get_host_ip();
usrname = get_kb_item("SMB/login");
domain  = get_kb_item("SMB/domain");
passwd  = get_kb_item("SMB/password");
if (domain){
  usrname = domain + '/' + usrname;
}

if(!host || !usrname || !passwd){
  set_kb_item(name:"GSHB/WMI/NETSTAT/log", value:"nocred");
  exit(0);
}

a = "netstat.exe -na -p tcp";
b = "netstat.exe -na -p tcpv6";
vala = win_cmd_exec (cmd:a, password:passwd, username:usrname);
valb = win_cmd_exec (cmd:b, password:passwd, username:usrname);

report = vala + "\n" + valb;

set_kb_item(name:"GSHB/WMI/NETSTAT", value:report);
exit(0);
