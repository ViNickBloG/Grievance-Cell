<%-- 
    Document   : UserLetterDetails
    Created on : 9 Dec, 2012, 8:44:02 PM
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
        
        
<link rel="stylesheet" href="css/styles2.css" type="text/css" media="screen"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
        <table width="631" height="100" border="0" style="border-collapse: collapse" class="table1" class="table1">
   <%
    String user_letter_no=request.getParameter("uletter_no");         
    Connection con = new DBConnection().getConnection();      
    String sql="select * from user_letter where uletter_no=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_letter_no);
    ResultSet rs=ps.executeQuery();   
     
    if (rs.next())
    {
        
        String message=rs.getString("message");
        String subject=rs.getString("subject");
        
        %>
        
    <tr>
    <td height="50" >SUBJECT:<%=subject%></td>
  </tr>
     
  <tr>
    <td height="50" vertical-align="top"><%=message%></td>
  </tr>
  <%}%>
  
</table>
  
  <script>
     window.print();
  </script>
  
    </body>
</html>
