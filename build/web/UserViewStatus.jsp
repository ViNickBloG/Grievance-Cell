<%-- 
    Document   : UserViewStatus
    Created on : 9 Dec, 2012, 6:16:43 PM
    Author     : USER
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="common/head.jsp" %>
        <!-- START Fancy Box -->
	<!--<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>-->

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="fancy/jquery.fancybox.js?v=2.1.4"></script>
	<link rel="stylesheet" type="text/css" href="fancy/jquery.fancybox.css?v=2.1.4" media="screen" />
        <script type="text/javascript">
            $(document).ready(function() {

                    $('.various').fancybox();
            });
        </script>        
        <!-- END Fancy Box -->
       
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
    <%
    String captcha=request.getParameter("captcha");         
    String captcha1=(String)session.getAttribute("captcha");
    
    String grv_no=request.getParameter("grv_no");         
    String user_regd_id=(String)session.getAttribute("user_regd_id");
    Connection con = new DBConnection().getConnection();   
    String grv_regd_id=user_regd_id+"/"+grv_no;
    
    if(!captcha.equals(captcha1))
    {
        %>
        <h3> Captcha doesn't match </h3>
        <%
    }
     else{
    //String sql="select * from grv_regd where grv_regd_id=?  ";
    String sql="select gr.*,ur.name,pr.* from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join pgo_regd pr on(gr.govt_dept=pr.govt_dept) where gr.grv_regd_id=?  ";
    
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();   
  
    if (rs.next())
    {
        
        //String user_regd_id=rs.getString("user_regd_id");
        String regd_date=rs.getString("regd_date");
        String name=rs.getString("name");
        String govt_dept=rs.getString("govt_dept");
        String grv_status=rs.getString("grv_status");
        String pgo_name=rs.getString("pgo_name");
        String designation=rs.getString("designation");
        String pgo_address=rs.getString("pgo_address");
        String mob_no=rs.getString("mob_no");
        String email_id=rs.getString("email_id");
        if (grv_status.equalsIgnoreCase("New")){
            grv_status="GRIEVANCE RECEIVED";}
        else if (grv_status.equalsIgnoreCase("Pending")){
            grv_status="UNDER PROCESS";}
        else{
            grv_status="SOLVED AND REPLY SENT";}
        
        
  %>

        
       <table width="628" height="327" border="0" class="table1">
  <tr>
    <th width="207">NAME OF COMPLAINANT:</th>
    <td width="405"><%=name%></td>
  </tr>
  <tr>
    <th>RECEIVED BY:</th>
    <td><%=govt_dept%></td>
  </tr>
  <tr>
    <th>RECEIVED ON:</th>
    <td><%=regd_date%></td>
  </tr>
  <tr>
    <th>CASE PRESENTLY WITH:</th>
    <td><%=pgo_name%></td>
  </tr>
  <tr>
    <th>CURRENT STATUS:</th>
    <td><%=grv_status%></td>
  </tr>
  <tr>
    <th>OFFICIAL DETAILS:</th>
    <td><h4><font color="purple"><a href="NewGrievanceFlowStatus.jsp?grv_regd_id=<%=grv_regd_id%>" class="various fancybox.ajax">Details of flow of Grievance</a></font></h4>
 </td>
  </tr>
  <tr>
    <th colspan="2"><strong>CASE HANDLED BY:</strong></th>
     </tr>
  <tr>
    <th>OFFICER NAME:</th>
    <td><%=pgo_name%></td>
  </tr>
  <tr>
    <th>DESIGNATION:</th>
    <td><%=designation%></td>
  </tr>
  <tr>
    <th>ADDRESS:</th>
    <td><%=pgo_address%></td>
  </tr>
  <tr>
    <th>MOBILE NO:</th>
    <td><%=mob_no%></td>
  </tr>
  <tr>
    <th>EMAIL-ID:</th>
    <td><%=email_id%></td>
  </tr>
</table>
<%}else
       {
        
        %>
        <h3> No data found </h3>
        <%
}
       }
    %>
<%@ include file="common/lbody.jsp" %>
    </body>
</html>
