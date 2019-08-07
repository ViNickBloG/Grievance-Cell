<%-- 
    Document   : PgoWriteLetter
    Created on : 10 Dec, 2012, 12:56:27 PM
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
         <script type="text/javascript" src="javascript/common.js"></script>
	 </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <%
         
             String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
 
         String grv_regd_id=request.getParameter("grv_regd_id");
         Connection con = new DBConnection().getConnection();   
    
         String sql="select user_regd_id from grv_regd where grv_regd_id=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();
    
    if (rs.next())
    {
        String user_regd_id=rs.getString("user_regd_id");
        
          
        
        
        String sql1="select * from grv_disposed where grv_regd_id=? and disposed_by=? ";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, grv_regd_id);
    ps1.setString(2, pgo_regd_id);
    ResultSet rs1=ps1.executeQuery();
    
    if (rs1.next())
    {
        String action_report=rs1.getString("action_report");
        String attached_file=rs1.getString("attached_file");
        if(action_report==null || action_report.equals(""))
            action_report="NO ACTION TAKEN";
        if(attached_file==null || attached_file.equals(""))
            attached_file="";
        
        %>
        <form method="post" action="PgoWriteLetter" name="abc" >
            
            <table width="500" class="table1">
                <tr><th colspan="5">SEND FINAL LETTER</th></tr>
                <tr>
                    <th width="200">Type of Letter:</th>
                
                <td>
                    <font color="purple">FINAL LETTER</font>
                </td>
                </tr>
            <tr>
              <th>User Regd. Id.</th>
              <td><%=user_regd_id%></td>
            </tr>
            <tr>
              <th> Grievance Regd. Id</th>
              <td><%=grv_regd_id%></td>
            </tr>
             <tr>
    <th>ACTION TAKEN REPORT:</th>
    <td><%=action_report%></td>
     
    </tr>
 
           <tr>
    <th>FILE ATTACHED:</th>
    <td>===<%=attached_file%>===
        <%if(attached_file!=null && !"-".equals(attached_file)  && !"".equals(attached_file)){ %>
            <a href="uploadedfiles/<%=attached_file%>" target="_blank">Download</a>
            <%}%>
         </td>
    </tr>
  
   
            <tr>
              <th>Subject</th>
              <td><input name="subject" type="text" value="" placeholder="subject" size=""  /></td>
            </tr>
                 <tr>
              <th>Message:</th>
              <td>
                  <input type="hidden" name="pgo_regd_id" id="pgo_regd_id" value="<%=pgo_regd_id%>" />
              <input type="hidden" name="type" id="type" value="final letter" />
              <input type="hidden" name="user_regd_id" id="type" value="<%=user_regd_id%>" />
              <input type="hidden" name="grv_regd_id" id="type" value="<%=grv_regd_id%>" />
              
                  <textarea name="message" cols="40" rows="15"></textarea></td>
            </tr>
            <tr>
               <th>&nbsp;</th>
                <td align="right">
                <label>
                    <input type="submit" name="submit" id="submit" value="SEND" />
                </label>
                </td>   
            </tr>
            </table>
                  <%}}%>
                
        </form>
        
        <%@ include file="common/lbody.jsp" %>
        <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
