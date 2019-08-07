<%-- 
    Document   : ManagePgo
    Created on : 9 Apr, 2013, 1:57:10 PM
    Author     : user
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
        
         <script type="text/javascript">
            function showMsg()
            {
                alert("Grievance yet to be solved by PGO..\n You can delete PGO,if PGO has zero Grievance");
            }
            function showMsg2()
            {
                alert("Sorry! You can't delete this PGO\n This organization is having only 1 PGO");
            }
            function cdelete()
            {
                if(confirm("Are you sure to delete this Record?"))
                    return true;
                else
                    return false;
            }
        </script>
        
    </head>
    <body>
         <%@ include file="common/ubody.jsp" %>
       <%  String status =(String)request.getAttribute("status");
if(status!=null)
out.println("<h2>"+status+"</h2>");   %>       

<h2 color="red"><font color="purple">MANAGE PGO</font></h2>
       <table width="972" height="148" border="1" class="table1">
  <tr>
    <th width="152" height="63" scope="col">pgo_regd_id</th>
    <th width="157" scope="col">Password</th>
    <th width="169" scope="col">Name</th>
    <th width="246" scope="col">Office</th>
    <th width="246" scope="col">Status</th>
    <th width="84" scope="col">EDIT/VIEW<br />
    Profile</th>
    <th width="73" scope="col">Activate/<br />
      Deactivate</th>
    <th width="45" scope="col">Delete</th>
  </tr>
  <%
  
  
    Connection con = new DBConnection().getConnection();   
    String sql="select * from pgo_regd";
    PreparedStatement ps = con.prepareStatement(sql);
    
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
    {
        record++;
        String pgo_regd_id=rs.getString("pgo_regd_id");
        String password=rs.getString("password");
        //String name="";
        String govt_dept=rs.getString("govt_dept");
        String org_id=rs.getString("org_id");
        
        String pgo_name=rs.getString("pgo_name");
        String pstatus=rs.getString("status");
        String pstatus1=pstatus;
        
        String sql11="Select count(*) from pgo_regd where org_id=?";
        PreparedStatement ps11 = con.prepareStatement(sql11);
        ps11.setString(1, org_id);
        ResultSet rs11=ps11.executeQuery();
        int orgcount=0;   
        if (rs11.next())
        {
           orgcount=rs11.getInt(1);     
        }

        int grvcount=0;
        String sql2="Select count(*) from grv_status where received_by=?";
        PreparedStatement ps2 = con.prepareStatement(sql2);
        ps2.setString(1, pgo_regd_id);
        ResultSet rs2=ps2.executeQuery();    
        if (rs2.next())
        {
            grvcount=rs2.getInt(1);
        }
            
        if(pstatus.equals("1"))
            pstatus="Active";
        else
            pstatus="Inactive";
        String bg="";
        if(pstatus1.equals("0"))
         bg="style=\"background-color:red;color:#fff\"";
  %>
  <tr>
    <td height="52" <%=bg%>><%=pgo_regd_id%></td>
    <td><%=password%></td>
    <td><%=pgo_name%></td>
    <td><%=govt_dept%></td>
    <td><%=pstatus%></td>
    <td><a href="EditPgoDetails.jsp?pgo_regd_id=<%=pgo_regd_id%>">OK </a> </td>
    <td>
    
        <%if(pstatus1.equals("1")){ %>
            <a href="UpdatePgoStatus?pgo_regd_id=<%=pgo_regd_id%>&status=0"> D </a>    
        <%}else{%>
            <a href="UpdatePgoStatus?pgo_regd_id=<%=pgo_regd_id%>&status=1"> A </a>  
        <%}%>
    </td>
    <td>
        <%
        if(grvcount>0 ){
        %>
            <a href="javascript:void(0)" onclick="showMsg()">DEL </a>
        <%}else if(orgcount==1){
        %>
            <a href="javascript:void(0)" onclick="showMsg2()">DEL </a>
        <%}else{%>
            <a href="DeletePgo?pgo_regd_id=<%=pgo_regd_id %>" onclick="return cdelete()"> DEL </a>
        <%}%>
    </td>
  </tr>
  <%}%>
  <tr>
    <th height="23">No.of Records:</th>
    
    <th colspan="7"><%=record%></th>
  </tr>
</table>
<%@ include file="common/lbody.jsp" %>
    </body>
</html>
