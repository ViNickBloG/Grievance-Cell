<%-- 
    Document   : CaseReportReceivedList
    Created on : 10 Dec, 2012, 4:28:00 PM
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
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">CASE REPORT RECEIVED</font></h2>
   <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
         <form action="SearchGrvCaseReport.jsp" name="SearchGrvCaseReport" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
       <input name="submit" type="submit" value="" class="searchbtn"/>
         
        </form>

        </div>
      <table width="1008" height="249" border="1" class="table1">
  <tr>
      <th height="73" colspan="9" scope="col"><h3><font color="yellow">CASE REPORT RECEIVED FROM SUBORDINATE ORGANIZATION</font></h3></th>
  </tr>
  <tr>
    <th width="61" height="73" scope="col">REPORT RECEIVING DATE</th>
    <th width="69" scope="col">TARGET DATE</th>
    <th width="184" scope="col">ID OF COMPLAINANT</th>
    <th width="126" scope="col">GRIEVANCE REGISTARTION NO</th>
    <th width="87" scope="col">STATUS</th>
    <th width="94" scope="col">RECEIVED FROM PGO</th>
    <th width="121" scope="col">DISPOSED/NOT DISPOSED</th>
    <th width="129" scope="col">ATTACHED/NOT ATTACHED</th>
    <th width="79" scope="col">VIEW REPORT</th>
  </tr>
  
  
  <%
   String search=request.getParameter("grv_regd_id");
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,cr.* from grv_regd gr join case_report cr on(gr.grv_regd_id=cr.grv_regd_id)  where cr.sentto_pgo=? and gr.grv_regd_id=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ps.setString(2, search);
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
        String grv_regd_id=rs.getString("grv_regd_id");
        String status=rs.getString("status");
        String report_receiving_date=rs.getString("report_receiving_date");
        String user_regd_id=rs.getString("user_regd_id");
        String receivedfrom_pgo=rs.getString("receivedfrom_pgo");
        String disposal_status=rs.getString("disposal_status");
        String attach_status=rs.getString("attach_status");
        String target_date=rs.getString("target_date");
        if(target_date==null)
            target_date="-";
        
    
  %>
  
  <tr>
    <td height="26"><%=report_receiving_date%></td>
    <td><%=target_date%></td>
    <td><%=user_regd_id%></td>
    <td><%=grv_regd_id%></td>
    <td><%=status%></td>
    <td><%=receivedfrom_pgo%></td>
    <td><%=disposal_status%></td>
    <td><%=attach_status%></td>
    <td><label>
            <a href="CaseReportReceived_ActionReport.jsp?grv_regd_id=<%=grv_regd_id%>" target="_blank">VIEW</a>
    </label></td>
  </tr>
  <%}%>
  <tr>
      <td colspan="2"><div align="center">NO OF RECORDS:</div></td>
    <td colspan="7">&nbsp;</td>
  </tr>
</table>
        
      <%@ include file="common/lbody.jsp" %>
      <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
