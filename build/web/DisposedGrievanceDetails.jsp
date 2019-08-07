<%-- 
    Document   : DisposedGrievanceDetails
    Created on : 10 Dec, 2012, 12:28:03 PM
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
        <h2><font color="purple">DISPOSED GRIEVANCE DETAILS</font></h2>
        
        
       <%
        String grv_regd_id=request.getParameter("grv_regd_id");
        String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
        
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,ur.name,dp.* from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id)join grv_disposed dp on(gr.grv_regd_id=dp.grv_regd_id) where gr.grv_regd_id=? and dp.disposed_by=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ps.setString(2, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    /*String sql1="select gr.*,gpa.* from grv_regd gr join grv-pending_action gpa on(gr.grv_regd_id=gpa.grv_regd_id) where gr.grv_status='Disposed' and gr.grv_regd_id=? ";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, grv_regd_id);
    ResultSet rs1=ps1.executeQuery();*/
    
    if (rs.next())
    {
        String user_regd_id=rs.getString("user_regd_id");
        String disposal_type=rs.getString("disposal_type");
        String action_report=rs.getString("action_report");
        String attached_file=rs.getString("attached_file");
        String disposal_remark=rs.getString("disposal_remark");
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
  
<table width="696" height="290" border="1" class="table1">
  <tr>
    <th width="157" >GRIEVANCE REGISTRATION NO:</th>
    <td width="197" scope="col"><%=grv_regd_id%></td>
    <td width="10" ></td>
    <th width="164" >LOCATION OF GRIEVANCE:</th>
    <td width="134" ><%=lg_dist%>,<%=lg_block%>,<%=lg_panchayat%>,<%=lg_village%></td>
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
      <th>REMARKS:</th>
      <td><%=disposal_remark%></td>
    <td>&nbsp;</td>
    <th>TARGET DATE:</th>
    <td><%=target_date%></td>
  </tr>
  <tr>
    <th>FILE ATTACHED:</th>
    <td colspan="4">===<%=attached_file%>===
        <%if(attached_file!=null && !"-".equals(attached_file)  && !"".equals(attached_file)){ %>
            <a href="uploadedfiles/<%=attached_file%>" target="_blank">Download</a>
            <%}%>
         </td>
    </tr>
  
  <tr>
    <th>ACTION TAKEN REPORT:</th>
    <td colspan="4"><%=action_report%></td>
     
    </tr>
     <tr>
    <td colspan="5"><a href="DisposedGrievance.jsp">BACK TO DISPOSED GRIEVANCE LIST</a></td>
            </tr>
    
   
   
    <%}%>
  <tr>
    <td colspan="5" width="696">      
        <table width="696" border="0" class="table1">
                <tr>
                  <th width="346" height="30">Name of Organization</th>
                  <th width="350" height="30">Remarks</th>

                  </tr>
                  
                  <%
                  String ofc="";
                  String remarkz="";
                  String ofc_name="";
                  String dist_name="";
                  String block_name="";
                  String sqlm="select * from pass_grv where grv_regd_id=?";
                   PreparedStatement psm = con.prepareStatement(sqlm);
        psm.setString(1, grv_regd_id);
        ResultSet rsm=psm.executeQuery();
         while(rsm.next())
         {
             ofc=rsm.getString("org_id");
             remarkz=rsm.getString("pass_remarks");
             
         
        String sqld="select or2.*,pg.* from org_regd or2 join pass_grv pg on(or2.org_id=pg.org_id) where pg.org_id=?";
       PreparedStatement psd = con.prepareStatement(sqld);
        psd.setString(1, ofc);
        ResultSet rsd=psd.executeQuery();
        
        if(rsd.next())
         {
              ofc_name=rsd.getString("govt_dept");
              dist_name=rsd.getString("dist");
              block_name=rsd.getString("block");
             
         }
        if(dist_name==null){
            dist_name="";
        }
        if(block_name==null || block_name=="0"){
            block_name="";
        }
    
    
 
                  %>
                  <tr>
                      <td height="12"><%=ofc%>-<%=ofc_name%></br><%=dist_name%>-<%=block_name%></td>
                      <td height="12"><%=remarkz%></td>
                  </tr>
                  <%}%>

            </table>
        </td>
       
    </tr>
   
      
    </table>   

   
      
        
   <%@ include file="common/lbody.jsp" %>
   <%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
