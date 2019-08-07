<%-- 
    Document   : Login
    Created on : 22 Nov, 2012, 5:10:03 PM
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
        
   <center>
  <input name="submit" type="button" value="HOME" />
  <input name="submit" type="button" value="ABOUT THE SITE" />
  <input name="submit" type="button" value="DEMO" />
  <input name="submit" type="button" value="HOW IT WORKS" />
  <input name="submit" type="button" value="STATISTICS" />
  <tr>
    <td>Language</td>
    <td>:</td>
    <td><select name="Language">
      <option selected="selected">--Select--</option>
      <option >English</option>
      <option >Hindi</option>
      <option >Oriya</option>
    </select></td>
  </tr>
  </center>
  <br/>

  <div style="float:left;margin-left:150px;">
  
      
<form action="" method="get" name="user_login">
<table width="500" border="0">
<tr height="50"></tr>
  <tr>
    <th colspan="3" scope="col" bgcolor="yellow">USER LOG IN</th>
    </tr>
    <tr height="20"></tr>
  <tr>
    <td width="176">User Regd.No</td>  
    <td width="300"><input type="text" name="user_regd_id" size="25" maxlength="20"/></td>
  </tr>
  <tr>
    <td>User Password</td>
        <td><input type="password" name="password" size="25" maxlength="15" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="submit" type="submit" value="Submit" /></td>
    </tr>
    <tr height="20"></tr>
    <tr>
    <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<a href=""> Forgot Password?</a>
    </td>
  </tr>
  <tr height="50"></tr>
  <tr>
    <td>&nbsp;Are you a new User?</td>
    <td>  <a href="">REGISTER</a></td>
  </tr>
 </table>
</form>
 
      
 </div>
 
  <div style="float:right;margin-right:150px;">
  
  <form action="" method="get" name="pgo_login">
<table  border="0">
<tr height="50"></tr>
  <tr>
    <th colspan="3" scope="col" bgcolor="yellow">PGO LOG IN</th>
    </tr>
    <tr height="20"></tr>
  <tr>
    <td width="176">PGO Name</td>  
    <td width="300"><input type="text" name="pgo_regd_id" size="25" maxlength="20"/></td>
  </tr>
  <tr>
    <td>PGO Password</td>
        <td><input type="password" name="password" size="25" maxlength="15" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="submit" type="submit" value="Submit" /></td>
  </tr>
   <tr height="20"></tr>
  <th>
  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=""> ADMIN LOG IN</a></td>
  
  </th>
</table>

</form>

</div>
<span style="clear:both"></span>

<%@ include file="common/lbody.jsp" %>
    </body>
</html>
