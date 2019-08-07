package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import grv.cell.beans.DBConnection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import grv.cell.beans.DBConnection;

public final class ReturnedGrievance_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(4);
    _jspx_dependants.add("/common/head.jsp");
    _jspx_dependants.add("/common/ubody.jsp");
    _jspx_dependants.add("/common/lbody.jsp");
    _jspx_dependants.add("/floatmenu2.jsp");
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
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
      out.write("\n");
      out.write("        \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
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
      out.write("\n");
      out.write("        <h2><font color=\"purple\">RETURNED GRIEVANCE</font></h2>\n");
      out.write("     <div style=\"margin-top: -50px;margin-left: 500px;width: 200px;float: left\">    <form action=\"SearchGrvReturned.jsp\" name=\"SearchGrvReturned\" method=\"post\" >\n");
      out.write("        <input name=\"grv_regd_id\" type=\"text\" value=\"\" placeholder=\"Search GRV-REGD ID..\" size=\"20\" maxlength=\"30\" />\n");
      out.write("        <input name=\"submit\" type=\"submit\" value=\"\" class=\"searchbtn\"/>\n");
      out.write("        \n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        <table width=\"700\" height=\"50\" border=\"1\" class=\"table1\">\n");
      out.write("  <tr>\n");
      out.write("    <th width=\"50\">DATE OF RETURN</td>\n");
      out.write("    <th width=\"50\">DATE OF REGISTARTION</td>\n");
      out.write("    <th width=\"50\">GRV REGD ID</td>\n");
      out.write("    \n");
      out.write("    <th width=\"50\">TARGET DATE</td>\n");
      out.write("    <th width=\"100\">NAME OF COMPLAINANT</td>\n");
      out.write("    <th width=\"100\">REMARKS</td>\n");
      out.write("    <th width=\"100\">SUGGESTED ORGANIZATION</td>\n");
      out.write("    <th width=\"100\">REFORWARD</td>\n");
      out.write("    <th width=\"100\">MAKE THIS NEW GRIEVANCE</td>\n");
      out.write("  </tr>\n");
      out.write("  \n");
      out.write("  ");

   
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  
  String org_id=(String)session.getAttribute("org_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,ur.name,gs.grv_regd_id from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id)  where gs.status='Returned' and gs.received_by=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    System.out.println("################"+ps+"##############");
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
       System.out.println("====================================="+record+"====================="); 
        String regd_date=rs.getString("regd_date");
        String grv_regd_id=rs.getString("grv_regd_id");
        String target_date=rs.getString("target_date");
        String name=rs.getString("name");
        //String suggested_office=rs.getString("suggested_office");
        //String not_pertaining_remarks=rs.getString("not_pertaining_remarks");
        
        // String subquery="Select case_presently_with from grv_action where grv_regd_id=? and action_taken_by=?";
        
        String sql1="select * from grv_action where ref_action_id=(SELECT max(action_id) FROM grv_action where grv_regd_id=? and action_taken_by=? and decision=?)  and status=1";
     PreparedStatement ps1 = con.prepareStatement(sql1);
     ps1.setString(1, grv_regd_id);
     ps1.setString(2, pgo_regd_id);
     ps1.setString(3, "forward to subordinate organization");
     System.out.println("@@@@@@@@@@@@@@@@@@@"+ps1+"##############");
    
     ResultSet rs1=ps1.executeQuery();
                            if (rs1.next())
                            {
                                String suggested_office=rs1.getString("suggested_office");
        String not_pertaining_remarks=rs1.getString("not_pertaining_remarks");
        String action_date=rs1.getString("action_date");
        String action_taken_by=rs1.getString("action_taken_by");
        String action_id=rs1.getString("action_id");
        String ref_action_id=rs1.getString("ref_action_id");
        
        
        
        
     String sql3="select * from org_regd where org_id=?";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, suggested_office);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps3+"##############");
    
     ResultSet rs3=ps3.executeQuery();
                            if (rs3.next())
                            {
                                //String pgo_name=rs3.getString("pgo_name");
                                //String designation=rs3.getString("designation");
                                String govt_dept=rs3.getString("govt_dept");
                                String dist=rs3.getString("dist");
                                String block=rs3.getString("block");
                                
                                if(dist==null)
                                    dist="";
                                if(block==null)
                                    block="";

    
        
  
      out.write("\n");
      out.write("  \n");
      out.write(" \n");
      out.write("  \n");
      out.write("  \n");
      out.write("  <tr>\n");
      out.write("    <td>");
      out.print(action_date);
      out.write("</td>\n");
      out.write("    <td>");
      out.print(regd_date);
      out.write("</td>\n");
      out.write("    <td><a href=\"GrievanceDetails.jsp?grv_regd_id=");
      out.print(grv_regd_id);
      out.write('"');
      out.write('>');
      out.print(grv_regd_id);
      out.write("</a></td>\n");
      out.write("    \n");
      out.write("    <td>");
      out.print(target_date);
      out.write("</td>\n");
      out.write("    <td>");
      out.print(name);
      out.write("</td>\n");
      out.write("    <td>");
      out.print(not_pertaining_remarks);
      out.write("</td>\n");
      out.write("    <td>");
      out.print(suggested_office);
      out.write('-');
      out.print(govt_dept);
      out.write("</br>");
      out.print(dist);
      out.write('-');
      out.print(block);
      out.write("</td>\n");
      out.write("    <td>\n");
      out.write("        <a href=\"ReForwardGrv?regd_date=");
      out.print(regd_date);
      out.write("&target_date=");
      out.print(target_date);
      out.write("&name=");
      out.print(name);
      out.write("&action_date=");
      out.print(action_date);
      out.write("&grv_regd_id=");
      out.print(grv_regd_id);
      out.write("&received_by=");
      out.print(action_taken_by );
      out.write("&action_id=");
      out.print(action_id);
      out.write("&ref_action_id=");
      out.print(ref_action_id);
      out.write("\"> Re-Forward </a>\n");
      out.write("    </td>\n");
      out.write("    <td>\n");
      out.write("        <a href=\"MakeNewGrv?grv_regd_id=");
      out.print(grv_regd_id);
      out.write("&received_by=");
      out.print(action_taken_by );
      out.write("&action_id=");
      out.print(action_id);
      out.write("&ref_action_id=");
      out.print(ref_action_id);
      out.write("\"> Make New </a>\n");
      out.write("    </td>\n");
      out.write("    \n");
      out.write("  </tr>\n");
      out.write("  ");
}}}
      out.write("\n");
      out.write("  <tr>\n");
      out.write("      <td colspan=\"3\"><div align=\"left\">NO OF RETURNED GRIEVANCE:</div></td>\n");
      out.write("      <td colspan=\"6\">");
      out.print(record);
      out.write("</td>\n");
      out.write("    \n");
      out.write("  </tr>\n");
      out.write(" \n");
      out.write("  \n");
      out.write("</table>\n");
      out.write("        ");
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
      out.write("\n");
      out.write("        ");
      out.write("\n");
      out.write(" <!-- Float Menu -->  \n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("      \n");
      out.write("   $(function(){\n");
      out.write("        $('.slide-out-div2').tabSlideOut({\n");
      out.write("            tabHandle: '.handle2',                     //class of the element that will become your tab\n");
      out.write("            pathToTabImage: 'images/utilities.png', //path to the image for the tab //Optionally can be set using css\n");
      out.write("            imageHeight: '150px',                     //height of tab image           //Optionally can be set using css\n");
      out.write("            imageWidth: '44px',                       //width of tab image            //Optionally can be set using css\n");
      out.write("            tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left\n");
      out.write("            speed: 300,                               //speed of animation\n");
      out.write("            action: 'click',                          //options: 'click' or 'hover', action to trigger animation\n");
      out.write("            topPos: '320px',                          //position from the top/ use if tabLocation is left or right\n");
      out.write("            leftPos: '20px',                          //position from left/ use if tabLocation is bottom or top\n");
      out.write("            fixedPosition: true                      //options: true makes it stick(fixed position) on scroll\n");
      out.write("        });\t\n");
      out.write("\t\t\t\t\n");
      out.write("    });\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("    </script>\n");
      out.write("\t\n");
      out.write("\t<div class=\"slide-out-div2\">\n");
      out.write("            <a class=\"handle2\" href=\"http://link-for-non-js-users.html\">Content</a>\n");
      out.write("           \n");
      out.write("            <div class=\"slidediv-container\">\n");
      out.write("                <ul>\n");
      out.write("                     <li> <a href=\"PgoReminder.jsp\"> Reminders </a> </li>    \n");
      out.write("                     <li> <a href=\"PgoClarification.jsp\"> Clarifications </a> </li>\n");
      out.write("                     <li> <a href=\"CaseReportReceivedList.jsp\"> Case Report Received</a> </li>    \n");
      out.write("                     <li> <a href=\"PgoLetterList.jsp\"> Correspondence Letter </a> </li>\n");
      out.write("            \n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("\t\t   \n");
      out.write("\t\t   \n");
      out.write("        </div>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("    <!-- / Float Menu -->\n");
      out.write("    ");
      out.write("\n");
      out.write("  \n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
