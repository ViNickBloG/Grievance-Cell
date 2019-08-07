<%-- 
    Document   : GrievanceDetailsForUser
    Created on : 8 Dec, 2012, 6:01:01 PM
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
       
        <!-- START Fancy Box -->
	<!--<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>-->

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="fancy/jquery.fancybox.js?v=2.1.4"></script>
	<link rel="stylesheet" type="text/css" href="fancy/jquery.fancybox.css?v=2.1.4" media="screen" />
        <script type="text/javascript">
            $(document).ready(function() {

                    $('.various').fancybox();
            });
        </script>        
        <!-- END Fancy Box -->
       
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        
        <%
    String grv_regd_id=request.getParameter("grv_regd_id");         
    Connection con = new DBConnection().getConnection();   
    String sql="select * from grv_regd where grv_regd_id=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();   
  
    if (rs.next())
    {
        
        String grv_details=rs.getString("grv_details");
        String user_regd_id=rs.getString("user_regd_id");
        String action_suggested=rs.getString("action_suggested");
        if(action_suggested==null)
            action_suggested="";
        String file=rs.getString("file");
        String nature=rs.getString("nature");
        String grv_ref_status=rs.getString("grv_ref_status");
         if(grv_ref_status==null || grv_ref_status.equals("no") || grv_ref_status.equals("") || grv_ref_status.equals("-"))
             grv_ref_status="";
         else
             grv_ref_status=user_regd_id+"/"+grv_ref_status;
    
        
        
        
  %>
        
  <table width="634"  border="1" class="table1">
  <tr>
    <th scope="col">GRIEVANCE DETAILS</th>
  </tr>
  <tr>
      <td height="29">NATURE OF GRIEVANCE: &nbsp;&nbsp;&nbsp;<%=nature%></td>
    
  </tr>
   
    
  
  
 
  <tr>
    <td height="29">GRIEVANCE:</td>
  </tr>
  <tr>
    <td height="114"><%=grv_details%></td>
  </tr>
  <tr>
    <td height="23">REMEDIAL ACTION SUGGESTED:</td>
  </tr>
  <tr>
    <td height="109"><%=action_suggested%></td>
  </tr>
  <tr>
    <td height="47">FILE ATTACHED:
    ===<%=file%>===
        <%if(file!=null && !"-".equals(file)  && !"".equals(file)){ %>
            <a href="uploadedfiles/<%=file%>" target="_blank">Download</a>
             <%}%>

    </td>
  </tr>
  <tr>
      <td>PREVIOUS GRIEVANCE REFERENCE NO:
    
        <%if(grv_ref_status==null || grv_ref_status.equals("") || grv_ref_status.equals("-")){}
                 else{%>
        
        ==<%=grv_ref_status%>==
        <a href="PreviousGrvRef.jsp?grv_ref_status=<%=grv_ref_status%>">VIEW</a><%}%></td>
   </tr>
  <tr>
    <td><label>
            <a href="GrievanceListForUser.jsp?user_regd_id=<%=user_regd_id%>" class="various fancybox.ajax">LIST OF GRIEVANCE LODGED BY <%=user_regd_id%></a>
    </label></td>
  </tr>
</table>
<%}%>
<%@ include file="common/lbody.jsp" %>
  
    </body>
</html>
