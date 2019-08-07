<%-- 
    Document   : Registration
    Created on : 20 Nov, 2012, 5:05:28 PM
    Author     : USER
--%>

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
        
        <form  method="post" action="AdminLogin" >
    <%
    String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: red;"> <%=status%> </h5>
    <%}%>
    
<table width="259" border="0"> 

  <tr>
    <th colspan="3" scope="col" bgcolor="#66CCFF">ADMIN LOG IN</th>
    </tr>
    
  <tr>
    <td width="176">ADMIN Regd.No</td>  
    <td width="300"><input type="text" name="admin_regd_id" size="25" maxlength="20"/></td>
  </tr>
  <tr>
    <td>ADMIN Password</td>
        <td><input type="password" name="password" size="25" maxlength="15" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="submit" type="submit" value="Submit" /></td>
    </tr>
    
   
  </table>
</form>
    
    <%@ include file="common/lbody.jsp" %>
    </body>
</html>

 
    
	
