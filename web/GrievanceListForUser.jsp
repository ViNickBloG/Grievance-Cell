<%-- 
    Document   : GrievanceListForUser
    Created on : 8 Dec, 2012, 4:37:29 PM
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
        
        
        <table width="536" border="1" class="table1">
  <tr>
    <th  scope="col">GRIEVANCE <br />
      REGISTRATION<br />
      DATE</th>
    <th scope="col">GRIEVANCE <br />
    NUMBER</th>
    <th scope="col">SUBMITTED TO<br />
    (OFFICE NAME)</th>
    <th scope="col">DETAILS<br />
      (press button)</th>
  </tr>
          <%
    String user_regd_id=request.getParameter("user_regd_id");         
    Connection con = new DBConnection().getConnection();   
    String sql="select * from grv_regd where user_regd_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_regd_id);
    ResultSet rs=ps.executeQuery();   
    int grv_no=0;
    while (rs.next())
    {
        grv_no++;
        String regd_date=rs.getString("regd_date");
        String govt_dept=rs.getString("govt_dept");
        String grv_regd_id=rs.getString("grv_regd_id");
        
        
        
        
  %>

        
        
  <tr>
    <td><%=regd_date%></td>
    <td><%=grv_no%></td>
    <td><%=govt_dept%></td>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>">VIEW DETAILS</a></td>
  </tr>

  <%}%>
  </table>
 <%@ include file="common/lbody.jsp" %>
 
    </body>
</html>
