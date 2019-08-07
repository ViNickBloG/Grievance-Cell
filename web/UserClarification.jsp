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
        <%
        String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: green;"> <%=status%> </h5>
    <%}%>
        
   <table width="700" height="100" border="1" class="table1">
   <tr>
      <th colspan="4" scope="col">CLARIFICATION LETTER RECEIVED</th>
    </tr>
   
  <tr>
    <th width="100">DATE RECEIVED</th>
    <th width="100">GRIEVANCE REGISTRATION NO</th>
    <th width="300"><div align="center">SENDER</div></th>
    <th width="200">SHOW LETTER/REPLY TO LETTER</th>
    
  </tr>
  
   <%
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  String user_regd_id=(String)session.getAttribute("user_regd_id");
  String org_id=(String)session.getAttribute("org_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select * from clarification_box where sent_to_user=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_regd_id);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
        String clarification_sent_date=rs.getString("clarification_sent_date");
        String grv_regd_id=rs.getString("grv_regd_id");
        String sent_by_pgo=rs.getString("sent_by_pgo");
        String sent_by_org=rs.getString("sent_by_org");
        //String sent_to_user=rs.getString("sent_to_user");
        String clarification_id=rs.getString("clarification_id");
        
        
     String sql3="select or1.*,pr1.* from org_regd or1 join pgo_regd pr1 on(or1.org_id=pr1.org_id)  where or1.org_id=? and pr1.pgo_regd_id=?  ";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, sent_by_org);
     ps3.setString(2, sent_by_pgo);
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
    <td><%=clarification_sent_date%></td>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    <td>SENDER TYPE:Higher Org</br><%=sent_by_pgo%>-<%=pgo_name%>-<%=designation%></br><%=sent_by_org%>-<%=govt_dept%></br><%=dist%>-<%=block%></td>
    <td><a href="UserClarificationDetails.jsp?clarification_id=<%=clarification_id%>">SHOW/REPLY</a></td>
  </tr>
  
  <%}}%>
  <tr>
      <td colspan="2"><div align="left">NO OF CLARIFICATION LETTER RECEIVED:</div></td>
      <td colspan="2"><%=record%></td>
    
  </tr>
 
  
  
  
  
  </table>
<%@ include file="common/lbody.jsp" %>
    </body>
</html>
