<%-- 
    Document   : PendingGrievanceDetails
    Created on : 7 Dec, 2012, 5:01:04 PM
    Author     : USER
--%>

<%@page import="grv.cell.beans.DateTime"%>
<%@page import="java.util.Date"%>
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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <script type="text/javascript" >
            function displayRow(id)
            {
                document.getElementById('sendreminderrow').style.display='none';                          
                document.getElementById('seekclarificationrow').style.display='none';                          
                document.getElementById('sendreportrow').style.display='none'; 
                document.getElementById('passreportrow').style.display='none'; 
                document.getElementById('disposedirectrow').style.display='none'; 
                document.getElementById('disposetransferrow').style.display='none'; 
                
                  if(document.getElementById(id).value=='send reminder to subordinate organization')
                  {
                      document.getElementById('sendreminderrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='seek clarification from...')
                  {
                      document.getElementById('seekclarificationrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='send report')
                  {
                      document.getElementById('sendreportrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='pass report')
                  {
                      document.getElementById('passreportrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='DISPOSE (direct grievance)')
                  {
                      document.getElementById('disposedirectrow').style.display='block';
                  }
                  
                  if(document.getElementById(id).value=='DISPOSE (transfered grievance)')
                  {
                      document.getElementById('disposetransferrow').style.display='block';
                  }
            }
            
            function showClarificationRow(id)
            {
                document.getElementById('clarificationuser-row').style.display='none';
                document.getElementById('clarificationorg-row').style.display='none';
                if(document.getElementById(id).selectedIndex==1)
                  {
                      document.getElementById('clarificationuser-row').style.display='block';
                  }
                if(document.getElementById(id).selectedIndex==2)
                  {
                      document.getElementById('clarificationorg-row').style.display='block';
                  }
                
               
            }
        </script>
        
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">PENDING GRIEVANCE DETAILS</font></h2>
        
        <%
         String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
        String govt_dept=(String)session.getAttribute("govt_dept");
        String parent_org=(String)session.getAttribute("parent_org");
        String ofc="";
        String remarkz="";
        String ofc_name="";
        String dist_name="";
        String block_name="";
       
        
        String grv_regd_id=request.getParameter("grv_regd_id");
        
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where  gr.grv_regd_id=? ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ResultSet rs=ps.executeQuery();
    if (rs.next())
    {
        String decision="------";
        String user_regd_id=rs.getString("user_regd_id");
        String regd_date=rs.getString("regd_date");
        //String name="";
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
        String govt_dept1=rs.getString("govt_dept");
        
        String grv_status=rs.getString("grv_status");
        String local_file_no=rs.getString("local_file_no");
        if(local_file_no==null)
            local_file_no="";
        
        String remarks=rs.getString("remarks");
        if(remarks==null)
            remarks="";
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
       String grv_type=rs.getString("grv_type");
        if(grv_type==null)
            grv_type="";
       
       
       
         String govt_dept100="";
         String dist="";
         String block="";
         String govt="";
         String org_id="";
         String pgo_sent="";
        
       
       
       
       
       
       String sql3="select decision from grv_action where action_taken_by=? and grv_regd_id=?";
           PreparedStatement ps3 = con.prepareStatement(sql3);
            ps3.setString(1, pgo_regd_id);
            ps3.setString(2, grv_regd_id);
            ResultSet rs3=ps3.executeQuery();
            
            if(rs3.next())
                            {
                decision=rs3.getString("decision");
                
            if(decision.equalsIgnoreCase("examine at our level"))
                    decision="examined at our level";
            
                
                String sql4="select ga.*,or1.* from grv_action ga join org_regd or1 on(ga.subordinate_org=or1.org_id) where grv_regd_id=? and action_taken_by=?" ; 
         PreparedStatement ps4 = con.prepareStatement(sql4);
         
         
         
         ps4.setString(1, grv_regd_id);
         ps4.setString(2, pgo_regd_id);
         System.out.println("====="+ps4);
         ResultSet rs4=ps4.executeQuery();
         if(rs4.next())
         {
             org_id=rs4.getString("org_id");
           govt_dept100=rs4.getString("govt_dept");
govt=govt_dept100;            
           dist=rs4.getString("dist");  
           block=rs4.getString("block"); 
govt_dept100="sent to "+govt_dept100;          
             
         }
         else{
                
                govt_dept100="";
                dist="";
                block="";
                
         }

         if(govt_dept100==null){
            govt_dept100="";
        }
         if(dist==null){
            dist="";
        }
        if(block==null){
            block="";
        }
    
    
    }

String report_id="";                      
String action_report="";                      
String action_report1="";                      
String report_file="";                      
            
     String sql99="select * from case_report where grv_regd_id=? and sentto_pgo=?";
     PreparedStatement ps99 = con.prepareStatement(sql99);
     ps99.setString(1, grv_regd_id);
     ps99.setString(2, pgo_regd_id);
     System.out.println("====="+ps99);
     ResultSet rs99=ps99.executeQuery();
     if(rs99.next())
     {
          report_id=rs99.getString("report_id");
          action_report=rs99.getString("action_report");
          report_file=rs99.getString("report_file"); 
          action_report1=action_report;          
         
          if(action_report.length()>15)
              action_report1=action_report.substring(0,15)+"..";
      }                        

        boolean eflag=false;
        String sqlfa = "Select * from grv_action where grv_regd_id=? and action_taken_by=? and decision=?";
        PreparedStatement psfa = con.prepareStatement(sqlfa); 
        psfa.setString(1, grv_regd_id);                    
        psfa.setString(2, pgo_regd_id);                    
        psfa.setString(3, "examine at our level");                    
        ResultSet rsfa =psfa.executeQuery();
        if(rsfa.next())
        {
            eflag=true;                   
        }
                    
      

    
  %>
        
 <table width="690" border="1"class="table1">
  <tr>
    <th width="323" >GRIEVANCE REGISTRATION NO:</th>
    <td width="339" scope="col"><%=grv_regd_id%></td>
    <td width="67" >&nbsp;</td>
    <th width="230" >LOCATION OF GRIEVANCE:</th>
    <td width="397" ><%=lg_dist%>,<%=lg_block%>,<%=lg_panchayat%>,<%=lg_village%></td>
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
    <td><a href="UserDetails.jsp?user_regd_id=<%=user_regd_id%>" class="various fancybox.ajax" >VIEW</a></td>
    <td>&nbsp;</td>
    <th>RECEIVED ON:</th>
    <td><%=regd_date%></td>
  </tr>
  <tr>
    <th> GRIEVANCE DETAILS:</th>
    <td><label>
      <a href="GrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>">VIEW</a>
    </label></td>
    <td>&nbsp;</td>
    <th>CURRENT STATUS:</th>
    <td><font color="blue">(<%=grv_status%>)</font></br><%=decision%></br><font color="green"><%=govt_dept100%>-<%=dist%>-<%=block%></font></td>
  </tr>
 
    <tr>
        <th>TARGET DATE:</th>
    <%
      if(tflag==true){
          %>
          <td colspan="4"><font color="blue"> <%=target_date%></font></br><font color="red">OVER DUE DATE</font></td>
<%}
else{%>
          <td colspan="4"><%=target_date%></td>
<%}%>
  </tr>
  <% 
  System.out.println(target_date); %>
 
 <tr>
      <th>GRIEVANCE CATEGORY:</th>
    <td colspan="4"><%=grv_type%></td>
  </tr>

  
  <tr>
      <th>LOCAL FILE NO:</th>
      <td colspan="4"><%=local_file_no%></td>
      </tr>
    <tr>
        <th>&nbsp;</th>
      <td colspan="4" align="right"><h3><font color="purple"><a href="NewGrievanceFlowStatus.jsp?grv_regd_id=<%=grv_regd_id%>" class="various fancybox.ajax">GRIEVANCE FLOW DETAILS</a></font></h3>
 </td>
      </tr>
     
    
  
</table>
<br/>

<form id="form1" name="form1" method="post" action="PendingGrievanceAction">
    <input type="hidden" name="grv_regd_id" value="<%=grv_regd_id%>" />
    <table width="690" border="0" class="table1">
    <tr>
      <th colspan="2" scope="col">TAKE ACTION</th>
    </tr>
    <tr>
      <td>DECISION</td>
      <td><label>
       <select name="decision" id="decision" onchange="displayRow('decision')">
         <option selected="selected">--Select--</option>
         <option>send reminder to subordinate organization</option>
        <option>seek clarification from...</option>
         <option>send report</option>
        <option>pass report</option>
        <option>DISPOSE (direct grievance)</option> 
        <option>DISPOSE (transfered grievance)</option>
        </select>
         
      </label></td>
    </tr>
  </table>
         
  <br/>
    <table width="690" class="table1">
        <tbody id="sendreminderrow" style="display: none;">
    <tr>
      <td>NAME OF THE ORGANIZATION:</td>
      <td><label>
              <%=org_id%>-<%=govt%>-<%=dist%>-<%=block%>
              <input name="reminder_sent_to" type="hidden" value="<%=org_id%>">
              <input name="reminder_sent_to_pgo" type="hidden" value="<%=pgo_sent%>">
      </label></td>
    </tr>
    <tr>
      <td>REMINDER:</td>
      <td><label>
        <textarea name="reminder_to_sub_org" id="textarea" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
        </tbody>
        <tbody id="seekclarificationrow" style="display: none;">
<tr>
      <td>TYPE:</td>
      <td><label>
              <select name="clarification_type" id="clarification_type" onchange="showClarificationRow('clarification_type')">
         <option selected="selected">--Select--</option>
          <option>COMPLAINANT/USER</option>
            </select>
      </label></td>
    </tr>
    <tr id="clarificationuser-row" style="display: none;">
      <td>NAME OF THE complainant/user:</td>
      <td><label>
              <font color="purple"><%=name%></font>
              <input name="user_clarification" type="hidden" value="<%=user_regd_id%>">
      </label></td>
    </tr>
    
    <tr id="clarificationorg-row" style="display: none;">
      <td>NAME OF THE ORGANIZATION:</td>
      <td><label>
             <font color="purple"> <%=org_id%>-<%=govt%>-<%=dist%>-<%=block%></font>
              <input name="subordinate_organization_clarification" type="hidden" value="<%=org_id%>">
              <input name="clarification_sent_to_pgo" type="hidden" value="<%=pgo_sent%>">
     
      </label></td>
    </tr>
    
    <tr>
      <td>CLARIFICATION ABOUT:</td>
      <td><label>
        <textarea name="clarification_ques" id="textarea2" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
        </tbody>
        <tbody id="sendreportrow" style="display: none;">
            <tr><td></td><td><input name="parent_org_sendreport" type="hidden" value="<%=parent_org%>"></td></tr>
            <tr>
      <td>ACTION REPORT:</td>
      <td><label>
        <textarea name="action_report_sendreport" id="textarea3" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    <tr>
      <td>ATTACH FILE:</td>
      <td>
        <input id="fileupload" type="file" name="files[]" /> (Any PDF upto 1MB)
      <input name="file_sendreport" id="file" type="hidden" />
        <label id="fileL"></label>
      
      </td>
    </tr>
        </tbody>
        <tbody id="passreportrow" style="display: none;">
            <tr><td></td><td><input name="parent_org_passreport" type="hidden" value="<%=parent_org%>"></td></tr>
            <tr><td></td><td><input name="report_id" type="hidden" value="<%=report_id%>"></td></tr>
         
   <tr>
      <td>ATTACH ACTION TAKEN REPORT:</td>
      <td>
      <label>
        <input type="checkbox" name="attach_report" value="<%=action_report %>" />ATTACH report from case report received
      </label>
          <div>(<%=action_report1 %>)</div>
      </td>
    </tr>
    <tr>
      <td>ATTACH FILE SENT:</td>
      <td>
           <label>
        <input type="checkbox" name="attach_report_file" value="<%=report_file %>" />ATTACH FILE
      </label>
      (<%=report_file %>)
      </td>
    </tr>
    <tr>
    <td>REMARKS:</td>
    <td><label>
        <textarea name="passreport_remarks" id="textarea" cols="45" rows="5"></textarea>
      </label></td></tr>
      
        
      <tr>
        <td colspan="2">
            <table border="1" class="table1">
                <tr>
                  <th>Name of Organization</th>
                  <th>Remarks</th>

                  </tr>
                  
                  <%
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
                      <td><%=ofc%>-<%=ofc_name%></br><%=dist_name%>-<%=block_name%></td>
                      <td><%=remarkz%></td>
                  </tr>
                  <%}%>

            </table>
        </td>
    </tr>
      
    
        </tbody>
        <tbody id="disposedirectrow" style="display: none;">
            <tr><td></td><td><input name="to_user_direct" type="hidden" value="<%=user_regd_id%>">
     </td></tr> <tr>
      <td>ACTION TAKEN REPORT:</td>
      <td><textarea name="action_report_disposedirect" id="textarea4" cols="45" rows="5"></textarea></td>
    </tr>
    <tr>
      <td>ATTACH FILE:</td>
      <td><input id="fileupload1" type="file" name="files[]" /> (Any PDF upto 1MB)
      <input name="file_disposedirect" id="file1" type="hidden" />
        <label id="fileL1"></label>
      </td>
    </tr>
    <tr>
      <td>REMARKS:</td>
      <td><label>
        <textarea name="remarks_disposedirect" id="textarea5" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
        </tbody>
        <tbody id="disposetransferrow" style="display: none;">
            <tr><td></td><td><input name="to_user_transfer" type="hidden" value="<%=user_regd_id%>">
            </td></tr> <tr>
                <td>&nbsp;</td>
                <td><a href="CaseReportReceived_ActionReport.jsp">EDIT ACTION REPORT</a></td>
                
            </tr>
            <tr>
      <td>ATTACH ACTION TAKEN REPORT:</td>
      <td>
           <label>
        <input type="checkbox" name="attach_report_disposetransfer" value="<%=action_report %>" />ATTACH report from case report received
      </label>
          <div>(<%=action_report %>)</div>
      </td>
    </tr>
    <tr>
      <td>ATTACH FILE SENT:</td>
      <td>
          <label>
        <input type="checkbox" name="attach_report_file_disposetransfer" value="<%=report_file %>" />ATTACH FILE
      </label>
      (<%=report_file %>)
      </td>
    </tr>
    <tr>
    <td>REMARKS:</td>
    <td><label>
        <textarea name="disposetransfer_remarks" id="textarea" cols="45" rows="5"></textarea>
      </label></td></tr>
    <tr><td colspan="2"> &nbsp; </td></tr>
        <tr><td colspan="2"> &nbsp; </td></tr>
    <tr>
        <td colspan="2">
            <table border="1" class="table1" width="100%">
                <tr>
                  <th>Name of Organization</th>
                  <th>Remarks</th>

                  </tr>
                  
                  <%
                  String sqlz="select * from pass_grv where grv_regd_id=?";
                   PreparedStatement psz = con.prepareStatement(sqlz);
        psz.setString(1, grv_regd_id);
        ResultSet rsz=psz.executeQuery();
         while(rsz.next())
         {
             ofc=rsz.getString("org_id");
             remarkz=rsz.getString("pass_remarks");
             
         
        String sqlw="select or2.*,pg.* from org_regd or2 join pass_grv pg on(or2.org_id=pg.org_id) where pg.org_id=?";
       PreparedStatement psw = con.prepareStatement(sqlw);
        psw.setString(1, ofc);
        ResultSet rsw=psw.executeQuery();
        
        if(rsw.next())
         {
              ofc_name=rsw.getString("govt_dept");
              dist_name=rsw.getString("dist");
              block_name=rsw.getString("block");
             
         }
        if(dist_name==null){
            dist_name="";
        }
        if(block_name==null || block_name=="0"){
            block_name="";
        }
    
    
 
                  %>
                  <tr>
                      <td><%=ofc%>-<%=ofc_name%></br><%=dist_name%>-<%=block_name%></td>
                      <td><%=remarkz%></td>
                  </tr>
                  <%}%>

            </table>
        </td>
    </tr>
      
        </tbody>
        <tr>
      
            <td colspan="2"><label>
        <input type="submit" name="button" id="button" value="SUBMIT" />
      </label></td>
    </tr>
    <%}%>
    </table>
        
</form>
    <!--
  <script src="jsFileUpload/jquery-1.7.1.min.js"></script>
    -->
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
    
    
    
    $('#fileupload1').fileupload({
        dataType: 'json',
        url: 'FileUploadServlet',
        progress:function(e, data) {
            var pec=parseInt(data.loaded / data.total * 100, 10);
            if(pec==99)   /*  for Firefox: as Progress stops at 99% */
                pec=pec+1;
         	$('#fileL1').html('Upload Status :  '+ pec +' %');
        },
        done: function (e, data) {
            $.each(data.result, function (index, file) {
                if(index=="name")
                 {   
                     $("#file1").val(file)
                     $("#fileL1").html(file);
                 }   
                if(index=="size")
                 {                        
                     $("#fileL1").append(" ("+file+")");
                 }   
                if(index=="error")
                 {  
                     $("#fileL1").html(" ("+file+")");
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
