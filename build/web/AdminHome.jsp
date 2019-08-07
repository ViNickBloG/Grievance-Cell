<%-- 
    Document   : PgoHome
    Created on : 9 Dec, 2012, 9:14:44 PM
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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
      <%
      
String status =(String)request.getAttribute("status");
if(status!=null)
out.println("<h2>"+status+"</h2>");          


    String admin_regd_id=(String)session.getAttribute("admin_regd_id");
    
    if (admin_regd_id==null)
      admin_regd_id="1";
    
    Connection con = new DBConnection().getConnection();   
    String sql="select * from admin_regd where admin_regd_id=?"; 
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, admin_regd_id);
    ResultSet rs=ps.executeQuery();
    if (rs.next())
   {
        String name=rs.getString("admin_name");
        
        
        
       
  %> 
        
        <table width="655" height="511" border="0" class="table3">
  <tr>
      <td colspan="3">WELCOME&nbsp;&nbsp;&nbsp;<%=name%></td>
  </tr>
  <tr>
    <td colspan="2">Choose a Category :</td>
    <td>
   
        <img src="icons/admin_icon.png" width="200" height="100" title="ADMIN" />
       </td>
  </tr>
  <tr><td colspan="3">&nbsp;</td></tr>
  <tr>
    <td width="273"> &nbsp; </td>
    <td width="64" rowspan="16">&nbsp;</td>
    <td width="338">PROFILE</td>
    </tr>
    
  <tr>
    <td><a href="ManageOrganization.jsp">View ORGANIZATION</a></td>
    <td>NAME:&nbsp;&nbsp;<%=name%></td>
  </tr>
  <tr>
    <td><a href="RegisterPgo.jsp">REGISTER PGO</a></td>
    <td>DESIGNATION:&nbsp;&nbsp;ADMINISTRATOR</td>
  </tr>
  <tr>
    <td><a href="ManagePgo.jsp">MANAGE PGO</a></td>
    <td>&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td><a href="GrievanceCategory.jsp">GRIEVANCE CATEGORY</a></td>
    <td>REGISTRATION ID:&nbsp;&nbsp;<%=admin_regd_id%></td>
  </tr>
  
  <tr>
    <td><a href="ManagePassword.jsp">CHANGE/RESET PASSWORD</a></td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td><a href="Notice.jsp">NOTICE</a></td>
    <td>&nbsp;</td>
  </tr>
  
  <tr>
    <td><a href="Feedback.jsp">FEEDBACK EVALUATION</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><a href="UserList.jsp">USER LIST</a></td>
    <td>&nbsp;</td>
  </tr>
   
   <tr>
    <td><a href="GrievanceAbstract.jsp">GRIEVANCE ABSTRACT</a></td>
    <td>&nbsp;</td>
  </tr>
</table>

  <%}%>

  <%@ include file="common/lbody.jsp" %>
    </body>
</html>
