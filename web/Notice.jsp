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
      <h3 color="red"><font color="purple">NOTICE LIST</font></h3>
      <h2 align="right" color="orange"><a href="NoticeWrite.jsp">WRITE NOTICE</a></h2>
                      <table width="700" height="133" border="1" class="table1">
                  <tr>
                    <th width="100" height="42" scope="col">NOTICE<br />
                      NO</th>
                    <th width="200" scope="col">NOTICE DATE</th>
                    <th width="200" scope="col">TYPE</th>
                    <th width="200" scope="col">VIEW</th>
                  </tr>
                  <%
    Connection con = new DBConnection().getConnection();      
    String sql="select * from notice ";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs=ps.executeQuery();   
     
    while (rs.next())
    {
        
        String notice_no=rs.getString("notice_no");
        String notice_date=rs.getString("notice_date");
        String type=rs.getString("type");
        
        %>
                        <tr>
                    <td height="30"><%=notice_no%></td>
                    <td><%=notice_date%></td>
                    
                    <td><%=type%></td>
                    <td><a href="NoticeDetails.jsp?notice_no=<%=notice_no%>" class="various fancybox.ajax">DETAILS</a> </td>
                   </td>
                        </tr>
                    
                     <%}%>

                      </table>

     <%@ include file="common/lbody.jsp" %>
                      
</body>
</html>
