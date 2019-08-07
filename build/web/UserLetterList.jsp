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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <div align="right">
      <%@ include file="common/ubody.jsp" %>
                      <table width="719" height="133" border="1" class="table1">
                  <tr>
                    <th width="30" height="42" scope="col">LETTER<br />
                      NO</th>
                    <th width="58" scope="col">RECEIVED DATE</th>
                    <th width="53" scope="col">TYPE</th>
                    <th width="125" scope="col">RECEIVED FROM</th>
                    <th width="187" scope="col">SUBJECT</th>
                    <th width="99" scope="col">for GRIEVANCE NO</th>
                    <th width="20" scope="col">PRINT</th>
                  </tr>
                  <%
    String user_regd_id=(String)session.getAttribute("user_regd_id");         
    Connection con = new DBConnection().getConnection();      
    String sql="select ul.*,pr.govt_dept from user_letter ul join pgo_regd pr on(ul.pgo_regd_id=pr.pgo_regd_id) where user_regd_id=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_regd_id);
    ResultSet rs=ps.executeQuery();   
     
    while (rs.next())
    {
        
        String uletter_no=rs.getString("uletter_no");
        String received_date=rs.getString("received_date");
        String type=rs.getString("type");
        String subject=rs.getString("subject");
        String message=rs.getString("message");
        String govt_dept=rs.getString("govt_dept");
        String grv_regd_id=rs.getString("grv_regd_id");
        String letter_status=rs.getString("letter_status");
        
        %>
                        <tr>
                          <td>
                              <% if(letter_status.equals("unread")){%>
                              <div class="newmsg">
                              <%=uletter_no%>
                              </div>
                              <%}else{%>
                                <%=uletter_no%>
                              <%}%>
                          </td>
                    <td><%=received_date%></td>
                    <td><%=type%></td>
                    <td><%=govt_dept%></td>
                    <td><%
        if(type=="clarification")
                       {
        %>
                      <a href="UserClarification.jsp"><%=subject%></a>
                      <%}
        else
        %>
                      <a href="UserLetterDetails.jsp?uletter_no=<%=uletter_no%>"><%=subject%></a> </td>
                    <td><%=grv_regd_id%></td>
                    <td><a href="PrintReport.jsp?uletter_no=<%=uletter_no%>" target="_blank">PRINT</a></td>
                  </tr>
                        <%}%>
                        </table>
                      <%@ include file="common/lbody.jsp" %>
      </div>
</body>
</html>
