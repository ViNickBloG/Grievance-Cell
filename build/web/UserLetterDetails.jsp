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
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        <table width="631" height="507" border="1" class="table1">
  <tr>
    <th height="23" scope="col">&quot;LETTER DETAILS&quot;</th>
  </tr>
   <%
    String uletter_no=request.getParameter("uletter_no");         
    Connection con = new DBConnection().getConnection();      
    String sql="select * from user_letter where uletter_no=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, uletter_no);
    ResultSet rs=ps.executeQuery();   
     
    if (rs.next())
    {
        
        String message=rs.getString("message");
        
        %>
        
       
  <tr>
      <td height="427" >
      
          <div style="word-break: break-all;width: 560px;">
          <%=message%>
          </div>
      </td>
  </tr>
 
  <tr>
      <td><a href="PrintReport.jsp?uletter_no=<%=uletter_no%>" target="_blank">PRINT</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="UserLetterList.jsp">BACK</a></td>
  </tr>
  <%}%>

</table>
  
  <%@ include file="common/lbody.jsp" %>
    </body>
</html>
