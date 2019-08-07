<%-- 
    Document   : PendingGrievance
    Created on : 6 Dec, 2012, 6:02:32 PM
    Author     : USER
--%>

<%@page import="grv.cell.beans.DateTime"%>
<%@page import="java.util.Date"%>
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
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        
    <%
    String search=request.getParameter("grv_regd_id");
           
    String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: green;"> <%=status%> </h5>
    <%}%>
        <h2><font color="purple">PENDING GRIEVANCE</font></h2>
        <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
    <form action="SearchGrv.jsp" name="SearchGrv" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
            <table width="504" height="185" border="1" class="table1">
             
  <tr>
    <th height="73" scope="col">GRIEVANCE REGISTARTION NO</th>
    <th scope="col">DATE OF REGISTRATION</th>
    <th scope="col">NAME OF COMPLAINANT</th>
    <th scope="col">STATUS</th>
    <th scope="col">REMARKS</th>
    <th scope="col">DATE OF TARGET</th>
    <th scope="col">INDICATORS</th>
  </tr>
  
  <%
  String org_id=(String)session.getAttribute("org_id");
  String govt_dept=(String)session.getAttribute("govt_dept");
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  
    Connection con = new DBConnection().getConnection();   
    //String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where grv_regd_id in (Select grv_regd_id from grv_status where govt_dept=? and status='Pending') ";
    String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id) where gr.grv_regd_id in (Select grv_regd_id from grv_status where govt_dept=? and status='Pending') and (gr.pgo_regd_id=? or gs.received_by=?) and gr.grv_status not in ('Disposed','Returned') and gr.grv_regd_id=? group by gr.grv_regd_id ";
    PreparedStatement ps = con.prepareStatement(sql);
    
    ps.setString(1, org_id);
    ps.setString(2, pgo_regd_id);
    ps.setString(3, pgo_regd_id);
    ps.setString(4, search);
 System.out.println(ps);   
 
    ResultSet rs=ps.executeQuery();
    int record=0;
    int crcount=0;
    int rmcount=0;
    int cqcount=0;
    int crpcount=0;
    while (rs.next())
    {
        record++;
        String grv_regd_id=rs.getString("grv_regd_id");
        String regd_date=rs.getString("regd_date");
        //String name="";
        String name=rs.getString("name");
        
        String grv_status=rs.getString("grv_status");
        String remarks=rs.getString("remarks");
        String target_date=rs.getString("target_date");
          boolean tflag=false;
        if(target_date==null)
            target_date="-";
        else
        {
            Date tdate=DateTime.getJavaDate(target_date);
            Date cdate=DateTime.getJavaDate(DateTime.sysDate());
            if(tdate.before(cdate))
            {
                tflag=true;
            }
            //System.out.println(tdate+":"+cdate+":"+tflag);
        }
          
          System.out.println("pritam"+target_date);
          String sql2="select decision from grv_action where action_taken_by=? and grv_regd_id=?";
           PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, pgo_regd_id);
            ps2.setString(2, grv_regd_id);
            ResultSet rs2=ps2.executeQuery();
            if(rs2.next())
                            {
                String decision=rs2.getString("decision");
            if(decision.equalsIgnoreCase("examine at our level"))
                    decision="examined at our level";
            else if(decision.equalsIgnoreCase("forward to subordinate organization"))
                    decision="forwarded to subordinate organization";
                
              



    String sql5="select count(*) from case_report where sentto_pgo=? and grv_regd_id=? and indicator=0";
           PreparedStatement ps5 = con.prepareStatement(sql5);
            ps5.setString(1, pgo_regd_id);
            ps5.setString(2, grv_regd_id);
            ResultSet rs5=ps5.executeQuery();
            if(rs5.next())
                            {
                crcount=rs5.getInt(1);
                                           }
                                                                   
    
            
            
            String sql6="select count(*) from reminder_box where sent_to_pgo=? and grv_regd_id=? and indicator=0";
           PreparedStatement ps6 = con.prepareStatement(sql6);
            ps6.setString(1, pgo_regd_id);
            ps6.setString(2, grv_regd_id);
            System.out.println("pritam"+ps6);
            ResultSet rs6=ps6.executeQuery();
            if(rs6.next())
                            {
                rmcount=rs6.getInt(1);
                                           }
    
        


             String sql8="select count(*) from clarification_box where sent_to_pgo=? and grv_regd_id=? and indicator=0";
           PreparedStatement ps8 = con.prepareStatement(sql8);
            ps8.setString(1, pgo_regd_id);
            ps8.setString(2, grv_regd_id);
            ResultSet rs8=ps8.executeQuery();
            if(rs8.next())
            {
                cqcount=rs8.getInt(1);
            }

            
             String sql7="select count(*) from clarification_box where sent_by_pgo=? and grv_regd_id=? and indicator=2";
           PreparedStatement ps7 = con.prepareStatement(sql7);
            ps7.setString(1, pgo_regd_id);
            ps7.setString(2, grv_regd_id);
            ResultSet rs7=ps7.executeQuery();
            if(rs7.next())
            {
                crpcount=rs7.getInt(1);
            }
    
  %>
  <tr>
    <td height="26"><%=grv_regd_id%></td>
    <td><%=regd_date%></td>
    <td><a href="PendingGrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=name%></a></td>
    <td><font color="blue">(<%=grv_status%>)</font></br><%=decision%></td>
    <%}%>
  
    <td>&nbsp;</td>
    <%
      if(tflag==true){
          %>
          <td><font color="blue"> <%=target_date%></font></br><font color="red">OVER DUE DATE</font></td>
<%}
else{%>
          <td><%=target_date%></td>
<%}%>
    <td>
        <%if(crcount>0){%>
        <a href="CaseReportReceivedList.jsp">
            <img src="icons/case_report.png" width="40" height="40" title="<%=crcount%> case report received" />
        </a>
        <%}%>
        <%if(rmcount>0){%>
        <a href="PgoReminderReceived.jsp">
            <img src="icons/Reminder.png" width="40" height="40" title="<%=rmcount%> reminder received" />
        </a>
        <%}%>
        <%if(crpcount>0){%>
        <a href="PgoClarificationReceived.jsp">
             <img src="icons/reply.jpg" width="40" height="40" title="<%=crpcount%> clarification received" />
        
        </a>
        <%}%>
        <%if(cqcount>0){%>
        <a href="PgoClarificationReceived.jsp">
             <img src="icons/question1.jpg" width="40" height="40" title="<%=cqcount%> question received" />
        
        </a>
        <%}%>
        
        
    </td>
  </tr>
  
<%}%> 
  
  <tr>
    <td colspan="1">NO OF RECORDS:</td>
    
    <td colspan="6"><%=record%></td>
  </tr>
</table>

    <%@ include file="common/lbody.jsp" %>
    <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
