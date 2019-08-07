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
        <h2><font color="purple">PGO REMINDER RECEIVED</font></h2>
    <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
        <form action="SearchGrvReminder.jsp" name="SearchGrvReminder" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
        
        
        <table width="701" height="334" border="1" class="table1">
  <tr>
    <th colspan="3" scope="col"><em><u>PGO REMINDERS</u></em></th>
  </tr>
  <tr>
<tr>
    <td colspan="3"><strong>REMINDER RECEIVED:</strong></td>
  </tr>
  <tr>
    <td>DATE RECEIVED</td>
    <td>GRIEVANCE REGISTRATION NO</td>
    <td>SENDER</td>
  </tr>
  <%
  String search=request.getParameter("grv_regd_id");
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select * from reminder_box where sent_to_pgo=? and grv_regd_id=?";
    PreparedStatement ps= con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ps.setString(2, search);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
        String rem_sent_date=rs.getString("rem_sent_date");
        String grv_regd_id=rs.getString("grv_regd_id");
        String sent_by_pgo=rs.getString("sent_by_pgo");
        String sent_by_org=rs.getString("sent_by_org");
        String sent_by_user=rs.getString("sent_by_user");
        String rem_id=rs.getString("rem_id");
        
        if(sent_by_user==null || sent_by_user.equals("")){
        
     String sql11="select or2.*,pr2.* from org_regd or2 join pgo_regd pr2 on(or2.org_id=pr2.org_id)  where or2.org_id=? and pr2.pgo_regd_id=?  ";
     PreparedStatement ps11 = con.prepareStatement(sql11);
     ps11.setString(1, sent_by_org);
     ps11.setString(2, sent_by_pgo);
     ResultSet rs11=ps11.executeQuery();
                            if (rs11.next())
                            {
                                String pgo_name=rs11.getString("pgo_name");
                                String designation=rs11.getString("designation");
                                String govt_dept=rs11.getString("govt_dept");
                                String dist=rs11.getString("dist");
                                String block=rs11.getString("block");
                                
                                if(dist==null)
                                    dist="";
                                if(block==null)
                                    block="";

                                   
        
  %>
  
  
  <tr>
    <td><%=rem_sent_date%></td>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    <td>SENDER TYPE:Higher Org</br><a href="PgoReminderContent.jsp?rem_id=<%=rem_id%>"><%=sent_by_pgo%>-<%=pgo_name%>-<%=designation%></a></br><%=sent_by_org%>-<%=govt_dept%></br><%=dist%>-<%=block%></td>
  </tr>
  <%}}else{
            String sql99="select name from user_regd where user_regd_id=?";
             PreparedStatement ps99 = con.prepareStatement(sql99);
    ps99.setString(1, sent_by_user);
    ResultSet rs99=ps99.executeQuery();
     if (rs99.next())
                            {
                                String name=rs99.getString("name");
                           
    
   
  %>
  <tr>
    <td><%=rem_sent_date%></td>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    <td>SENDER TYPE:User</br><a href="PgoReminderContent.jsp?rem_id=<%=rem_id%>"><%=sent_by_user%>-<%=name%></a></td>
  </tr>
  
  
  
  
   <%}}}%>
   
   
   
   
   
   
   
   
   
   
   
   
   
  <tr>
      <td><div align="left">NO OF REMINDERS RECEIVED:</div></td>
      <td colspan="2"><%=record%></td>
    
  </tr>
 
  
</table>

<%@ include file="common/lbody.jsp" %>
<%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
