<%-- 
    Document   : ReturnedGrievance
    Created on : 26 Apr, 2013, 7:59:05 AM
    Author     : user
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
        <h2><font color="purple">RETURNED GRIEVANCE</font></h2>
     <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">    <form action="SearchGrvReturned.jsp" name="SearchGrvReturned" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
        
        <table width="700" height="50" border="1" class="table1">
  <tr>
    <th width="50">DATE OF RETURN</td>
    <th width="50">DATE OF REGISTARTION</td>
    <th width="50">GRV REGD ID</td>
    
    <th width="50">TARGET DATE</td>
    <th width="100">NAME OF COMPLAINANT</td>
    <th width="100">REMARKS</td>
    <th width="100">SUGGESTED ORGANIZATION</td>
    <th width="100">REFORWARD</td>
    <th width="100">MAKE THIS NEW GRIEVANCE</td>
  </tr>
  
  <%
   
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  
  String org_id=(String)session.getAttribute("org_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,ur.name,gs.grv_regd_id from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id)  where gs.status='Returned' and gs.received_by=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    System.out.println("################"+ps+"##############");
    ResultSet rs=ps.executeQuery();
    int record=0;
    while (rs.next())
   {
        record++;
       System.out.println("====================================="+record+"====================="); 
        String regd_date=rs.getString("regd_date");
        String grv_regd_id=rs.getString("grv_regd_id");
        String target_date=rs.getString("target_date");
        String name=rs.getString("name");
        //String suggested_office=rs.getString("suggested_office");
        //String not_pertaining_remarks=rs.getString("not_pertaining_remarks");
        
        // String subquery="Select case_presently_with from grv_action where grv_regd_id=? and action_taken_by=?";
        
        String sql1="select * from grv_action where ref_action_id=(SELECT max(action_id) FROM grv_action where grv_regd_id=? and action_taken_by=? and decision=?)  and status=1";
     PreparedStatement ps1 = con.prepareStatement(sql1);
     ps1.setString(1, grv_regd_id);
     ps1.setString(2, pgo_regd_id);
     ps1.setString(3, "forward to subordinate organization");
     System.out.println("@@@@@@@@@@@@@@@@@@@"+ps1+"##############");
    
     ResultSet rs1=ps1.executeQuery();
                            if (rs1.next())
                            {
                                String suggested_office=rs1.getString("suggested_office");
        String not_pertaining_remarks=rs1.getString("not_pertaining_remarks");
        String action_date=rs1.getString("action_date");
        String action_taken_by=rs1.getString("action_taken_by");
        String action_id=rs1.getString("action_id");
        String ref_action_id=rs1.getString("ref_action_id");
        
        
        
        
     String sql3="select * from org_regd where org_id=?";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, suggested_office);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps3+"##############");
    
     ResultSet rs3=ps3.executeQuery();
                            if (rs3.next())
                            {
                                //String pgo_name=rs3.getString("pgo_name");
                                //String designation=rs3.getString("designation");
                                String govt_dept=rs3.getString("govt_dept");
                                String dist=rs3.getString("dist");
                                String block=rs3.getString("block");
                                
                                if(dist==null)
                                    dist="";
                                if(block==null)
                                    block="";

    
        
  %>
  
 
  
  
  <tr>
    <td><%=action_date%></td>
    <td><%=regd_date%></td>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></a></td>
    
    <td><%=target_date%></td>
    <td><%=name%></td>
    <td><%=not_pertaining_remarks%></td>
    <td><%=suggested_office%>-<%=govt_dept%></br><%=dist%>-<%=block%></td>
    <td>
        <a href="ReForwardGrv?regd_date=<%=regd_date%>&target_date=<%=target_date%>&name=<%=name%>&action_date=<%=action_date%>&grv_regd_id=<%=grv_regd_id%>&received_by=<%=action_taken_by %>&action_id=<%=action_id%>&ref_action_id=<%=ref_action_id%>"> Re-Forward </a>
    </td>
    <td>
        <a href="MakeNewGrv?grv_regd_id=<%=grv_regd_id%>&received_by=<%=action_taken_by %>&action_id=<%=action_id%>&ref_action_id=<%=ref_action_id%>"> Make New </a>
    </td>
    
  </tr>
  <%}}}%>
  <tr>
      <td colspan="3"><div align="left">NO OF RETURNED GRIEVANCE:</div></td>
      <td colspan="6"><%=record%></td>
    
  </tr>
 
  
</table>
        <%@ include file="common/lbody.jsp" %>
        <%@ include file="floatmenu2.jsp" %>
  

    </body>
</html>
