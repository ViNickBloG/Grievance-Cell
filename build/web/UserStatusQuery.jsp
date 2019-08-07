<%-- 
    Document   : UserStatusQuery
    Created on : 9 Dec, 2012, 6:05:12 PM
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
        <script type="text/javascript" src="jscalendar/datetimepicker_css.js"></script>
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        <form id="form1" name="status_query" method="post" action="UserViewStatus.jsp">
            <table width="531" height="269" border="0" class="table1">
    <tr>
      <th colspan="2" scope="col">STATUS QUERY FORM</th>
    </tr>
    <tr>
      <td width="277">Enter your Grievance No:</td>
      <td width="244"><label>
        <input type="text" name="grv_no" id="grv_no" maxlength="3" />
      </label></td>
    </tr>
     <tr>
                  <td> <img src="./CaptchaServlet"  alt="Captcha image" width="120" height="40" align="text-bottom" style="border:none" border="0"/> </td>
                  <td> <input name="captcha" type="text" size="20" maxlength="6" /> </td>
              </tr>
    <tr>
      <td height="80">&nbsp;</td>
      <td>
        <input type="submit" name="button" id="button" value="Submit" />
        <input type="reset" name="button2" id="button2" value="Reset" />
      </td>
    </tr>
  </table>
</form>
        
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
