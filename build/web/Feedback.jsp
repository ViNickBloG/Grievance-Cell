<%-- 
    Document   : UserLetter
    Created on : 9 Dec, 2012, 6:21:49 PM
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
      <h2 color="red"><font color="purple">FEEDBACK</font></h2>
                      <table width="700" height="133" border="1" class="table1">
                  <tr>
                    <th width="50" height="42" scope="col">FEEDBACK<br />
                      NO</th>
                    <th width="100" scope="col">RECEIVED DATE</th>
                    <th width="100" scope="col">NAME</th>
                    <th width="100" scope="col">MOBILE NO</th>
                    <th width="150" scope="col">EMAIL ID</th>
                    <th width="100" scope="col">VIEW</th>
                    <th width="100" scope="col">PRINT</th>
                  </tr>
                  <%
    Connection con = new DBConnection().getConnection();      
    String sql="select * from feedback ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs=ps.executeQuery();   
     
    while (rs.next())
    {
        
        String srl_no=rs.getString("srl_no");
        String name=rs.getString("name");
        String content=rs.getString("content");
        String email_id=rs.getString("email_id");
        String mob_no=rs.getString("mob_no");
        String submit_date=rs.getString("submit_date");
        
        %>
                        <tr>
                    <td height="30"><%=srl_no%></td>
                    <td><%=submit_date%></td>
                    
                    <td><%=name%></td>
                    <td><%=mob_no%></td>
                    <td><%=email_id%></td>
                    <td><a href="FeedbackDetails.jsp?srl_no=<%=srl_no%>" class="various fancybox.ajax">DETAILS</a> </td>
                   </td>
                    <td><a href="" target="_blank">PRINT</a></td>
                        </tr>
                    
                     <%}%>

                      </table>

     <%@ include file="common/lbody.jsp" %>
                      
</body>
</html>
