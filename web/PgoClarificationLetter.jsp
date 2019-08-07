<%-- 
    Document   : PgoClarification
    Created on : 10 Dec, 2012, 4:29:42 PM
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
        <%String clarification_id=request.getParameter("clarification_id");
         String reply_sent_by_pgo=(String)session.getAttribute("pgo_regd_id");
  String reply_sent_by_org=(String)session.getAttribute("org_id");
  String reply123="";
 
        String abc=request.getParameter("abc");
        System.out.println("################"+abc);
    Connection con = new DBConnection().getConnection();   
    String sql="select * from clarification_box where clarification_id=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, clarification_id);
    ResultSet rs=ps.executeQuery();
 
    if (rs.next())
   {
       
        String sent_to_pgo=rs.getString("sent_to_pgo");
        String clarification_ques=rs.getString("clarification_ques");
        String clarification_reply_date=rs.getString("clarification_reply_date");
        String clarification_reply=rs.getString("clarification_reply");
        reply123=clarification_reply;
        
        if(clarification_reply_date==null)
            clarification_reply_date="";
        if(clarification_reply==null)
            clarification_reply="";
        
        if(reply_sent_by_pgo.equalsIgnoreCase(sent_to_pgo))
       {
        String sql1="update clarification_box set indicator=1 where clarification_id=?";
        PreparedStatement ps1 = con.prepareStatement(sql1);
        ps1.setString(1, clarification_id);
        ps1.executeUpdate();
        }
        
        %>
  
        
        <table width="600" height="200" border="5" class="table1">
  <tr>
    <th width="100">LETTER :</th>
    <td width="400"><%=clarification_ques%></td>
  </tr>
  <% if(abc!=null){%>
  <tr>
      <th>Reply Received On:</th>
      <td><%=clarification_reply_date%></td>
  </tr>
  <tr>
    <th>REPLY SENT BY USER/ORG:</th>
    <td><%=clarification_reply%></td>
  </tr>
  <%}}%>
</table>








<form name="abc" id="abc" action="ClarificationLetter" method="post">
    <% if(abc==null){%>
<table width="600" height="200" border="5">
  <tr>
    <td width="100">WRITE REPLY/REPLY GIVEN :</td>
    <% if(reply123==null || reply123.equals("")){%>
    <td width="400">
        <input type="hidden" name="reply_sent_by_pgo" id="textfield" value="<%=reply_sent_by_pgo%>">
        <input type="hidden" name="reply_sent_by_org" id="textfield" value="<%=reply_sent_by_org%>">
        <input type="hidden" name="clarification_id" id="textfield" value="<%=clarification_id%>">
        <textarea name="reply" id="textarea" cols="50" rows="5"></textarea>
    </td>
    <%}else{%>
     <td width="400">
    <textarea name="reply" id="textarea" cols="50" rows="5" onfocus="this.blur()"><%=reply123%></textarea>
     </td>
     <%}%>
  </tr>
  <tr>
      <% if(reply123==null || reply123.equals("")){%>
    <td colspan="2"><label>
            <div align="right">
      <input type="submit" name="button10" id="button10" value="Submit" />
            </div>
    </label></td>
    <%}else{%>
    <td colspan="2"><label>
            <div align="right">
      <a href="PgoClarificationReceived.jsp">BACK</a>
            </div>
    </label></td>
    <%}%>
    
    
  </tr>
</table>
<%}%>
</form>
<%@ include file="common/lbody.jsp" %>

    </body>
</html>
