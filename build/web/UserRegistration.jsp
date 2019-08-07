<%-- 
    Document   : Registration
    Created on : 20 Nov, 2012, 5:05:28 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
     
        
        <script type="text/javascript" src="javascript/common.js"></script>
	<script type="text/javascript" src="javascript/UserRegistration.js"></script>
		
                
<script type="text/javascript" src="jscalendar/datetimepicker_css.js"></script>
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        

<form action="Registration" method="post" name="Registration" onsubmit="return checkForm(this)">
  <table width="700" border="0" align="center" class="table1">
  
    
    <tr>
      <th colspan="3" scope="col" bgcolor="White">NEW USER REGISTRATION</th>
    </tr>
    <tr>
      <th width="200">User Name</th>
      <td width="500"><input name="name" type="text" value="" placeholder="User Name" size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>Date Of Birth</th>
      <td ><input name="dob" id="dob" type="text"  placeholder="DOB" size="10" maxlength="10" onfocus="this.blur()"/>
      <a href="javascript:NewCssCal('dob','yyyymmdd')"><img src="jscalendar/cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align:text-bottom"/></a>
      </td>
    </tr>
    <tr>
      <th>Gender</th>
      <td><input name="gender" type="radio" value="male" />
        Male
        <input name="gender" type="radio" value="female" />
        Female
        <input name="gender" type="radio" value="transgender" />
        Transgender
        <input name="gender" type="radio" value="others" />
        Others (if  not an individual)</td>
    </tr>
    <tr>
      <th>Category :</th>
      <td>
           
          <select name="category" id="category" >
                <option value=""> Select </option> 
                <option >SC</option>
                <option >ST</option>
                <option >OBC</option>
                <option >GENERAL</option>
                <option >NOT KNOWN</option>
        </select>
          <span class="error" id="categoryL"></span>
      </td>
    </tr>
    <tr>
      <th>Type</th>
      <td>
          <select name="type" id="type" >
            <option value=""> Select </option> 
            <option >SENIOR CITIZEN</option>
            <option >DEFENCE PERSONNEL</option>
            <option >OTHERS</option>
   </select>
          <span class="error" id="typeL"></span>
          
      </td>
    </tr>
    
    <tr>
      <th>District</th>
      <td>
          <input type="text" id="dist" name="dist" value="" />
          <span class="error" id="distL"></span>
          </td>
    </tr>
    <tr>
      <th>City/Block</th>
      <td>
         <input type="text" id="block" name="block" value="" />
          <label id="blockLabel"></label>
          
      </td>
    </tr>
    
   
    <tr>
      <th>Area/Village</th>
      
      <td>
           <input type="text" id="village" name="village" value="" />          
          <label id="villageLabel"></select>
          </label>
          </td>
    </tr>
    <tr>
      <th>Address Of Communication:</th>
      <td><textarea name="address" cols="30" rows="6"></textarea></td>
    </tr>
    <tr>
      <th>PIN Code</th>
      <td><input name="pincode" type="text" value="" placeholder="pincode" size="" maxlength="6" /></td>
    </tr>
    <tr>
      <th>Mobile Number</th>
      <td><input name="mobileno" type="text" value="" placeholder="Mobile number" size="10" maxlength="10" />
        (Don't Prefix 0 or +91)</td>
    </tr>
    <tr>
      <th>e-mail id</th>
      <td><input name="emailid" type="text" value="" placeholder="e-mail id" size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>ID Proof</th>
      <td><select name="id_proof">
        <option selected="selected">--Select--</option>
        <option >PAN</option>
        <option >BPL</option>
        <option >VOTER ID</option>
        <option >PDS</option>
        <option >DRIVING LICENCE</option>
        <option >UID</option>
      </select></td>
    </tr>
    <tr>
      <th>ID Proof Number</th>
      <td><input name="id_proof_no" type="text" size="20" maxlength="20" /></td>
    </tr>
    <tr>
      <th>Photo</th>
      <td><input name="photo" id="photo" type="hidden"  value=""/>
      <input id="fileupload" type="file" name="files[]" />
        <label id="imageL"></label>
      </td>
    </tr>
    <tr>
      <th>Password</th>
      <td><input name="password" type="password" size="20" maxlength="15" /></td>
    </tr>
    <tr>
      <th>Confirm Password</th>
      <td><input name="confirmpassword" type="password" size="20" maxlength="15" /></td>
    </tr>
    <tr>
      <th>Enter Security Code as shown</th>
      <td>
          <table>
              <tr>
                  <td> <img src="./CaptchaServlet"  alt="Captcha image" width="120" height="40" align="text-bottom" style="border:none" border="0"/> </td>
                  <td> <input name="captcha" type="text" size="20" maxlength="6" /> </td>
              </tr>
          </table>
          
          
      
      </td>
    </tr>
    <tr>
      <th>&nbsp;</th>
      <td> <input name="submit" type="submit" value="Submit" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
      <input name="reset" type="Reset" value="Reset" /></td>
    </tr>
     </table>

</form>
        
        
<!--<script src="jsFileUpload/jquery-1.7.1.min.js"></script>-->
<script src="jsFileUpload/vendor/jquery.ui.widget.js"></script>
<script src="jsFileUpload/jquery.iframe-transport.js"></script>
<script src="jsFileUpload/jquery.fileupload.js"></script>
<script>
$(function () {
    
    $('#fileupload').fileupload({
        dataType: 'json',
        url: 'ImageUploadServlet',
        done: function (e, data) {
            $.each(data.result, function (index, file) {
                if(index=="name")
                 {   
                     $("#photo").val(file)
                     $("#imageL").html("<img src='uploadedfiles/"+file+"' width='100' height='100' />");
                 }   
            });
        }
    });
});
</script>

    <%@ include file="common/lbody.jsp" %>
    </body>
</html>
