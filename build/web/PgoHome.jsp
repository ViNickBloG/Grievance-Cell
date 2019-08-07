<%-- 
    Document   : PgoHome
    Created on : 9 Dec, 2012, 9:14:44 PM
    Author     : USER
--%>

<%@page import="grv.cell.beans.DateTime"%>
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
        
      <%
                int record=0;
                String status =(String)request.getAttribute("status");
                if(status!=null)
                out.println("<h2>"+status+"</h2>");          

      
    String current_pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    String org_id=(String)session.getAttribute("org_id");
    
    Connection con = new DBConnection().getConnection(); 


    String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where org_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, org_id);
    System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps+"##############");

    ResultSet rs=ps.executeQuery();
    
    int orgToday=0;
    int pgoToday=0;
    
    int orgTotalReceived=0;
    int orgTotalDisposed=0;
    
    int pgoTotalReceived=0;
    int pgoTotalDisposed=0;

    while (rs.next())
    {

        String grv_regd_id=rs.getString("grv_regd_id");

        String user_regd_id=rs.getString("user_regd_id");
        String regd_date=rs.getString("regd_date");
        String target_date=rs.getString("target_date");
        if(target_date==null)
        target_date="";
        String grv_status=rs.getString("grv_status");
        String name=rs.getString("name");
        String pgo_regd_id=rs.getString("pgo_regd_id");
        String pgo_name="";
        String disposal_date="not disposed";

       
        record++;
       
        orgTotalReceived++;

        if(current_pgo_regd_id.equals(pgo_regd_id))
            pgoTotalReceived++;

            
        if(DateTime.isToday(regd_date))
        {
            orgToday++;
            if(current_pgo_regd_id.equals(pgo_regd_id))
            pgoToday++;
        }    
               
      if(grv_status.equals("Disposed")){                          
   
    String sql1="select dp.disposal_date,pr.pgo_name from grv_disposed dp join pgo_regd pr on(dp.disposed_by=pr.pgo_regd_id) where dp.grv_regd_id=? and pr.org_id=? and pr.pgo_regd_id=? and dp.disposed_by=? and (disposal_type='no action' or disposal_type='transfered' or disposal_type='Direct')";
       PreparedStatement ps1 = con.prepareStatement(sql1);
     ps1.setString(1, grv_regd_id);
     ps1.setString(2, org_id);
     ps1.setString(3, pgo_regd_id);
     ps1.setString(4, pgo_regd_id);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps1+"##############");
    
     ResultSet rs1=ps1.executeQuery();
        if (rs1.next())
        {
            pgo_name=rs1.getString("pgo_name");

            disposal_date=rs1.getString("disposal_date");
            
            
             orgTotalDisposed++;

             if(current_pgo_regd_id.equals(pgo_regd_id))
                pgoTotalReceived++;

        }
      }
                              
  }
 
   int record1=0;
     int record2=0;
 
  

  record2=record+record1;


              
    String sqlhm="select * from pgo_regd where pgo_regd_id=?"; 
    PreparedStatement pshm = con.prepareStatement(sqlhm);
    pshm.setString(1, current_pgo_regd_id);
    ResultSet rshm=pshm.executeQuery();
    if (rshm.next())
   {
        String name=rshm.getString("pgo_name");
        String designation=rshm.getString("designation");
        String govt_dept=rshm.getString("govt_dept");
        String photo=rshm.getString("photo");
        
        if(photo==null || "".equals(photo.trim()))
        {           
            photo="pgo.png";            
        }
       
  %> 
        
        <table width="655" height="511" border="1" class="table3">
  <tr>
      <td colspan="2">WELCOME&nbsp;&nbsp;&nbsp;<%=name%></td>
  </tr>
  <tr>
      <td width="273">Choose a Category :</td>

    <td width="338"><div align="center">PROFILE</div></td>
    </tr>
  <tr>
    <td>&nbsp;</td>
   
    <td align="center">
    <img src="uploadedfiles/<%=photo%>" width="100" height="100" />
    </td>

        
     </tr>
  <tr>
      <td><a href="NewGrievance.jsp">NEW GRIEVANCE</a></td>
    
    <td>NAME:&nbsp;&nbsp;<%=name%></td>
  </tr>
  <tr>
    <td><a href="PendingGrievance.jsp">PENDING GRIEVANCE</a></td>
    <td>DESIGNATION:&nbsp;&nbsp;<%=designation%></td>
  </tr>
  <tr>
    <td><a href="DisposedGrievance.jsp">DISPOSED GRIEVANCE</a></td>
    <td>DEPARTMENT:&nbsp;&nbsp;<%=govt_dept%></td>
  </tr>
  <tr>
    <td><a href="DirectActionTakenGrievance.jsp">DIRECT ACTION TAKEN GRIEVANCE</a></td>
    <td>REGISTRATION ID:&nbsp;&nbsp;<%=current_pgo_regd_id %></td>
  </tr>
  <tr>
    <td><a href="AllGrievance.jsp">ALL GRIEVANCE</a></td>
    <td rowspan="10">
        
        <table class="table1" width="320" style="margin-left: 10px;">
            <tr><th colspan="2" align="center"> <div align="center"> ORGANISATION </div> </th></tr>
            <tr><td>Today Received</td><td><%=orgToday %></td> </tr>
            
            <tr><td>Total Received</td><td><%=orgTotalReceived %></td> </tr>
            <tr><td>Total Disposed </td><td><%=orgTotalDisposed %></td> </tr>
            
            <tr><th colspan="2" align="center"><div align="center"> PGO </div> </th></tr>
            <tr><td>Today Received</td><td><%=pgoToday %></td> </tr>
            
            <tr><td>Total Received</td><td><%=pgoTotalReceived %></td> </tr>
            <tr><td>Total Disposed </td><td><%=pgoTotalDisposed %></td> </tr>
            
        </table>
    
    </td>
  </tr>
  <tr>
    <td><a href="PgoReminder.jsp"> REMINDERS </a></td>
  </tr>
  <tr>
    <td><a href="PgoClarification.jsp"> CLARIFICATIONS </a></td>
  </tr>
  
  
  <tr>
    <td><a href="PgoLetterList.jsp"> CORRESPONDENCE LETTERS </a> </td>
  </tr>
  
  <tr>
    <td><a href="EditPgoDetailsByPgo.jsp?pgo_regd_id=<%=current_pgo_regd_id %>">EDIT PROFILE</a></td>
  </tr>
  <tr>
    <td><a href="#">INTERNAL COMMUNICATION</a></td>
  </tr>
  
</table>

  <%}%>
 
  
  <%@ include file="common/lbody.jsp" %>
    </body>
</html>
