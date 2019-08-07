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
        <h2><font color="purple">CORRESPONDENCE LETTER</font></h2>
     <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">    <form action="SearchGrvPgoLetter.jsp" name="SearchGrvPgoLetter" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
     <table width="700" height="300" border="1" class="table1">
         
  
  
  <tr>
      <th colspan="3" scope="col"></th>
    <th colspan="2" scope="col"><em><u><a href="PgoWriteUserLetter.jsp">------->SEND USER LETTER<-------</a></u></em></th>
  </tr>
  <tr>
      <th width="100">LETTER NO</th>

    <th width="100">GRIEVANCE REGISTRATION ID</th>
    <th width="100">USER REGISTRATION ID</th>
    
    <th width="200" align="center">TYPE</th>
    <th width="200" align="center">LETTER SENDING DATE</th>
      </tr>
      <%
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select * from user_letter where pgo_regd_id=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
        String grv_regd_id=rs.getString("grv_regd_id");
        String user_regd_id=rs.getString("user_regd_id");
        String type=rs.getString("type");
        String received_date=rs.getString("received_date");
        String uletter_no=rs.getString("uletter_no");
        
    
  %>
  
  <tr>
      <td><a href="PgoLetterDetails.jsp?uletter_no=<%=uletter_no%>">--><%=uletter_no%><--</a></td>
    
    <td><%=grv_regd_id%></td>
    <td><%=user_regd_id%></td>
    <td><%=type%></td>
    <td><%=received_date%></td>
    </tr>
    <%}%>
    
    <tr>
    <td colspan="1" height="23">NO OF RECORDS:</td>
   
    <td colspan="4"><%=record%></td>
  </tr>

 
</table>
        
        <%@ include file="common/lbody.jsp" %>
        <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
