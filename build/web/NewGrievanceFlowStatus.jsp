<%-- 
    Document   : NewGrievanceFlowStatus
    Created on : 10 Dec, 2012, 6:12:11 PM
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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
       <table width="700" height="231" border="1" class="table1">
  <tr>
    <th colspan="4" scope="col">GRIEVANCE FLOW STATUS</th>
  </tr>
  <tr>
    <td width="100" height="40"><div align="center">ACTION DATE</div></td>
    <td width="300"><div align="center">DESCRIPTION</div></td>
    <td width="150"><div align="center">SENT BY</div></td>
    <td width="150"><div align="center">CASE PRESENTLY WITH</div></td>
  </tr>
  <%
        String grv_regd_id=request.getParameter("grv_regd_id");
        
    Connection con = new DBConnection().getConnection(); 
    
    String sql01="select * from grv_regd where grv_regd_id=?";
    PreparedStatement ps101 = con.prepareStatement(sql01);
    ps101.setString(1, grv_regd_id);
    String desc1="REGISTERED THE GRIEVANCE";
    String sent_by1="user/complainant";
    ResultSet rs101=ps101.executeQuery();
    if (rs101.next())
    {
        
        String action_date1=rs101.getString("regd_date");
        String sent_to1=rs101.getString("pgo_regd_id");
        %>
        <tr>
    <td><%=action_date1%></td>
    <td><%=desc1%></td>  
    <td><%=sent_by1%></td>
    <td><%=sent_to1%></td>
  </tr>
  <%}%>

  <%
    String sql0="select * from grv_regd where grv_regd_id=?";
    PreparedStatement ps0 = con.prepareStatement(sql0);
    ps0.setString(1, grv_regd_id);
    String desc="RECEIVED THE GRIEVANCE";
    String sent_by="user/complainant";
    ResultSet rs0=ps0.executeQuery();
    if (rs0.next())
    {
        
        String action_date=rs0.getString("received_date");
        String sent_to=rs0.getString("pgo_regd_id");
        %>
        <tr>
    <td><%=action_date%></td>
    <td><%=desc%></td>  
    <td><%=sent_by%></td>
    <td><%=sent_to%></td>
  </tr>
  <%}%>
    
<%
    String sql="select * from grv_action where grv_regd_id=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();
    while (rs.next())
    {
        
        String action_date=rs.getString("action_date");
        String action_id=rs.getString("action_id");
        String decision=rs.getString("decision");
        String action_taken_by=rs.getString("action_taken_by");
        String case_presently_with=rs.getString("case_presently_with");
        
        if(decision.equalsIgnoreCase("examine at our level")){
                    decision="EXAMINED AT OUR LEVEL";
                    case_presently_with=action_taken_by;
                                                             }
        
        else if(decision.equalsIgnoreCase("forward to subordinate organization"))
                    decision="FORWARDED to subordinate organization";
        
        else if(decision.equalsIgnoreCase("no action")){
                    decision="NO ACTION";
                    case_presently_with=action_taken_by;
                                                       }
       
        else if(decision.equalsIgnoreCase("not pertaining to our organization")){
                    decision="CASE RETURNED";
                                                                                }
        
    
  %>
        
  <tr>
    <td><%=action_date%></td>
    <td><%=decision%></td>  
    <td><%=action_taken_by%></td>
    <td><%=case_presently_with%></td>
  </tr>
  <%}%>
  <%
    String sql1="select * from grv_pending_action where grv_regd_id=? ";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, grv_regd_id);
    ResultSet rs1=ps1.executeQuery();
    while (rs1.next())
    {
        
        String action_date=rs1.getString("action_date");
        String clarification_type=rs1.getString("clarification_type");
        String decision=rs1.getString("decision");
        String action_taken_by=rs1.getString("action_taken_by");
        String case_presently_with=rs1.getString("case_presently_with");
        
        if(decision.equalsIgnoreCase("send reminder to subordinate organization")){
                    decision="REMINDER SENT TO FORWARDED ORG";
                                                             }
        
        else if(decision.equalsIgnoreCase("send report"))
                    decision="CASE REPORT SENT & DISPOSED LOCALLY";
        
        else if(decision.equalsIgnoreCase("seek clarification from...")){
            if (clarification_type.equalsIgnoreCase("SUBORDINATE ORGANIZATION"))
                   {
                       decision="QUESTION SENT TO FORWARDED ORG";
                   }
            else{
                decision="QUESTION SENT TO USER";
                }
                                                                         }
                    
        else if(decision.equalsIgnoreCase("pass report"))
                    decision="CASE REPORT SENT & DISPOSED LOCALLY";
        
        else if(decision.equalsIgnoreCase("DISPOSE (direct grievance)")){
                    decision="DISPOSED DIRECT GRIEVANCE";
                                                                                }
        else if(decision.equalsIgnoreCase("DISPOSE (transfered grievance)")){
                    decision="DISPOSED TRANSFERED GRIEVANCE";
                                                                                }
        
        
    
  %>
        
  <tr>
    <td><%=action_date%></td>
    <td><%=decision%></td>  
    <td><%=action_taken_by%></td>
    <td><%=case_presently_with%></td>
  </tr>
  <%}%>

</table>
  
    

    </body>
</html>
