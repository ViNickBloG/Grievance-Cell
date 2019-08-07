<%-- 
    Document   : PgoLetterList
    Created on : 10 Dec, 2012, 4:30:26 PM
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
        
     <table width="400" height="300" border="5" class="table1">
  <tr>
    <th colspan="2" scope="col">LETTER DETAILS</th>
  </tr>
       <%
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  String uletter_no=request.getParameter("uletter_no");
         
    Connection con = new DBConnection().getConnection();   
    String sql="select * from user_letter where uletter_no=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, uletter_no);
    ResultSet rs=ps.executeQuery();
    //int record=0;
    if (rs.next())
   {
       // record++;
        String subject=rs.getString("subject");
        String message=rs.getString("message");
        //String type=rs.getString("type");
        //String received_date=rs.getString("received_date");
        //String uletter_no=rs.getString("uletter_no");
        
    
  %>
  
  <tr>
      <th width="100">SUBJECT:</th>
      <td><%=subject%></td>
  </tr>
  <tr height="20">
      <th></th>
      <td></td>
  </tr>
 
 <tr>
      <th>MESSAGE:</th>
      <td><%=message%></td>
  </tr>
<%}%>
 
</table>
        
        <%@ include file="common/lbody.jsp" %>
        <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
