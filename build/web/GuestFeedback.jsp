<%-- 
    Document   : GuestFeedback
    Created on : May 13, 2013, 3:17:15 PM
    Author     : Deepun
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
         <%
    String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: green;"> <%=status%> </h5>
    <%}%>
    
       <form action="Feedback" method="post" name="Feedback" >
  <table width="600" border="0" align="center" class="table1">
  
    
    <tr>
      <th colspan="3" scope="col">FEEDBAK & SUGGESTIONS</th>
    </tr>
     
    <tr>
      <th width="200">Name</th>
      <td width="400"><input name="name" type="text" value=""  size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>Mobile Number</th>
      <td><input name="mob_no" type="text" value="" placeholder="Mobile number" size="10" maxlength="10" />
        (Don't Prefix 0 or +91)</td>
    </tr>
    <tr>
      <th>email id</th>
      <td><input name="email_id" type="text" value="" placeholder="email id" size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>Feedback/Suggestion</th>
      <td><textarea name="content" cols="40" rows="10"></textarea></td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <td> <input name="submit" type="submit" value="Submit" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
      <input name="reset" type="Reset" value="Reset" /></td>
    </tr>
    
    
</table>

</form>
  
        <%@ include file="common/lbody.jsp" %>
    
    </body>
</html>
