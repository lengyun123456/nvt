##############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_efront_detect.nasl 8690 2018-02-06 14:17:04Z jschulte $
#
# eFront Version Detection
#
# Authors:
# Antu Sanadi <santu@secpod.com>
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
################################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.901044");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:N/I:N/A:N");
  script_version("$Revision: 8690 $");
  script_tag(name:"cvss_base", value:"0.0");
  script_name("eFront Version Detection");
  script_tag(name:"last_modification", value:"$Date: 2018-02-06 15:17:04 +0100 (Tue, 06 Feb 2018) $");
  script_tag(name:"creation_date", value:"2009-10-31 09:54:01 +0100 (Sat, 31 Oct 2009)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2009 SecPod");
  script_family("Product detection");
  script_dependencies("http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name:"summary", value:"This script detects the installed Efront version and sets
  the result in KB.");

  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");
include("cpe.inc");
include("host_details.inc");

port = get_http_port( default:80 );

if( ! can_host_php( port:port ) ) exit( 0 );

foreach dir( make_list_unique( "/", "/www", "/efront", "/eFront", "/efront/www", "/eFront/www", cgi_dirs( port:port ) ) ) {

  install = dir;
  if( dir == "/" ) dir = "";

  rcvRes = http_get_cache( item: dir + "/index.php", port:port );

  if( rcvRes =~ "HTTP/1.. 200" && ( 'http://www.efrontlearning.net">eFront' >< rcvRes ||
      "<title>eFront | Refreshing eLearning</title>" >< rcvRes || 'content = "Collaborative Elearning Platform"' >< rcvRes ||
      "index.php?ctg=lesson_info&lessons_ID=1" >< rcvRes ) ) {

    set_kb_item( name: "efront/detected", value: TRUE );

    version = "unknown";

    ver = eregmatch( pattern:"version ([0-9.]+)", string:rcvRes );
    if( ver[1] != NULL ) {
      version = ver[1];
    } else {
      rcvRes = http_get_cache( item: dir + "/../CHANGELOG.txt", port:port );
      ver = eregmatch( pattern:"=== Version ([0-9.]+)", string:rcvRes );
      if( ver[1] != NULL ) version = ver[1];
    }

    tmp_version = version + " under " + install;
    set_kb_item( name:"www/"+ port + "/eFront", value:tmp_version );

    ## build cpe and store it as host_detail
    cpe = build_cpe( value:version, exp:"^([0-9.]+)", base:"cpe:/a:efrontlearning:efront:" );
    if( isnull( cpe ) )
      cpe = 'cpe:/a:efrontlearning:efront';

    ## Register Product and Build Report
    register_product( cpe:cpe, location:install, port:port );

    log_message( data:build_detection_report( app:"eFront",
                                              version:version,
                                              install:install,
                                              cpe:cpe,
                                              concluded:ver[0] ),
                                              port:port );
  }
}

exit( 0 );
