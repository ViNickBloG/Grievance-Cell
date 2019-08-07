<%-- 
    Document   : NewGrievance
    Created on : 6 Dec, 2012, 4:43:20 PM
    Author     : USER
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
                alert("Organisation has subordinate Organisation\n You must delete all subordinate Organisation first");
            }
            function showMsg1()
            {
                alert("Grievance yet to be solved by PGOs..\n You can delete Organization,if PGOs have zero Grievance");
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
         <h2 color="red"><font color="purple">MANAGE ORGANIZATION</font></h2>
        <table width="992" border="1" class="table1">
  <tr>
    <th width="245" height="50" scope="col">Organization name with Code</th>
     <th width="41" scope="col">No.of pgoS</th>
    <th width="139" scope="col">pgo_regd_idS</th>
    <th width="42" scope="col">
    VIEW</th>
   
    <th width="45" scope="col">Delete</th>
  </tr>
  <%
  
  
    Connection con = new DBConnection().getConnection();   
    String sql="select * from org_regd";
    PreparedStatement ps = con.prepareStatement(sql);
    
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
    {
        record++;
        String govt_dept=rs.getString("govt_dept");
        String org_id=rs.getString("org_id");
        //String name="";
        String parent_org=rs.getString("parent_org");
        
        String dist=rs.getString("dist");
        String block=rs.getString("block");
        if(dist==null)
            dist="-";
        if(block==null)
            block="-";

        String sql1="Select govt_dept from org_regd where org_id=?";
        PreparedStatement ps1 = con.prepareStatement(sql1);
        ps1.setString(1, parent_org);
        ResultSet rs1=ps1.executeQuery();
        String parent_org_name="";     
        if (rs1.next())
        {
            parent_org_name=rs1.getString(1);   
        }
         
    int pcount=0;
    String pids="";           
    String sql2="Select pgo_regd_id from pgo_regd where org_id=?";
    PreparedStatement ps2 = con.prepareStatement(sql2);
    ps2.setString(1, org_id);
    ResultSet rs2=ps2.executeQuery();    
    while (rs2.next())
    {
        pcount++;
        String pgo_regd_id=rs2.getString(1);
        pids+="<br/>"+pgo_regd_id;   
    }
    
    
    String sql11="Select count(*) from org_regd where parent_org=?";
    PreparedStatement ps11 = con.prepareStatement(sql11);
    ps11.setString(1, org_id);
    ResultSet rs11=ps11.executeQuery();
    int subcount=0;   
    if (rs11.next())
    {
       subcount=rs11.getInt(1);     
    }
    /*String sql22="Select count(*) from pgo_regd where org_id=?";
    PreparedStatement ps22 = con.prepareStatement(sql22);
    ps22.setString(1, org_id);
    ResultSet rs22=ps22.executeQuery();
    int orgcount=0;   
    if (rs22.next())
        {
           orgcount=rs22.getInt(1);     
        }*/

     int grvcount=0;
     String sql33="Select count(*) from grv_status where received_by in (Select pgo_regd_id from pgo_regd where org_id=?)";
     PreparedStatement ps33 = con.prepareStatement(sql33);
     ps33.setString(1, org_id);
     ResultSet rs33=ps33.executeQuery();    
     if (rs33.next())
        {
            grvcount=rs33.getInt(1);
        }
        

  %>
  <tr>
      <td height="99"><%=org_id%>&nbsp;<%=govt_dept%></td>
        <td><%=pcount%></td>
    <td><%=pids%></td>
    <td>&nbsp;</td>
    
    <td>
        <%if(subcount>0){
        %>
        <a href="javascript:void(0)" onclick="showMsg()">DEL </a>
        <%
         }else if(grvcount>0 ){
        %>
            <a href="javascript:void(0)" onclick="showMsg1()">DEL </a>
        
        <%}else{%>
        <a href="DeleteOrganization?org_id=<%=org_id%>" onclick="return cdelete()">DEL </a>
        <%}%>
    </td>
  </tr>
  <%}%>
  <tr>
    <th height="23">No.of Records:&nbsp;</th>
    <th colspan="6"><%=record%></th>
    
  </tr>
  
</table>
        <%@ include file="common/lbody.jsp" %>

    </body>
</html>
