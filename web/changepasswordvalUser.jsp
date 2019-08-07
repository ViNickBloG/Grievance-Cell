<%-- 
    Document   : changepasswordvalUser
    Created on : 12 Apr, 2013, 11:42:12 PM
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
        
        <%
    Connection con=new DBConnection().getConnection();
     //String userid=(String)session.getAttribute("user_regd_id");
        String oldpass=request.getParameter("oldpass");
        String newpass=request.getParameter("newpass");
        String cnewpass=request.getParameter("cnewpass");
        String user_regd_id=request.getParameter("user_regd_id");
        if(newpass.equals(cnewpass))
         {
             String sql="select * from user_regd where user_regd_id=? and password=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,user_regd_id);
            ps.setString(2,oldpass);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                String sql1="update user_regd set password=? where user_regd_id=?";
                 PreparedStatement ps1=con.prepareStatement(sql1);
                ps1.setString(1,newpass);
                ps1.setString(2,user_regd_id);
               ps1.executeUpdate();
               out.println("password change successfull");
               %>
               <br></br>
               <a href="ManagePassword.jsp">AdminHome</a>
               <%
  
         }
        }
        else
        {
            out.print("password doesn't match");
            %><br></br> <a href="ManagePassword.jsp">AdminHome</a><%
        }
           
            
    %>
    <%@ include file="common/lbody.jsp" %>
    </body>
</html>
