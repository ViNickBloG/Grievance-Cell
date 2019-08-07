<%-- 
    Document   : UserForm
    Created on : 8 Dec, 2012, 4:52:20 PM
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
         <%  String status =(String)request.getAttribute("status");
if(status!=null)
out.println("<h2>"+status+"</h2>");       

        
       
    String user_regd_id=(String)session.getAttribute("user_regd_id");
    if (user_regd_id==null)
       user_regd_id="1";
    
    Connection con = new DBConnection().getConnection();   
    int total_grv_regd=0;
    String sql1="select count(*) from grv_regd where user_regd_id=?";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, user_regd_id);
    ResultSet rs1=ps1.executeQuery();
    if (rs1.next())
    {
     total_grv_regd=rs1.getInt(1);
    }             
       
    String sql="select * from user_regd where user_regd_id=?"; 
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_regd_id);
    ResultSet rs=ps.executeQuery();
    if (rs.next())
   {
        String name=rs.getString("name");
        String gender=rs.getString("gender");
        String type=rs.getString("type");
        
        String category=rs.getString("category");
        String address=rs.getString("address");
        String dist=rs.getString("dist");
        String block=rs.getString("block");
        String panchayat=rs.getString("panchayat");
        String village=rs.getString("village");
        String mobileno=rs.getString("mobileno");
        String emailid=rs.getString("emailid");
        String id_proof=rs.getString("id_proof");
        String id_proof_no=rs.getString("id_proof_no");
        String photo=rs.getString("photo");
        
        if(photo==null || "".equals(photo.trim()))
        {
            if(gender.equalsIgnoreCase("female"))
                photo="femaleicon.png";
            else
                photo="maleicon.png";            
        }
        
    
  %> 
        
        <table width="630" height="472" border="0" class="table3">
           
  <tr>
      <td colspan="3">WELCOME   <%=name%> (<span style="text-transform: lowercase"><%=user_regd_id %></span>)</td>
  </tr>
  <tr>
    <td width="237"><a href="GrievanceRegistration.jsp">LODGE GRIEVANCE</a></td>
    <td width="386">PROFILE</td>
    
    <td width="246" rowspan="14" valign="top"> <img src="uploadedfiles/<%=photo%>" width="100" height="100" /> </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%=name%></td>
  </tr>
  <tr>
    <td><a href="UserReminder.jsp">REMINDER</a></td>
    <td><%=gender%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%=type%></td>
  </tr>
  <tr>
    <td><a href="UserStatusQuery.jsp">VIEW ACTION STATUS</a></td>
    <td><%=category%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%=address%></td>
  </tr>
  <tr>
    <td><a href="UserLetterList.jsp?user_regd_id=<%=user_regd_id%>">VIEW LETTER</a></td>
    <td><%=dist%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%=block%></td>
  </tr>
  <tr>
    <td><a href="ChangePwdUser.jsp">CHANGE PASSWORD</a></td>
    <td><%=panchayat%></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><%=village%></td>
  </tr>
  <tr>
    <td><a href="EditUserDetails.jsp?user_regd_id=<%=user_regd_id%>">EDIT PROFILE</a></td>
    <td><%=mobileno%></td>
  </tr>
  <tr>
      <td>&nbsp;</td>

    <td><%=emailid%></td>
  </tr>
  <tr>
      <td><a href="UserClarification.jsp">CLARIFICATION</a></td>
    
      
    <td><%=id_proof%></td>
  </tr>
  <tr>
      <td rowspan="1">&nbsp;</td>
    <td><%=id_proof_no%></td>
  </tr>
  
  <tr>
    <td colspan="3">NO. OF GRIEVANCE LODGED TILL NOW:<%=total_grv_regd%>   <br />
    <br />
    <a href="GrievanceListForUser.jsp?user_regd_id=<%=user_regd_id%>" class="various fancybox.ajax">VIEW</a><br /></td>
  </tr>
</table>
  
  <%}%>

  <%@ include file="common/lbody.jsp" %>
    </body>
</html>
