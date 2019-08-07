<%-- 
    Document   : user_reminder
    Created on : 1 Dec, 2012, 5:36:02 PM
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
        
        
<%
String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: green;"> <%=status%> </h5>
    <%}String user_regd_id=(String)session.getAttribute("user_regd_id");
System.out.println("@@@@@@@@@"+user_regd_id);
               
%>
        
        <form id="form1" name="UserReminder" method="post" action="UserReminder">
  <table width="563" height="473" border="0" class="table1">
    <tr>
      <th colspan="2" scope="col">REMINDER TO DEALING OFFICER</th>
    </tr>
    <tr>
      <td width="266">Enter your Grievance No:</td>
      <td width="287"><label>
        <input type="text" name="grv_no" id="textfield" maxlength="3" />
        <input type="hidden" name="user_regd_id" id="textfield" value="<%=user_regd_id%>" />
     
      </label></td>
    </tr>
    
    <tr>
      <td>Description:</td>
      <td><label>
        <textarea name="description" id="textarea" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    <tr>
          <td> <img src="./CaptchaServlet"  alt="Captcha image" width="120" height="40" align="text-bottom" style="border:none" border="0"/> </td>
          <td> <input name="captcha" type="text" size="20" maxlength="6" placeholder="Enter security code" /> </td>
    </tr>
    <tr>
      <td height="80">&nbsp;</td>
      <td><label>
        <input type="submit" name="button" id="button" value="Submit" />
        <input type="reset" name="button2" id="button2" value="Reset" />
      </label></td>
    </tr>
  </table>
</form>

<%@ include file="common/lbody.jsp" %>
    </body>
</html>
