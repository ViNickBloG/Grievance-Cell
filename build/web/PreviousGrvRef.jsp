<%-- 
    Document   : PreviousGrvRef
    Created on : 9 Dec, 2012, 10:37:11 PM
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
        
        <table width="506" height="110" border="1" class="table1">
  <tr>
    <th colspan="3" scope="col">GRIEVANCE REFERENCE</th>
  </tr>
  <tr>
    <td width="167">GRIEVANCE REGD ID</td>
    <td width="106">REGD DATE</td>
    <td width="149">SUBMITTED TO (Organization ID)</td>
  </tr>
   <%
    String grv_ref_status=request.getParameter("grv_ref_status");
    
    Connection con = new DBConnection().getConnection();   
    String sql="select * from grv_regd where grv_regd_id=?"; 
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_ref_status);
    ResultSet rs=ps.executeQuery();
    while (rs.next())
   {
        String regd_date=rs.getString("regd_date");
        String org_id=rs.getString("org_id");
        String grv_regd_id=rs.getString("grv_regd_id");
        
       
  %> 
  <tr>
      <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    <td><%=regd_date%></td>
    <td><%=org_id%></td>
  </tr>
  
  <%}%>
  
</table>

  <%@ include file="common/lbody.jsp" %>
    </body>
</html>
