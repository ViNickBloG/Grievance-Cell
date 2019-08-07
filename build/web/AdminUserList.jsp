<%-- 
    Document   : AdminUserList
    Created on : 7 Dec, 2012, 6:17:51 PM
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
        
        
        <table width="504" height="185" border="1" class="table1">
  <tr>
    <th height="73" scope="col">USER
    REGISTARTION NO</th>
    <th scope="col">DATE OF
    REGISTRATION</th>
    <th scope="col">NAME OF
    USER</th>
  </tr>
  <%
    Connection con = new DBConnection().getConnection();   
    String sql="select * from user_regd  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
    {
        record++;
        String user_regd_id=rs.getString("user_regd_id");
        String user_regd_date=rs.getString("user_regd_date");
        //String name="";
        String name=rs.getString("name");
        
        
  %>
  
  <tr>
    <td height="26"><%=user_regd_id%></td>
    <td><%=user_regd_date%></td>
    <td><a href="UserDetails.jsp?user_regd_id=<%=user_regd_id%>">
        <%=name%>
        </a>
    </td>
    
  </tr>
  <%}%>
  <tr>
    <td colspan="2">NO OF USERS REGISTERED:</td>
    <td><%=record%></td>
  </tr>
</table>

  
    <%@ include file="common/lbody.jsp" %>
  </body>
</html>
