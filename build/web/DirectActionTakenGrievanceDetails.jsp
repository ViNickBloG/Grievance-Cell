<%-- 
    Document   : DirectActionTakenGrievanceDetails
    Created on : 10 Dec, 2012, 4:07:47 PM
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
        <h3><font color="purple">DIRECT ACTION TAKEN GRIEVANCE DETAILS</font></h3>
        
        <form name="abc" id="abcd" action="DirectAction" method="post">
            <%
        String grv_regd_id=request.getParameter("grv_regd_id");
        String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
        
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,dp.*,da.*,ur.name from grv_regd gr join grv_disposed dp on(gr.grv_regd_id=dp.grv_regd_id)join direct_action da on(gr.grv_regd_id=da.grv_regd_id)join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where dp.status='Disposed' and gr.direct_action='Yes' and disposed_by=? and da.grv_regd_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ps.setString(2, grv_regd_id);
    System.out.println("xxxxxxx"+ps+"xxxxxxxxxx");
    ResultSet rs=ps.executeQuery();
    /*String sql1="select gr.*,gpa.* from grv_regd gr join grv-pending_action gpa on(gr.grv_regd_id=gpa.grv_regd_id) where gr.grv_status='Disposed' and gr.grv_regd_id=? ";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, grv_regd_id);
    ResultSet rs1=ps1.executeQuery();*/
    
    if (rs.next())
    {
        String user_regd_id=rs.getString("user_regd_id");
        String directaction_remarks=rs.getString("directaction_remarks");
        String a=directaction_remarks;
        String notes=rs.getString("notes");
        String b=notes;
        String dealing_officer=rs.getString("dealing_officer");
        String c=dealing_officer;
        String disposal_type=rs.getString("disposal_type");
        String action_report=rs.getString("action_report");
        String attached_file=rs.getString("attached_file");
        String disposal_remark=rs.getString("disposal_remark");
        String local_file_no=rs.getString("local_file_no");
        String regd_date=rs.getString("regd_date");
        String name=rs.getString("name");
        String lg_dist=rs.getString("lg_dist");
        if(lg_dist==null)
            lg_dist="-";
        String lg_block=rs.getString("lg_block");
        if(lg_block==null)
            lg_block="-";
        String lg_panchayat=rs.getString("lg_panchayat");
        if(lg_panchayat==null)
            lg_panchayat="-";
        String lg_village=rs.getString("lg_village");
        if(lg_village==null)
            lg_village="-";
        String govt_dept=rs.getString("govt_dept");
        
        String grv_status=rs.getString("grv_status");
        String remarks=rs.getString("remarks");
        if(remarks==null)
            remarks="-";
        String target_date=rs.getString("target_date");
        if(target_date==null)
            target_date="-";
        
    
  %>
  
 <table width="700" height="290" border="1" class="table1">
  <tr>
    <th width="193" >GRIEVANCE REGISTRATION NO:</th>
    <td width="127" scope="col"><%=grv_regd_id%></td>
    <td width="13" >&nbsp;</td>
    <th width="140" >LOCATION OF GRIEVANCE:</th>
    <td width="193" ><%=lg_dist%>,<%=lg_block%>,<%=lg_panchayat%>,<%=lg_village%></td>
  </tr>
  <tr>
    <th>NAME OF COMPLAINANT:</th>
    <td><%=name%></td>
    <td>&nbsp;</td>
    <th>RECEIVED BY:</th>
    <td><%=govt_dept%></td>
  </tr>
  <tr>
    <th>COMPLAINANTS DETAILS:</th>
    <td><a href="UserDetails.jsp?user_regd_id=<%=user_regd_id%>" class="various fancybox.ajax">VIEW</a></td>
    <td>&nbsp;</td>
    <th>RECEIVED ON:</th>
    <td><%=regd_date%></td>
  </tr>
  <tr>
    <th>GRIEVANCE DETAILS:</th>
    <td><a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>">VIEW</a></td>
    <td>&nbsp;</td>
    <th>CURRENT STATUS:</th>
    <td>(DISPOSED at this level)</br>Disposal Type:<%=disposal_type%></td>
  </tr>
  <tr>
    <th>ACTION TAKEN REPORT:</th>
    <td><%=action_report%></td>
    <td>&nbsp;</td>
    <th>TARGET DATE:</th>
    <td><%=target_date%></td>
  </tr>
  <tr>
    <th>FILE ATTACHED:</th>
    <td colspan="4" >===<%=attached_file%>===
        <%if(attached_file!=null && !"-".equals(attached_file)  && !"".equals(attached_file)){ %>
            <a href="uploadedfiles/<%=attached_file%>" target="_blank">Download</a><%}%>
           
        </td>
  </tr>
  <tr>
    <th>WRITE REMARKS</th>
    <% if(directaction_remarks==null || directaction_remarks.equals("") ){%>
    <td colspan="4"><label>
      <textarea name="directaction_remarks" id="textarea" cols="45" rows="5"></textarea>
    </label></td>
    <% }else{ %>
    <td colspan="4"><label>
            <input type="hidden" name="directaction_remarks" id="textfield" value="<%=a%>">
      <textarea name="directaction_remarks" id="textarea" cols="45" rows="5" value="<%=directaction_remarks%>" onfocus="this.blur()"><%=directaction_remarks%></textarea>
    </label></td>
    <%}%>

            
   
    </tr>
  <tr>
    <th>WRITE NOTES(if any)</th>
    <% if(notes==null || notes.equals("")){%>
    <td colspan="4"><label>
      <textarea name="notes" id="textarea2" cols="45" rows="5"></textarea>
    </label></td>
     <% }else{ %>
      <td colspan="4"><label>
              <input type="hidden" name="notes" id="textfield" value="<%=b%>">
      <textarea name="notes" id="textarea2" cols="45" rows="5" value="<%=notes%>" onfocus="this.blur()"><%=notes%></textarea>
    </label></td>
    <%}%>
   
    
    </tr>
  <tr>
    <th>LOCAL FILE NO</th>
    <td colspan="4"><label>
      <input type="text" name="textfield" id="textfield" value="<%=local_file_no%>" onfocus="this.blur()">
    </label></td>
   
    </tr>
  <tr>
    <th>DEALING OFFICER NAME</th>
    <% if(dealing_officer==null || dealing_officer.equals("")){%>
    <td colspan="4"><input type="text" name="dealing_officer" id="textfield2" /></td>
<% }else{ %>
    <td colspan="4">
        <input type="hidden" name="dealing_officer" id="textfield" value="<%=c%>">
        <input type="text" name="dealing_officer" id="textfield2" value="<%=dealing_officer%>" onfocus="this.blur()"/></td>
<%}%>
  </tr>
   <tr>
       <% if(dealing_officer==null || notes==null || directaction_remarks==null || dealing_officer.equals("") || notes.equals("") || directaction_remarks.equals("")  ){ %>
        <th> <input type="submit" name="button5" id="button5" value="SUBMIT" /></th>
        <td colspan="4">&nbsp;</td>
            <%}else{%>
    <th> <a href="DirectActionTakenGrievance.jsp">BACK</a></th>
    <td colspan="4">&nbsp;</td>
    <%}%>
  </tr>
  <%}%>
  <tr>
      <th>&nbsp;</th>
      <td colspan="4">
          <input type="hidden" name="grv_regd_id" id="textfield" value="<%=grv_regd_id%>">
 
      </td></tr>
    
 
 
  </table> </form>
    <%@ include file="common/lbody.jsp" %>
    <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
