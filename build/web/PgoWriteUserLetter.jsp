<%-- 
    Document   : PgoWriteLetter
    Created on : 10 Dec, 2012, 12:56:27 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script type="text/javascript" src="javascript/common.js"></script>
	 </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <%
         
             String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
 
         
          
        %>
        <form method="post" action="PgoWriteLetter" name="abc" >
            
            <table class="table1">
                <tr><th colspan="5">SEND USER LETTER</th></tr>
                <tr>
                    <th>Type of Letter:</th>
                
                <td>
                    <font color="purple">USER LETTER</font>
                </td>
                </tr>
            <tr>
              <th>User Regd. Id.</th>
              <td><input name="user_regd_id" type="text" value="" placeholder="user_regd_id" size="" maxlength="10" /></td>
            </tr>
            <tr>
              <th> Grievance Regd. Id</th>
              <td><input name="grv_regd_id" type="text" value="" placeholder="grv_regd_id" size="" maxlength="10" /></td>
            </tr>
            <tr>
              <th>Subject</th>
              <td><input name="subject" type="text" value="" placeholder="subject" size=""  /></td>
            </tr>
                 <tr>
              <th>Message:</th>
              <td>
                  <input type="hidden" name="pgo_regd_id" id="pgo_regd_id" value="<%=pgo_regd_id%>" />
              <input type="hidden" name="type" id="type" value="user letter" />
              
                  <textarea name="message" cols="40" rows="15"></textarea></td>
            </tr>
            <tr>
                <th>&nbsp;</th>
                <td align="right">
                <label>
                    <input type="submit" name="submit" id="submit" value="SEND" />
                </label>
                </td>    
            </tr>
            </table>
                
        </form>
        
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
