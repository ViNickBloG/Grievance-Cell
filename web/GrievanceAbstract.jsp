<%-- 
    Document   : GrievanceAbstract
    Created on : 9 Apr, 2013, 1:59:28 PM
    Author     : user
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
       <table width="600" border="0" class="table1">
  <tr>
    <th colspan="3" scope="col"> GRIEVANCE ABSTRACT
       </th>
  </tr>
  <tr>
    <td height="48"><a href="AdminViewGrievance.jsp">VIEW GRIEVANCES</a>&nbsp;</td>
    <td><a href="AdminViewAction.jsp">VIEW ACTION TAKEN ON GRIEVANCES</a>&nbsp;</td>
    <td><a href="GrievanceTracker.jsp">VIEW GRIEVANCE TRACKER</a>&nbsp;</td>
  </tr>
</table>
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
