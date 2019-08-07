<%-- 
    Document   : changepasswordUser
    Created on : 12 Apr, 2013, 11:32:28 PM
    Author     : HOME
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
         <script type="text/javascript" src="javascript/common.js"></script>
	<script type="text/javascript" src="javascript/changepassword.js"></script>
        <%@include file="common/head.jsp"%>
    </head>
    <body>
        <%@include file="common/ubody.jsp"%>
    <form name="form1" method="post" action="changepasswordvalUser.jsp"onsubmit=" return checkForm(this)">
      <table width="285" border="1" class="table1">
           <tr>
          <th width="125">USER Registration ID </th>
          <td width="144"><label>
                  <input type="text" name="user_regd_id" id="user_regd_id"/>
              </label><label id="user_regd_id"></label></td>
        </tr>
        <tr>
          <th width="125">Current Password </th>
          <td width="144"><label>
            <input type="password" name="oldpass" id="oldpass"/>
          </label><label id="oldpassL"></label></td>
        </tr>
        <tr>
          <th>New Password </th>
          <td><label>
            <input type="password" name="newpass" name="newpass" id="newpass"/>
          </label><label id="newpassL"></label></td>
        </tr>
        <tr>
          <th>Retype Password </th>
          <td><label>
            <input type="password" name="cnewpass" id="cnewpass"/>
          </label><label id="cnewpassL"></label></td>
        </tr>
        
        <tr>
          <td colspan="2"><label>
            <input type="submit" name="Submit" value="Submit">
            <input type="reset" name="Submit3" value="Reset">
          </label>            <label></label></td>
        </tr>
      </table>
    </form>
        
    <%@include file="common/lbody.jsp"%>
    </body>
</html>

