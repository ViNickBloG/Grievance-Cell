<%-- 
    Document   : ViewDetailsGrievance
    Created on : 9 Apr, 2013, 7:33:26 PM
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
        <h2><font color="purple">View Grievance Details</font></h2>
       
        <table border="1" width="600" height="120" style="border-collapse: collapse;padding:4px" class="table1">
            <%
                String gri=request.getParameter("gri");
                Connection con=new DBConnection().getConnection();
                String sql="select * from grv_regd where grv_regd_id=?";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, gri);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String grv_regd_id=rs.getString("grv_regd_id");
                    String govt_dept=rs.getString("govt_dept");
                    String dist=rs.getString("dist");
                    String block=rs.getString("block");
                    String lg_dist=rs.getString("lg_dist");
                    String lg_block=rs.getString("lg_block");
                    String lg_panchayat=rs.getString("lg_panchayat");
                    String lg_village=rs.getString("lg_village");
                    String nature=rs.getString("nature");
                    String grv_details=rs.getString("grv_details");
                    String action_suggested=rs.getString("action_suggested");
                    String file=rs.getString("file");
                    String grv_ref_status=rs.getString("grv_ref_status");
                    String regd_date=rs.getString("regd_date");
                    String user_regd_id=rs.getString("user_regd_id");
                    String grv_status=rs.getString("grv_status");
                    String grv_type=rs.getString("grv_type");
                    String target_date=rs.getString("target_date");
                    String org_id=rs.getString("org_id");
                    String pgo_regd_id=rs.getString("pgo_regd_id");
                
            %>
                <tr>
                     <th width="200">Grievance_Regd_Id</th>
                    <td><%=grv_regd_id %></td>
                </tr>
                <tr>
                    <th>regd_date</th>
                    <td><%=regd_date %></td>
                </tr>
                <tr>
                    <th>user_regd_id</th>
                    <td><%=user_regd_id %></td>
                </tr>
                <tr>
                    <th>org_id</th>
                    <td><%=org_id %></td>
                </tr>
                <tr>
                    <th>pgo_regd_id</th>
                    <td><%=pgo_regd_id %></td>
                </tr>
                
                <tr>
                    <th>Govt._Dept</th>   
                    <td><%=govt_dept %></td>
                </tr>
                <tr>
                    <th>District</th>
                    <td><%=dist %></td>
                </tr>
                <tr>
                    <th>Block</th>
                    <td><%=block %></td>
                </tr>
                
                <tr>
                    <th>lg_dist</th>    
                    <td><%=lg_dist %></td>
                </tr>
                <tr>
                    <th>lg_block</th>
                     <td><%=lg_block%></td>
                </tr>
                <tr>
                    <th>lg_panchayat</th>
                    <td><%=lg_panchayat %></td>
                </tr>
                <tr>
                    <th>lg_village</th>   
                    <td><%=lg_village %></td>
                </tr>
                <tr>
                    <th>nature</th>
                    <td><%=nature %></td>
                </tr>
                <tr>
                    <th>grv_details</th>    
                    <td><%=grv_details %></td>
                </tr>
                <tr>
                    <th>action_suggested</th>    
                    <td><%=action_suggested %></td>
                </tr>
                <tr>
                    <th>file</th>    
                    <td> ===<%=file%>===
        <%if(file!=null && !"-".equals(file)  && !"".equals(file)){ %>
            <a href="uploadedfiles/<%=file%>" target="_blank">Download</a>
        
           <%}%></td>
                </tr>
                <tr>
                    <th>grv_ref_status</th>
                    <td><%=grv_ref_status %></td>
                </tr>
                <tr>
                    <th>grv_status</th>
                    <td><%=grv_status %></td>
                </tr>
                <tr>
                    <th>grv_type</th>
                    <td><%=grv_type %></td>
                </tr>
                <tr>
                      <th>target_date</th>
                        <td><%=target_date %></td>
                </tr>
               
        <%}%>
        </table>
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
