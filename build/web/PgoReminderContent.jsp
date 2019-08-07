<%-- 
    Document   : PgoReminder
    Created on : 10 Dec, 2012, 4:29:11 PM
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
        
        <table width="699" height="100" border="2" class="table1">
            <% 
            String rem_id=request.getParameter("rem_id");
             Connection con = new DBConnection().getConnection();   
    String sql="select content_sent from reminder_box where rem_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, rem_id);
    //ps.setString(2, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    
    if (rs.next())
    {
        String content_sent=rs.getString("content_sent");
   
            
String sqlab="update reminder_box set indicator=1 where rem_id=?";
        PreparedStatement psab = con.prepareStatement(sqlab);
        psab.setString(1, rem_id);
        psab.executeUpdate();
 


%>

                       <tr>
      <th width="100"><h2><strong>REMINDER:</h2></strong></th>
            <td width="20">&nbsp;</td>
    <td width="579"><%=content_sent%></td>
  </tr>
<%}%>
</table>

<%@ include file="common/lbody.jsp" %>
<%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
  