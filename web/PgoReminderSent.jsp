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
       <h2><font color="purple">REMINDER SENT</font></h2>
     <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">    <form action="SearchGrvSent.jsp" name="SearchGrvSent" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div> 
        <table width="701" height="70" border="1" class="table1">
  
  <tr>
    <th width="123">DATE SENT</td>
    <th width="171">GRIEVANCE REGISTRATION NO</td>
    <th width="385">SENT TO</td>
  </tr>
  
  <%
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select * from reminder_box where sent_by_pgo=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
        String rem_sent_date=rs.getString("rem_sent_date");
        String grv_regd_id=rs.getString("grv_regd_id");
        String sent_to_pgo=rs.getString("sent_to_pgo");
        String sent_to_org=rs.getString("sent_to_org");
        String rem_id=rs.getString("rem_id");
        
     String sql3="select or1.*,pr1.* from org_regd or1 join pgo_regd pr1 on(or1.org_id=pr1.org_id)  where or1.org_id=? and pr1.pgo_regd_id=?  ";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, sent_to_org);
     ps3.setString(2, sent_to_pgo);
     ResultSet rs3=ps3.executeQuery();
                            if (rs3.next())
                            {
                                String pgo_name=rs3.getString("pgo_name");
                                String designation=rs3.getString("designation");
                                String govt_dept=rs3.getString("govt_dept");
                                String dist=rs3.getString("dist");
                                String block=rs3.getString("block");
                                
                                if(dist==null)
                                    dist="";
                                if(block==null)
                                    block="";

    
        
  %>
  
  <tr>
    <td height="20"><%=rem_sent_date%></td>
    <td scope="col"><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    <td scope="col"><a href="PgoReminderContent.jsp?rem_id=<%=rem_id%>"><%=sent_to_pgo%>-<%=pgo_name%>-<%=designation%></a></br><%=sent_to_org%>-<%=govt_dept%></br><%=dist%>-<%=block%></td>
  </tr>
  <%}}%>
  <tr>
      <td><div align="left">NO OF REMINDERS SENT:</div></td>
      <td colspan="2"><%=record%></td>
    
  </tr>
  
  
</table>

<%@ include file="common/lbody.jsp" %>
<%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
