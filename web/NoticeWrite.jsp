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
    
       <form action="Notice" method="post" name="Notice" >
  <table width="600" border="0" align="center" class="table1">
  
    
    <tr>
        <th colspan="3" scope="col"><font color="purple">NOTICE</font></th>
    </tr>
     
   
    <tr>
      <th width="200">TYPE</th>
       <td width="400">
           
          <select name="type">
                <option value="">--Select--</option> 
                <option >PGO</option>
                <option >ALL</option>
          </select>
       </td>
       </tr>
      <th>NOTICE</th>
      <td><textarea name="notice" cols="40" rows="10"></textarea></td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <td> <input name="submit" type="submit" value="Submit" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
      <input name="reset" type="Reset" value="Reset" /></td>
    </tr>
    <tr>
      <td colspan="2" align="right"><a href="Notice.jsp">BACK</a></td>
       </tr>
    
    
</table>

</form>
  
        <%@ include file="common/lbody.jsp" %>
    
    </body>
</html>
