<%-- 
    Document   : NewGrievanceDetails
    Created on : 7 Dec, 2012, 5:01:04 PM
    Author     : USER
--%>

<%@page import="java.util.Date"%>
<%@page import="grv.cell.beans.DateTime"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
       
        
        
         <script src="datetimepicker_css.js"></script>
        <script type="text/javascript" src="javascript/common.js"></script>
        <script type="text/javascript" src="jscalendar/datetimepicker_css.js"></script>
        <script type="text/javascript" src="javascript/NewGrievanceDetails.js"></script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
           <script type="text/javascript" >
            function displayRow(id)
            {
                document.getElementById('noactionrow').style.display='none';                          
                document.getElementById('forwardrow').style.display='none';                          
                document.getElementById('notpertainingrow').style.display='none'; 
                
                  if(document.getElementById(id).value=='no action')
                  {
                      document.getElementById('noactionrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='forward to subordinate organization')
                  {
                      document.getElementById('forwardrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='not pertaining to our organization')
                  {
                    
                      document.getElementById('notpertainingrow').style.display='block';
                  }
                  
            }
            
        </script>
        
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">NEW GRIEVANCE DETAILS</font></h2>
         <form action="NewGrievanceAction" method="post"  name="take_action" id="form1">
        
        <%
        String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
        String govt_dept=(String)session.getAttribute("govt_dept");
        String parent_org=(String)session.getAttribute("parent_org");
        String org_id=(String)session.getAttribute("org_id");
        
        String grv_regd_id=request.getParameter("grv_regd_id");
        
  String pgo_regd_id1="";
         
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where  gr.grv_regd_id=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();
    if (rs.next())
    {
        
         String sql407 = "update grv_regd set received_date=curdate() where grv_regd_id=? and received_date='-' ";
         PreparedStatement ps407 = con.prepareStatement(sql407);           
         ps407.setString(1,grv_regd_id);
         ps407.executeUpdate();
     
                
        
        
        
        
        
        
         pgo_regd_id1=rs.getString("pgo_regd_id");
        String user_regd_id=rs.getString("user_regd_id");
        String regd_date=rs.getString("regd_date");
        //String name="";
        String name=rs.getString("name");
        String nature=rs.getString("nature");
        String grv_details=rs.getString("grv_details");
        String action_suggested=rs.getString("action_suggested");
        if(action_suggested==null)
            action_suggested="-";
        String file=rs.getString("file");
        if(file==null)
            file="-";
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
        String govt_dept1=rs.getString("govt_dept");
        
        String grv_status=rs.getString("grv_status");
        String remarks=rs.getString("remarks");
        if(remarks==null)
            remarks="-";
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
            System.out.println(tdate+":"+cdate+":"+tflag);
        }
         
         String local_file_no=rs.getString("local_file_no");
         String grv_type=rs.getString("grv_type");
         String grv_ref_status=rs.getString("grv_ref_status");
         if(grv_ref_status==null || grv_ref_status.equals("no") || grv_ref_status.equals("") || grv_ref_status.equals("-"))
             grv_ref_status="";
         else
             grv_ref_status=user_regd_id+"/"+grv_ref_status;
         
         
      
         
         String status1="";
         String govt_dept2="";
         String dist="";
         String block="";
         String comment="";
          String fremark="";
        
         
         
        
                status1="New";
                govt_dept2="complainant/citizen";
                dist="";
                block="";
                comment="taken up with first org";
        

        if(status1==null){
            status1="";
        }
         if(govt_dept2==null){
            govt_dept2="";
        }
         if(dist==null){
            dist="";
        }
        if(block==null){
            block="";
        }
         if(comment==null){
          comment="";   
         }
         if(fremark==null){
            fremark="";
        }
    
    
    
    
  %>
               
<table width="690" height="290" border="1" class="table1">
  <tr>
    <th width="452" >GRIEVANCE REGISTRATION NO:</th>
    <td width="341" scope="col"><%=grv_regd_id %></td>
    <td width="76" >&nbsp;</td>
    <th width="212" >LOCATION OF GRIEVANCE:</th>
    <td width="275" ><%=lg_dist%>,<%=lg_block%>,<%=lg_panchayat%>,<%=lg_village%></td>
  </tr>
  <tr>
      <th>NAME OF COMPLAINANT:</th>
    <td><%=name%></td>
    <td>&nbsp;</td>
    <th>RECEIVED BY:</th>
    <td><%=govt_dept1%></td>
  </tr>
  <tr>
    <th>COMPLAINANTS DETAILS:</th>
    <td><a href="UserDetails.jsp?user_regd_id=<%=user_regd_id%>" class="various fancybox.ajax" >Details</a></td>
    <td>&nbsp;</td>
    <th>RECEIVED ON:</th>
    <td><%=regd_date%></td>
  </tr>
  <tr>
    <th>NATURE OF GRIEVANCE:</th>
    <td><%=nature%></td>
    <td>&nbsp;</td>
    <th>CURRENT STATUS:</th>
    <td><font color="blue">(<%=status1%>)</font></br>received from <font color="green"><%=govt_dept2%></font>-<%=dist%>-<%=block%>
    </br><%=comment%></td>
  </tr>
  <tr>
    <th>GRIEVANCE:</th>
    <td><%=grv_details%></td>
    <td>&nbsp;</td>
    <th>TARGET DATE:</th>
    
        
      <%--<form name="form1" method="post" action="TargetDate">--%>
      
     <% if(target_date.equals("") || target_date.equals("-")){
          %>
          <td><input type="hidden" name="grv_regd_id" value="<%=grv_regd_id%>" />
          <label>
            <input name="tg_date" id="tg_date" type="text" value="" placeholder="Target Date" size="10" maxlength="10" onfocus="this.blur()"/>
            <a href="javascript:NewCssCal('tg_date','yyyymmdd')"><img src="jscalendar/cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align:text-bottom"/></a>
          </label></td>
          
          <%} else{
      if(tflag==true){
          %>
          <td><font color="blue"> <%=target_date%></font></br><font color="red">OVER DUE DATE</font></td>
<%}
          
else{%>
<td><%=target_date%></td>
<%}}%>
         <%-- <input type="submit" name="button" id="button" value="SET" />--%>
        
      <%--</form>--%>
          
    </td>
  </tr>
  <tr>
    <th>REMEDIAL ACTION SUGGESTED:</th>
    <td><%=action_suggested%></td>
    <td>&nbsp;</td>
    <th>REMARKS:</th>
    <td><%=fremark%></td>
  </tr>
  <tr>
    <th>ATTACHMENT:</th>
    <td> ===<%=file%>===
        <%if(file!=null && !"-".equals(file)  && !"".equals(file)){ %>
            <a href="uploadedfiles/<%=file%>" target="_blank">Download</a>
             <%}%>

        </td>
    <td>&nbsp;</td>
    <th>&nbsp;</th>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <th>PREVIOUS GRIEVANCE REFERENCE NO:</th>
    <td>
        <%if(grv_ref_status==null || grv_ref_status.equals("") || grv_ref_status.equals("-")){}
                 else{%>
        
        ==<%=grv_ref_status%>==
        <a href="PreviousGrvRef.jsp?grv_ref_status=<%=grv_ref_status%>">VIEW</a><%}%></td>
    <td>&nbsp;</td>
    <th>&nbsp;</th>
    <td><h3><font color="purple"><a href="NewGrievanceFlowStatus.jsp?grv_regd_id=<%=grv_regd_id%>" class="various fancybox.ajax">GRIEVANCE FLOW DETAILS</a></font></h3>
 </td>
    </tr>
</table>
  
        
  
  
  
 <%-- <form action="NewGrievanceAction" method="post"  name="take_action" id="form1">--%>
      <input type="hidden" name="grv_regd_id" value="<%=grv_regd_id%>" />
      <table width="690"  border="0" class="table1">
    <tr>
      <th height="52" colspan="2" scope="col">TAKE ACTION</th>
    </tr>
    <tr>
    <td >LOCAL FILE NO</td>
    <% if(local_file_no==null || local_file_no.equals("") || local_file_no.equals("-")){
          %>
     
      <td><label>
        <input type="text" name="local_file_no" id="local_file_no" />
      </label></td>
      <%}else{
             %>
             <td><%=local_file_no%></td>
             <%}%> </tr>
      
    
    <tr>
      <td >GRIEVANCE CATEGORY</td>
      <% if(grv_type==null || grv_type.equals("") || grv_type.equals("-")){
          %>
    
      <td><label>
        <select name="grv_type" id="select">
            <option selected="selected" value="">--Select--</option>
         <%
  
  
            String sql11="select category_name from grv_category  where org_id='"+govt_dept+"' or org_id=(select org_id from org_regd where govt_dept='"+govt_dept+"')";
            System.out.println(sql11);
            PreparedStatement ps11=con.prepareStatement(sql11);
            ResultSet rs11= ps11.executeQuery();
            while(rs11.next())
            {
                String category_name=rs11.getString("category_name");
                
                %>
                <option ><%=category_name%></option>
         <%}%>
        
        
        </select>
      </label></td>
      <%}else{%>
      <td><%=grv_type%></td>
      <%}%>
    </tr>
    <%}%>
    <% 
    System.out.println("--------> " + pgo_regd_id + " :: " + pgo_regd_id1 );
    
%>
<tr>
      <td width="258" >DECISION</td>
      <td width="348"><label>
        <select name="decision" id="decision" onchange="displayRow('decision')">
         <option selected="selected">--Select--</option>
          <option>examine at our level</option>
        
             <option>no action</option>
           
            <option>Dispose</option>
        </select>
      </label></td>
    </tr>
  </table>
      <br/>
      <table class="table1" width="690"> 
      <tbody id="noactionrow" style="display: none;">
    <tr>
      <td >REMARKS:</td>
      <td><label>
        <textarea name="noaction_remarks" id="textarea2" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    <tr>
      <td >ATTACH FILE:</td>
      <td><label>
        <input type="hidden" name="file" id="file" />
      </label>
      
      
      <input id="fileupload" type="file" name="files[]" /> (Any PDF upto 1MB)
        <label id="fileL"></label>
      </td>
    </tr>
    </tbody>
    
    <tbody id="forwardrow" style="display: none;"> 
    <tr>
      <td>SELECT SUBORDINATE ORGANIZATION</td>
      <td><label>
        <select name="subordinate_org" id="subordinate_org">
        
              <option selected="selected" value="">--Select--</option>
       
             <%
  
  
            String sql1="select org_id,govt_dept,dist,block from org_regd where parent_org=?";
            PreparedStatement ps1=con.prepareStatement(sql1);
            ps1.setString(1, org_id);
            ResultSet rs1= ps1.executeQuery();
            while(rs1.next())
            {
                String org_id1=rs1.getString("org_id");
                String govt_dept1=rs1.getString("govt_dept");
                String dist=rs1.getString("dist");
                String block=rs1.getString("block");
                
                String str=org_id1+"-"+govt_dept1;
                
                if(dist!=null && !"".equals(dist))
                    str+="-"+dist;
                if(block!=null && !"0".equals(block))
                    str+="-"+block;
                
                %>
                <option value="<%=org_id1%>"><%=str%></option>
         <%}%>
        
        
        </select>
              
      </label></td>
    </tr>
    <tr>
      <td>FORWARDING REMARKS</td>
      <td><label>
        <textarea name="forwarding_remarks" id="textarea" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    
   </tbody>
    
    
     <tbody id="notpertainingrow" style="display: none;"> 
    <tr>
      <td >SUGGEST OFFICE</td>
      <td><label>
        <select name="govt_dept" id="govt_dept" >
        
              <option selected="selected" value="">--Select--</option>
      
        <%
  
  
            String sql12="select org_id,govt_dept,dist,block from org_regd where org_id!=?";
            PreparedStatement ps12=con.prepareStatement(sql12);
            ps12.setString(1, org_id);
            ResultSet rs12= ps12.executeQuery();
            while(rs12.next())
            {
                String org_id12=rs12.getString("org_id");
                String govt_dept12=rs12.getString("govt_dept");
                String dist=rs12.getString("dist");
                String block=rs12.getString("block");
                
                String str=org_id12+"-"+govt_dept12;
                
                if(dist!=null && !"".equals(dist))
                    str+="-"+dist;
                if(block!=null && !"0".equals(block))
                    str+="-"+block;
                
                %>
                <option value="<%=org_id12%>"><%=str%></option>
         <%}%>
        
      </select>
       
      </label></td>
    </tr>
    
    <tr>
      <td >REMARKS:</td>
      <td><label>
        <textarea name="not_pertaining_remarks" id="textarea3" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
     </tbody>
     
    <tr>
      <td >&nbsp;</td>
      <td><label>
        <input type="submit" name="button" id="button" value="SUBMIT" />
      </label></td>
    </tr>
  </table>
</form>
  
         
<script src="jsFileUpload/vendor/jquery.ui.widget.js"></script>
<script src="jsFileUpload/jquery.iframe-transport.js"></script>
<script src="jsFileUpload/jquery.fileupload.js"></script>
<script>
$(function () {
    
    $('#fileupload').fileupload({
        dataType: 'json',
        url: 'FileUploadServlet',
        progress:function(e, data) {
            var pec=parseInt(data.loaded / data.total * 100, 10);
            if(pec==99)   /*  for Firefox: as Progress stops at 99% */
                pec=pec+1;
         	$('#fileL').html('Upload Status :  '+ pec +' %');
        },
        done: function (e, data) {
            $.each(data.result, function (index, file) {
                if(index=="name")
                 {   
                     $("#file").val(file)
                     $("#fileL").html(file);
                 }   
                if(index=="size")
                 {                        
                     $("#fileL").append(" ("+file+")");
                 }   
                if(index=="error")
                 {  
                     $("#fileL").html(" ("+file+")");
                 }   
            });
        }
    });
});
</script>



  <%@ include file="common/lbody.jsp" %>
  <%@ include file="floatmenu2.jsp" %>
    
    </body>
</html>
