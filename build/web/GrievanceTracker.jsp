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
        <h2><font color="purple">GRIEVANCE TRACKER</font></h2>
        <div style="margin-top: -50px;margin-left: 330px;">
        <form action="SearchAdminGrvTracker.jsp" name="SearchAdminGrvTracker" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <img src="icons/search.png"  width="20" height="20" title="SEARCH" />
        <input name="submit" type="submit" value="Submit" />
        
        </form>

        </div>
    
       
        <table border="1" width="600" height="120"  class="table1">
            <tr>
                <th  height="70" width="100" align="center">Grievance_Regd_id</th>
                <th  width="100" align="center">Regd_Date</th>
                <th  width="100" align="center">User_Regd_id</th>
                <th  width="100" align="center">Org_id</th>
                <th  width="100" align="center">Pgo_Regd_id</th>
               <th  width="100" align="center">STATUS</th>
                 
            </tr>
            
            <%
                //String gri=request.getParameter("gri");
                Connection con=new DBConnection().getConnection();
                String sql="select * from grv_regd";
                PreparedStatement ps=con.prepareStatement(sql);
               // ps.setString(1, gri);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String grv_regd_id=rs.getString("grv_regd_id");
                    String regd_date=rs.getString("regd_date");
                    String user_regd_id=rs.getString("user_regd_id");
                    String grv_status=rs.getString("grv_status");
                    String org_id=rs.getString("org_id");
                    String pgo_regd_id=rs.getString("pgo_regd_id");
                
            %>
                <tr>
                    
                     
                    <td><%=grv_regd_id %></td>
                    <td><%=regd_date %></td>
                    <td><%=user_regd_id %></td>
                    <td><%=org_id %></td>
                    <td><%=pgo_regd_id %></td>
                    <td><%=grv_status %></td>
                </tr>
               
               
        <%}%>
        </table>
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
