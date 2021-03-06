##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_ibm_lotus_notes_detect_win.nasl 9347 2018-04-06 06:58:53Z cfischer $
#
# IBM Lotus Notes Version Detection (Windows)
#
# Authors:
# Antu Sanadi <santu@secpod.com>
#
# Updated By: Antu Sanadi <santu@secpod.com> on 2010-05-04
# Updated to detect the fixfack versions
#
# Copyright:
# Copyright (c) 2009 SecPod, http://www.secpod.com
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

tag_summary = "This script detects the installed version of IBM Lotus Notes and
  sets the result in KB.";

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901013");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
 script_version("$Revision: 9347 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 08:58:53 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2009-09-11 18:01:06 +0200 (Fri, 11 Sep 2009)");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("IBM Lotus Notes Version Detection (Windows)");
  script_category(ACT_GATHER_INFO);
  script_tag(name:"qod_type", value:"executable_version");
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Service detection");
  script_dependencies("secpod_reg_enum.nasl");
  script_mandatory_keys("SMB/WindowsVersion");
  script_require_ports(139, 445);
  script_tag(name : "summary" , value : tag_summary);
  exit(0);
}


include("smb_nt.inc");
include("secpod_smb_func.inc");
include("cpe.inc");
include("host_details.inc");

## Constant values
SCRIPT_OID  = "1.3.6.1.4.1.25623.1.0.901013";
SCRIPT_DESC = "IBM Lotus Notes Version Detection (Windows)";

# Check for Windows
if(!get_kb_item("SMB/WindowsVersion"))
{
  exit(0);
}

# Check for Lotus Notes Existence
key = "SOFTWARE\Lotus\Notes";
if(!registry_key_exists(key:key)){
  exit(0);
}

notesPath = registry_get_sz(key:key, item:"Path");
if(!isnull(notesPath))
{

  path =  notesPath + "notes.exe";
  share = ereg_replace(pattern:"([A-Z]):.*", replace:"\1$", string:path);
  file = ereg_replace(pattern:"[A-Z]:(.*)", replace:"\1", string:path);

  lotusVer = GetVer(share:share, file:file);
  # Set KB for Lotus Notes
  if(lotusVer != NULL){
    set_kb_item(name:"IBM/LotusNotes/Win/Ver", value:lotusVer);
    log_message(data:"IBM Lotus Notes version " + lotusVer +
               " running at location " + path + " was detected on the host");
    
    ## build cpe and store it as host_detail
    cpe = build_cpe(value:lotusVer, exp:"^([0-9]\.[0-9]+\.[0-9]+)", base:"cpe:/a:ibm:lotus_notes:");
    if(!isnull(cpe))
       register_host_detail(name:"App", value:cpe, nvt:SCRIPT_OID, desc:SCRIPT_DESC);

  }
}
