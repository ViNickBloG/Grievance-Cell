<%-- 
    Document   : ViewGrievance
    Created on : 9 Apr, 2013, 6:59:10 PM
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
        <h2><font color="purple">View Grievance</font></h2>
        <div style="margin-top: -50px;margin-left: 330px;">
        <form action="SearchAdminViewGrv.jsp" name="SearchAdminViewGrv" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <img src="icons/search.png"  width="20" height="20" title="SEARCH" />
        <input name="submit" type="submit" value="Submit" />
        
        </form>

        </div>
        <table border="1" class="table1">
            <tr>
                <th  align="center">Grievance_Reg_Id</th>
                <th  align="center">Grievance_Details</th>
                <th  align="center">Action_Suggested</th>
                
            </tr>
            <%
                String search=request.getParameter("grv_regd_id");
                Connection con=new DBConnection().getConnection();
                String sql="select grv_regd_id,grv_details,action_suggested from grv_regd where grv_regd_id=?";
                PreparedStatement ps=con.prepareStatement(sql);
                ps.setString(1, search);
                ResultSet rs=ps.executeQuery();
                while(rs.next())
                {
                    String grv_regd_id=rs.getString("grv_regd_id");
                    String grv_details=rs.getString("grv_details");
                    String action_suggested=rs.getString("action_suggested");
                    
            %>
             <tr>
                <td  align="center"><%=grv_regd_id %></td>
                <td  align="center"><%=grv_details %></td>
                <td  align="center"><%=action_suggested %></td>
                
                <td  align="center"> <a href="AdminViewDetailsGrievance.jsp?gri=<%=grv_regd_id%>">DETAILS</a> </td>         
            </tr>
        <%}%>
        </table>
         <%@ include file="common/lbody.jsp" %>
    </body>
</html>
