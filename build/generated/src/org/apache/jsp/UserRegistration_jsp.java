package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import grv.cell.beans.DBConnection;

public final class UserRegistration_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/common/head.jsp");
    _jspx_dependants.add("/common/ubody.jsp");
    _jspx_dependants.add("/common/lbody.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        \r\n");
      out.write("     \r\n");
      out.write("        \r\n");
      out.write("        <script type=\"text/javascript\" src=\"javascript/common.js\"></script>\r\n");
      out.write("\t<script type=\"text/javascript\" src=\"javascript/UserRegistration.js\"></script>\r\n");
      out.write("\t\t\r\n");
      out.write("                \r\n");
      out.write("<script type=\"text/javascript\" src=\"jscalendar/datetimepicker_css.js\"></script>\r\n");
      out.write("        ");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<title>Grievance Resolution</title>\r\n");
      out.write("<meta name=\"keywords\" content=\"stable business, web design, free templates, website templates, CSS, HTML\" />\r\n");
      out.write("<meta name=\"description\" content=\"Stable Business - free CSS template by templatemo.com for web designers.\" />\r\n");
      out.write("<link href=\"templatemo_style1.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("<link href=\"css/table.css\" rel=\"stylesheet\" type=\"text/css\" />\r\n");
      out.write("\r\n");
      out.write(" <script src=\"js/jquery-1.9.0.min.js\"></script>\r\n");
      out.write("    \r\n");
      out.write("<script src=\"js/jquery.tabSlideOut.v1.3.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"pro_drop_1/pro_drop_1.css\" />\r\n");
      out.write("\r\n");
      out.write("<script src=\"pro_drop_1/stuHover.js\" type=\"text/javascript\"></script>\r\n");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>JSP Page</title>\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        ");
      out.write("<div id=\"templatemo_header\">\r\n");
      out.write("\r\n");
      out.write("    <div id=\"header_left\">\r\n");
      out.write("        \r\n");
      out.write("        <div id=\"site_title\">\r\n");
      out.write("            <img src=\"images/logo_1.png\" width=\"369\" height=\"85\" alt=\"Logo\"/>\r\n");
      out.write("\r\n");
      out.write("        </div> <!-- end of site_title -->\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("    \r\n");
      out.write("    <div id=\"header_right\">\r\n");
      out.write("    \r\n");
      out.write("        <div id=\"templatemo_menu\">\r\n");
      out.write("            \r\n");
      out.write("            <ul id=\"nav\">\r\n");
      out.write("                \r\n");

String role22=(String)session.getAttribute("role");               

      out.write("\r\n");
      out.write("\r\n");
if(role22==null){
      out.write("\r\n");
      out.write("             <li> <a href=\"index.jsp\"> Home </a> </li>\r\n");
      out.write("             <li><a href=\"AboutTheSite.jsp\">About The Site </a></li>\r\n");
      out.write("             <li><a href=\"howitworks.jsp\">How it works </a></li>\r\n");
      out.write("             <li class=\"last\"><a href=\"ContactUs.jsp\">Contact Us</a></li>\r\n");
      out.write("           \r\n");
}
      out.write("\r\n");
      out.write("                \r\n");
      out.write("            ");
if("admin".equals(role22)){
      out.write("\r\n");
      out.write("                <li> <a href=\"AdminHome.jsp\"> Home </a> </li> \r\n");
      out.write("                <li ><a href=\"#\" >Grievance</a>\r\n");
      out.write("                \r\n");
      out.write("                    \t<ul class=\"sub\">\r\n");
      out.write("                             <li> <a href=\"GrievanceCategory.jsp\">GRIEVANCE CATEGORY</a> </li>    \r\n");
      out.write("                             <li> <a href=\"Notice.jsp\">NOTICE</a> </li>    \r\n");
      out.write("                             <li> <a href=\"Feedback.jsp\">FEEDBACK EVALUATION</a> </li>    \r\n");
      out.write("                             <li> <a href=\"UserList.jsp\">USER LIST</a> </li>    \r\n");
      out.write("                             <li> <a href=\"GrievanceAbstract.jsp\">GRIEVANCE ABSTRACT</a> </li>    \r\n");
      out.write("                            \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    \r\n");
      out.write("             </li>\r\n");
      out.write("             <li><a href=\"#\">Manage</a>\r\n");
      out.write("                        \r\n");
      out.write("                    \t<ul class=\"sub\">\r\n");
      out.write("                             <li> <a href=\"RegisterOrganization.jsp\">REGISTER ORGANIZATION</a> </li>    \r\n");
      out.write("                             <li> <a href=\"ManageOrganization.jsp\">MANAGE ORGANIZATION</a> </li>    \r\n");
      out.write("                             <li> <a href=\"RegisterPgo.jsp\">REGISTER PGO</a> </li>    \r\n");
      out.write("                             <li> <a href=\"ManagePgo.jsp\">MANAGE PGO</a> </li>\r\n");
      out.write("                             <li> <a href=\"ManagePassword.jsp\">CHANGE/RESET PASSWORD</a> </li>\r\n");
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("                </li> \r\n");
      out.write("                <li class=\"last\"><a href=\"Logout.jsp\">Logout</a></li>\r\n");
      out.write("             \r\n");
      out.write("                \r\n");
      out.write("             ");
}
      out.write("\r\n");
      out.write("             \r\n");
      out.write("             ");
if("pgo".equals(role22)){
      out.write("\r\n");
      out.write("             <li> <a href=\"PgoHome.jsp\"> Home </a> </li>\r\n");
      out.write("             <li ><a href=\"#\" >Grievance</a>\r\n");
      out.write("                \r\n");
      out.write("                    \t<ul class=\"sub\">\r\n");
      out.write("                             <li> <a href=\"NewGrievance.jsp\"> NEW </a> </li>    \r\n");
      out.write("                             <li> <a href=\"PendingGrievance.jsp\"> PENDING </a> </li>    \r\n");
      out.write("                             <li> <a href=\"DisposedGrievance.jsp\"> DISPOSED </a> </li>    \r\n");
      out.write("                            \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    \r\n");
      out.write("             </li>\r\n");
      out.write("             <li><a href=\"#\">Others</a>\r\n");
      out.write("                        \r\n");
      out.write("                    \t<ul class=\"sub\">\r\n");
      out.write("                             <li> <a href=\"DirectActionTakenGrievance.jsp\"> DIRECT ACTION GRIEVANCE </a> </li>    \r\n");
      out.write("                             <li> <a href=\"AllGrievance.jsp\"> ALL GRIEVANCE </a> </li>    \r\n");
      out.write("                             <li> <a href=\"ReforwardedGrievance.jsp\"> REFORWARDED GRIEVANCE </a> </li>    \r\n");
      out.write("                             <li> <a href=\"ReturnedGrievance.jsp\"> RETURNED GRIEVANCE </a> </li>\r\n");
      out.write("\r\n");
      out.write("                        </ul>\r\n");
      out.write("                </li>\r\n");
      out.write("                <li class=\"last\"><a href=\"Logout.jsp\">Logout</a></li>\r\n");
      out.write("                \r\n");
      out.write("              ");
}
      out.write("\r\n");
      out.write("              \r\n");
      out.write("             ");
if("user".equals(role22)){
      out.write("\r\n");
      out.write("\r\n");
      out.write("             <li> <a href=\"UserHome.jsp\"> Home </a> </li> \r\n");
      out.write("             <li ><a href=\"#\" >User</a>\r\n");
      out.write("                \r\n");
      out.write("                    \t<ul class=\"sub\">\r\n");
      out.write("                             <li> <a href=\"GrievanceRegistration.jsp\"> Lodge Grievance </a> </li>\r\n");
      out.write("                             <li> <a href=\"UserStatusQuery.jsp\"> View Action Status </a> </li>\r\n");
      out.write("             \r\n");
      out.write("                             \r\n");
      out.write("                        </ul>\r\n");
      out.write("                    \r\n");
      out.write("                </li>\r\n");
      out.write("                \r\n");
      out.write("                \r\n");
      out.write("                <li><a href=\"howitworks.jsp\">How it works</a></li>\r\n");
      out.write("                <li class=\"last\"><a href=\"Logout.jsp\">Logout</a></li>       \r\n");
      out.write("                    \t\r\n");
      out.write("                                \r\n");
      out.write("                \r\n");
      out.write("              ");
}
      out.write("\r\n");
      out.write("              \r\n");
      out.write("              \r\n");
      out.write("                \r\n");
      out.write("            </ul>    \t\r\n");
      out.write("        \r\n");
      out.write("        </div> <!-- end of templatemo_menu -->\r\n");
      out.write("        \r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"cleaner\"></div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"templatemo_featured_content_wrapper1\">\r\n");
      out.write("  <div id=\"templatemo_featured_content1\">\r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("        \r\n");
      out.write("        <table>\r\n");
      out.write("          <tr>\r\n");
      out.write("\t\t   <td>  <img src=\"images/content_slider/image6.jpg\" width=\"230\" height=\"153\"  /></td>\r\n");
      out.write("            <td><img src=\"images/content_slider/image3.jpg\" width=\"500\" height=\"153\" /></td>\r\n");
      out.write("           \r\n");
      out.write("            <td> <img src=\"images/content_slider/image5.jpg\" width=\"230\" height=\"153\"  /> </td>\r\n");
      out.write("          </tr>\r\n");
      out.write("        </table>\r\n");
      out.write("  </div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"name-div\">\r\n");

String name555=(String)session.getAttribute("name");
String govt_dept555=(String)session.getAttribute("govt_dept");
String dist555=(String)session.getAttribute("dist");
String block555=(String)session.getAttribute("block");
if(name555==null)
name555="GUEST";      
if(govt_dept555==null)
govt_dept555="";  
else
    govt_dept555="Dept: "+govt_dept555;

if(dist555==null || "".equals(dist555))
dist555="";
else
dist555=" | Dist: "+dist555; 
      
if(block555==null || "".equals(block555) || "0".equals(block555))
block555="";
else
block555=" | Block: "+block555;        

      out.write("\r\n");
      out.write("<div class=\"name\">\r\n");
      out.write("            \r\n");
      out.write("Welcome: ");
      out.print(name555);
      out.write("\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"dept\">&nbsp; ");
      out.print(govt_dept555);
      out.write(' ');
      out.print(dist555);
      out.write(' ');
      out.print(block555);
      out.write(" </div>\r\n");
      out.write("<div style=\"clear: both\"> </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("<div id=\"templatemo_content_wrapper\">\r\n");
      out.write("    \r\n");
      out.write("    <div id=\"content\">\r\n");
      out.write("    \t\r\n");
      out.write("       ");
      out.write("\r\n");
      out.write("        \r\n");
      out.write("\r\n");
      out.write("<form action=\"Registration\" method=\"post\" name=\"Registration\" onsubmit=\"return checkForm(this)\">\r\n");
      out.write("  <table width=\"700\" border=\"0\" align=\"center\" class=\"table1\">\r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    <tr>\r\n");
      out.write("      <th colspan=\"3\" scope=\"col\" bgcolor=\"White\">NEW USER REGISTRATION</th>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th width=\"200\">User Name</th>\r\n");
      out.write("      <td width=\"500\"><input name=\"name\" type=\"text\" value=\"\" placeholder=\"User Name\" size=\"30\" maxlength=\"30\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Date Of Birth</th>\r\n");
      out.write("      <td ><input name=\"dob\" id=\"dob\" type=\"text\" value=\"\" placeholder=\"DOB\" size=\"10\" maxlength=\"10\" onfocus=\"this.blur()\"/>\r\n");
      out.write("      <a href=\"javascript:NewCssCal('dob','yyyymmdd')\"><img src=\"jscalendar/cal.gif\" width=\"16\" height=\"16\" alt=\"Pick a date\" style=\"vertical-align:text-bottom\"/></a>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Gender</th>\r\n");
      out.write("      <td><input name=\"gender\" type=\"radio\" value=\"male\" />\r\n");
      out.write("        Male\r\n");
      out.write("        <input name=\"gender\" type=\"radio\" value=\"female\" />\r\n");
      out.write("        Female\r\n");
      out.write("        <input name=\"gender\" type=\"radio\" value=\"transgender\" />\r\n");
      out.write("        Transgender\r\n");
      out.write("        <input name=\"gender\" type=\"radio\" value=\"others\" />\r\n");
      out.write("        Others (if  not an individual)</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Category :</th>\r\n");
      out.write("      <td>\r\n");
      out.write("           \r\n");
      out.write("          <select name=\"category\" id=\"category\" >\r\n");
      out.write("                <option value=\"\"> Select </option> \r\n");
      out.write("                <option >SC</option>\r\n");
      out.write("                <option >ST</option>\r\n");
      out.write("                <option >OBC</option>\r\n");
      out.write("                <option >GENERAL</option>\r\n");
      out.write("                <option >NOT KNOWN</option>\r\n");
      out.write("        </select>\r\n");
      out.write("          <span class=\"error\" id=\"categoryL\"></span>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Type</th>\r\n");
      out.write("      <td>\r\n");
      out.write("          <select name=\"type\" id=\"type\" >\r\n");
      out.write("            <option value=\"\"> Select </option> \r\n");
      out.write("            <option >SENIOR CITIZEN</option>\r\n");
      out.write("            <option >DEFENCE PERSONNEL</option>\r\n");
      out.write("            <option >OTHERS</option>\r\n");
      out.write("   </select>\r\n");
      out.write("          <span class=\"error\" id=\"typeL\"></span>\r\n");
      out.write("          \r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>District</th>\r\n");
      out.write("      <td>\r\n");
      out.write("          <input type=\"text\" id=\"dist\" name=\"dist\" value=\"\" />\r\n");
      out.write("          <span class=\"error\" id=\"distL\"></span>\r\n");
      out.write("          </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>City/Block</th>\r\n");
      out.write("      <td>\r\n");
      out.write("         <input type=\"text\" id=\"block\" name=\"block\" value=\"\" />\r\n");
      out.write("          <label id=\"blockLabel\"></label>\r\n");
      out.write("          \r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    \r\n");
      out.write("   \r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Area/Village</th>\r\n");
      out.write("      \r\n");
      out.write("      <td>\r\n");
      out.write("           <input type=\"text\" id=\"village\" name=\"village\" value=\"\" />          \r\n");
      out.write("          <label id=\"villageLabel\"></select>\r\n");
      out.write("          </label>\r\n");
      out.write("          </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Address Of Communication:</th>\r\n");
      out.write("      <td><textarea name=\"address\" cols=\"30\" rows=\"6\"></textarea></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>PIN Code</th>\r\n");
      out.write("      <td><input name=\"pincode\" type=\"text\" value=\"\" placeholder=\"pincode\" size=\"\" maxlength=\"6\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Mobile Number</th>\r\n");
      out.write("      <td><input name=\"mobileno\" type=\"text\" value=\"\" placeholder=\"Mobile number\" size=\"10\" maxlength=\"10\" />\r\n");
      out.write("        (Don't Prefix 0 or +91)</td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>e-mail id</th>\r\n");
      out.write("      <td><input name=\"emailid\" type=\"text\" value=\"\" placeholder=\"e-mail id\" size=\"30\" maxlength=\"30\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>ID Proof</th>\r\n");
      out.write("      <td><select name=\"id_proof\">\r\n");
      out.write("        <option selected=\"selected\">--Select--</option>\r\n");
      out.write("        <option >PAN</option>\r\n");
      out.write("        <option >BPL</option>\r\n");
      out.write("        <option >VOTER ID</option>\r\n");
      out.write("        <option >PDS</option>\r\n");
      out.write("        <option >DRIVING LICENCE</option>\r\n");
      out.write("        <option >UID</option>\r\n");
      out.write("      </select></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>ID Proof Number</th>\r\n");
      out.write("      <td><input name=\"id_proof_no\" type=\"text\" size=\"20\" maxlength=\"20\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Photo</th>\r\n");
      out.write("      <td><input name=\"photo\" id=\"photo\" type=\"hidden\"  value=\"\"/>\r\n");
      out.write("      <input id=\"fileupload\" type=\"file\" name=\"files[]\" />\r\n");
      out.write("        <label id=\"imageL\"></label>\r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Password</th>\r\n");
      out.write("      <td><input name=\"password\" type=\"password\" size=\"20\" maxlength=\"15\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Confirm Password</th>\r\n");
      out.write("      <td><input name=\"confirmpassword\" type=\"password\" size=\"20\" maxlength=\"15\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>Enter Security Code as shown</th>\r\n");
      out.write("      <td>\r\n");
      out.write("          <table>\r\n");
      out.write("              <tr>\r\n");
      out.write("                  <td> <img src=\"./CaptchaServlet\"  alt=\"Captcha image\" width=\"120\" height=\"40\" align=\"text-bottom\" style=\"border:none\" border=\"0\"/> </td>\r\n");
      out.write("                  <td> <input name=\"captcha\" type=\"text\" size=\"20\" maxlength=\"6\" /> </td>\r\n");
      out.write("              </tr>\r\n");
      out.write("          </table>\r\n");
      out.write("          \r\n");
      out.write("          \r\n");
      out.write("      \r\n");
      out.write("      </td>\r\n");
      out.write("    </tr>\r\n");
      out.write("    <tr>\r\n");
      out.write("      <th>&nbsp;</th>\r\n");
      out.write("      <td> <input name=\"submit\" type=\"submit\" value=\"Submit\" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; \r\n");
      out.write("      <input name=\"reset\" type=\"Reset\" value=\"Reset\" /></td>\r\n");
      out.write("    </tr>\r\n");
      out.write("     </table>\r\n");
      out.write("\r\n");
      out.write("</form>\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("<!--<script src=\"jsFileUpload/jquery-1.7.1.min.js\"></script>-->\r\n");
      out.write("<script src=\"jsFileUpload/vendor/jquery.ui.widget.js\"></script>\r\n");
      out.write("<script src=\"jsFileUpload/jquery.iframe-transport.js\"></script>\r\n");
      out.write("<script src=\"jsFileUpload/jquery.fileupload.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("$(function () {\r\n");
      out.write("    \r\n");
      out.write("    $('#fileupload').fileupload({\r\n");
      out.write("        dataType: 'json',\r\n");
      out.write("        url: 'ImageUploadServlet',\r\n");
      out.write("        done: function (e, data) {\r\n");
      out.write("            $.each(data.result, function (index, file) {\r\n");
      out.write("                if(index==\"name\")\r\n");
      out.write("                 {   \r\n");
      out.write("                     $(\"#photo\").val(file)\r\n");
      out.write("                     $(\"#imageL\").html(\"<img src='uploadedfiles/\"+file+\"' width='100' height='100' />\");\r\n");
      out.write("                 }   \r\n");
      out.write("            });\r\n");
      out.write("        }\r\n");
      out.write("    });\r\n");
      out.write("});\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("    ");
      out.write("     \r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("    <div id=\"sidebar1\">\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("            \r\n");
      out.write("           <ul>\r\n");
      out.write("               \r\n");

String role=(String)session.getAttribute("role");               

      out.write('\r');
      out.write('\n');
if(role==null){
      out.write("\r\n");
      out.write("             <li> <a href=\"index.jsp\"> Home </a> </li>\r\n");
}
      out.write("\r\n");
      out.write("\r\n");
      out.write("             ");
if("admin".equals(role)){
      out.write("\r\n");
      out.write("                \r\n");
      out.write("             ");
}
      out.write("\r\n");
      out.write("             \r\n");
      out.write("             ");
if("pgo".equals(role) && (request.getRequestURI().contains("PgoHome.jsp"))){
      out.write("\r\n");
      out.write("         \r\n");
      out.write("<div id=\"noticebox\">\r\n");
      out.write("    <div class=\"noticehead\" align=\"center\">NOTICE</div>\r\n");
      out.write("             <!--<marquee direction=\"up\" scroll=\"3000\" onmouseover=\"this.stop()\" onmouseout=\"this.start()\">-->\r\n");
      out.write("                  <div class=\"noticediv\">\r\n");
      out.write("  \r\n");
      out.write("      <marquee direction=\"up\" height=\"355px\" width=\"237\" onmouseover=\"this.setAttribute('scrollamount', 1, 0);\" onmouseout=\"this.setAttribute('scrollamount', 3, 0);\">\r\n");
      out.write("  <table width=\"237\"  border=\"0\" class=\"table11\">            \r\n");
      out.write("  ");

  Connection con51 = new DBConnection().getConnection(); 
  String sql51="select * from notice where type=?"; 
    PreparedStatement ps51 = con51.prepareStatement(sql51);
    ps51.setString(1, "PGO");
    ResultSet rs51=ps51.executeQuery();
    while (rs51.next())
   {
        String notice_date=rs51.getString("notice_date");
        String notice_no=rs51.getString("notice_no");
        String notice=rs51.getString("notice");
        
    
      out.write("\r\n");
      out.write("    \r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>\r\n");
      out.write("                Notice No:");
      out.print(notice_no);
      out.write("\r\n");
      out.write("            </th>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <th>\r\n");
      out.write("                Notice Date:");
      out.print(notice_date);
      out.write("\r\n");
      out.write("            </th>\r\n");
      out.write("        </tr>\r\n");
      out.write("        <tr>\r\n");
      out.write("            <td>\r\n");
      out.write("        <div  style=\"background: url(images/button0.png);height: 20px;width: 237px;\"></div>\r\n");
      out.write("                <div style=\"word-break: break-all;width: 137px;\">\r\n");
      out.write("                    <div  style=\"background: url(images/button1.png);width: 237px;\">\r\n");
      out.write("                    ");
      out.print(notice);
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                \r\n");
      out.write("                <div style=\"background: url(images/button2.png);height: 33px;width: 237px;\"></div>\r\n");
      out.write("            </td>\r\n");
      out.write("        </tr>\r\n");
      out.write("        ");
}
      out.write("\r\n");
      out.write("    </table>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("             </marquee>\r\n");
      out.write("    \r\n");
      out.write("  </div>\r\n");
      out.write("    \r\n");
      out.write("</div>\r\n");
      out.write("    \r\n");
      out.write("             ");
}
      out.write("\r\n");
      out.write("             ");
if("user".equals(role)){
      out.write("\r\n");
      out.write("             <h2>Quick Links</h2>\r\n");
      out.write("\r\n");
      out.write("             <li> <a href=\"UserHome.jsp\"> Home </a> </li> \r\n");
      out.write("             <li> <a href=\"GrievanceRegistration.jsp\"> Lodge Grievance </a> </li>\r\n");
      out.write("             <li> <a href=\"UserReminder.jsp\"> Reminder </a> </li>\r\n");
      out.write("             <li> <a href=\"UserClarification.jsp\"> Clarification </a> </li>\r\n");
      out.write("             \r\n");
      out.write("             <li> <a href=\"UserStatusQuery.jsp\"> View Action Status </a> </li>\r\n");
      out.write("             <li> <a href=\"UserLetterList.jsp\"> View letter </a> </li>\r\n");
      out.write("             <li> <a href=\"Logout.jsp\"> Logout </a> </li>\r\n");
      out.write("                \r\n");
      out.write("             \r\n");
      out.write("             ");
}
      out.write("\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("         \r\n");
      out.write("            \r\n");
      out.write("           </ul>\r\n");
      out.write("    \r\n");
      out.write("    </div>\r\n");
      out.write("\t<div class=\"cleaner\"></div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"templatemo_footer_wrapper\">\r\n");
      out.write("\r\n");
      out.write("\t<div id=\"templatemo_footer\">\r\n");
      out.write("    \r\n");
      out.write("        <div class=\"col_w270\">\r\n");
      out.write("        \t<h4>About the Site</h4>\r\n");
      out.write("          <p>Citizens can lodge their grievances related to Electricity, Water Supply, Sanitation department through this portal. Grievance Redressal Cell-Call Center is a physical place, which works 24X7, where anybody can make telephone calls to 1076 (tollfree number).</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    \t\r\n");
      out.write("        <div class=\"col_w270\">\r\n");
      out.write("\t\t\r\n");
      out.write("        \t<h4>Our Pages</h4>\r\n");
      out.write("        \t<ul>\r\n");
      out.write("                <li><a href=\"index.jsp\">Home</a></li>\r\n");
      out.write("                <li><a href=\"AboutTheSite.jsp\">About the site </a></li>\r\n");
      out.write("                <li><a href=\"howitworks.jsp\">How it works </a></li>\r\n");
      out.write("                \r\n");
      out.write("            </ul>  \r\n");
      out.write(" \r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"col_w270 col_w270_last\">\r\n");
      out.write("\t\t\r\n");
      out.write("        \t<h4>LINKS</h4>\r\n");
      out.write("        \t<ul>\r\n");
      out.write("                <li><a href=\"#\">National Portal Of India </a></li>               \r\n");
      out.write("                <li><a href=\"#\">Dipt. of Electricity </a></li>\r\n");
      out.write("                <li><a href=\"#\">Dept. of Water Supply </a></li>\r\n");
      out.write("\t\t<li><a href=\"#\">Dept. of Sanitation </a></li>\r\n");
      out.write("            </ul>    \r\n");
      out.write(" \r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"cleaner\"></div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div id=\"templatemo_copyright_wrapper\">\r\n");
      out.write("\t<div id=\"templatemo_copyright\">\r\n");
      out.write("    \r\n");
      out.write("        Copyright @ 2015 Grievance Resolution. <a href=\"#\">C.V. RAMAN College of Engg</a> | Developed by Smita & Sheetal </div>\r\n");
      out.write(" \r\n");
      out.write("        </div>\r\n");
      out.write("</div>");
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
