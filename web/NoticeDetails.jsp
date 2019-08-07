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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table width="631" height="507" border="1" class="table1">
  <tr>
    <th height="23" scope="col">&quot;NOTICE DETAILS&quot;</th>
  </tr>
   <%
    String abc=request.getParameter("notice_no");         
    Connection con = new DBConnection().getConnection();      
    String sql="select * from notice where notice_no=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, abc);
    ResultSet rs=ps.executeQuery();   
     
    if (rs.next())
    {
        
        String message=rs.getString("notice");
        
        %>
        
       
  <tr>
    <td height="427"><%=message%></td>
  </tr>
 
  <tr>
      <td>PRINT&nbsp;&nbsp;&nbsp;&nbsp;<a href="Notice.jsp">BACK</a></td>
  </tr>
  <%}%>

</table>
  
    </body>
</html>
