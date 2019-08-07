<%-- 
    Document   : ViewAction
    Created on : 10 Apr, 2013, 7:06:11 AM
    Author     : HOME
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%@page import="java.sql.Connection"%>
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
        <h2><font color="purple">View Action Taken on Grievance</font></h2>
        <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
    <form action="SearchGrvAction.jsp" name="SearchGrvAction" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
    
        <table border="1" style="border-collapse: collapse;padding:4px" class="table1">
            <tr>
                <th>action_id</th>
                <th>action_date</th>
                <th>grv_regd_id</th>
                
                <th>decision</th>
                
                <th>action_taken_by</th>
                <th>case_presently_with</th>
                
           </tr>
        <%
            String search=request.getParameter("grv_regd_id");
            Connection con=new DBConnection().getConnection();
            String sql="select * from grv_action where grv_regd_id=? ";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, search);
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                String action_id=rs.getString("action_id");
                //String pending_action_id=rs.getString("pending_action_id");
                String grv_regd_id=rs.getString("grv_regd_id");
                String action_taken_by=rs.getString("action_taken_by");
                String case_presently_with=rs.getString("case_presently_with");
                String decision=rs.getString("decision");
                String action_date=rs.getString("action_date");
                               
        %>
        <tr>
                <td><%=action_id %></td>
                <td><%=action_date %></td>
                
                <td><%=grv_regd_id %></td>
                <td><%=decision %></td>
                
                <td><%=action_taken_by %></td>
                <td><%=case_presently_with %></td>
                </tr> 
        <% } %>
        
        <% 
        String sql1="select * from grv_pending_action where grv_regd_id=?";
            PreparedStatement ps1=con.prepareStatement(sql1);
            ps1.setString(1, search);
            
            ResultSet rs1=ps1.executeQuery();
            while(rs1.next())
            {
                //String action_id=rs1.getString("action_id");
                String pending_action_id=rs1.getString("pending_action_id");
                String grv_regd_id=rs1.getString("grv_regd_id");
                String action_taken_by=rs1.getString("action_taken_by");
                String case_presently_with=rs1.getString("case_presently_with");
                String decision=rs1.getString("decision");
                String action_date=rs1.getString("action_date");
                               
        %>
        <tr>
                <td><%=pending_action_id %></td>
                <td><%=action_date %></td>
                
                <td><%=grv_regd_id %></td>
                <td><%=decision %></td>
                
                <td><%=action_taken_by %></td>
                <td><%=case_presently_with %></td>
                </tr> 
        <% } %>
        
        
     </table>
     <%@ include file="common/lbody.jsp" %>
    </body>
</html>
