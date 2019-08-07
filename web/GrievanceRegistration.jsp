<%-- 
    Document   : GrievanceRegistration
    Created on : 1 Dec, 2012, 4:48:31 PM
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
        
        
          <script type="text/javascript" src="javascript/common.js"></script>
          <script type="text/javascript" src="javascript/GrievanceRegistration.js"></script>

        
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">GRIEVANCE REGISTRATION</font></h2>
        
        
        
        
        
<form action="GrievanceRegistration" method="post" name="form1" onSubmit="return checkForm(this)">
    
    <%
String status1=(String)request.getAttribute("status");
if(status1!=null){   
%>
<h2><font color="red"><%=status1%></font>
<%}%>
    
  <table width="645" height="576" border="0" align="center" class="table1">
    
    <tr>
      <th colspan="4"> SUBMIT APPLICATION TO ::</th>
    </tr>
    <tr>
      <td width="268">Select the Dept to which the grievance pertains</td>
      <td colspan="3"><select name="govt_dept" id="govt_dept" onChange="displayBlock('govt_dept')">
        
        <option selected="selected" value="">--Select--</option>
        <option>Electricity Dept</option>
        <option>Water Supply Dept</option>       
        <option>Sanitation Dept</option>        
      </select>   
          
      <span class="error" id="govt_deptL"></span>
      </td>
	  </tr>
          
           
   <tr style="display:none">
      <td>
      <span id="distText" style="">District</span>
      </td>
      <td colspan="4">
           <input type="text" id="dist" name="dist" value="" />
          <span class="error" id="distL"></span>
      
      </td>
    </tr>
   <tr style="display:none">
        <td> <span id="blockText" style="">City/Block</span></td>
      <td colspan="4" >
           <input type="text" id="block" name="block" value="" />
          <label id="blockLabel"></label>
      </td>
    </tr>
    
    
          
          <tr>
      <th colspan="4">LOCATION  OF GRIEVANCE::</th>
	  </tr>
    
    <tr>
      <td>District</td>
      <td width="128" id="lg_distlabel">
         
          <input type="text" id="lg_dist" name="lg_dist" value="" />          
         
       
      <span class="error" id="lg_distL"></span>
      </td>
	  
      <td width="48"> Block</td>
      <td width="181" id="lg_blockLabel">
      <input type="text" id="lg_block" name="lg_block" value="" />     
      
      </td>
    </tr>
    <tr>
      
      <td>Area/Village</td>
      <td id="lg_villageLabel">
          
          <input type="text" id="lg_village" name="lg_village" value="" />   
       
      </td>
      <td>&nbsp;</td>
      <td id="lg_panchayatLabel"> &nbsp;
      </td>
    </tr>
    <tr>
      <th colspan="4">APPLICATION DETAILS ::</th>
      
    </tr>
    <tr>
      <td>Nature</td>
      <td colspan="3"><select name="nature">
        <option selected="selected">--Select--</option>
        <option>Grievance</option>
        <option>Demand</option>
      </select>
      
      <span class="error" id="natureL"></span>
      </td>
    </tr>
    <tr>
      <th colspan="4">Please Enter specific details about your Grievance :  </th>
	  </tr>
    <tr>
      <td colspan="4"><textarea name="grv_details" cols="50" rows="8"></textarea>  </td>
	  </tr>
    <tr>
      <th colspan="4">Remedial Action Suggested  </th>
	  </tr>
    <tr>
      <td colspan="4"><textarea name="action_suggested" cols="50" rows="8"></textarea>  </td>
	  </tr>
    <tr>
      <td>Attatch Files</td>
      <td><input id="fileupload" type="file" name="files[]" /></td>
      <td colspan="2">(Any PDF upto 1MB)
        <input name="file" id="file" type="hidden" />
        <label id="fileL"></label></td>
      </tr>
    <tr>
      <td colspan="3"> HAVE YOU EARLIER LODGED THE GRIEVANCE TO THE SAME OFFICE ON THE SAME SUBJECT? <font style="background-color: #3e3e3e" color="white">(If YES,then enter the previous grievance reference number)</font></td>
      <td><input type="text" name="grv_ref_status" placeholder="enter one no" id="grv_ref_status" size="9" maxsize="3"/></td>
    </tr>
      <tr>
          <td colspan="2"> <img src="./CaptchaServlet"  alt="Captcha image" width="120" height="40" align="text-bottom" style="border:none" border="0"/> </td>
          <td colspan="2"> <input name="captcha" type="text" size="20" maxlength="6" placeholder="Enter security code" /> </td>
              </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="SUBMIT" name="submit"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="reset" value="RESET" name="submit2"/></td>
      <td colspan="2">&nbsp;</td>
    </tr>
  </table>
</form>
         
        
<script src="jsFileUpload/jquery-1.7.1.min.js"></script>
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
    </body>
</html>
