<%-- 
    Document   : Registration
    Created on : 20 Nov, 2012, 5:05:28 PM
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
        
        <script type="text/javascript" src="javascript/show_block.js"></script>
        <script type="text/javascript" src="javascript/show_panchayat.js"></script>
        <script type="text/javascript" src="javascript/show_village.js"></script>
        
        <script type="text/javascript" src="javascript/common.js"></script>
	<script type="text/javascript" src="javascript/UserRegistration.js"></script>
		
                
<script type="text/javascript" src="jscalendar/datetimepicker_css.js"></script>
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        
         <%
            String user_regd_id=request.getParameter("user_regd_id");
            Connection con=new DBConnection().getConnection();
            String sql="select * from user_regd where user_regd_id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, user_regd_id);
            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {
                String name=rs.getString("name");
                String dob=rs.getString("dob");
                String gender=rs.getString("gender");
                String category=rs.getString("category");
                String type=rs.getString("type");
                String dist=rs.getString("dist");
                String block=rs.getString("block");
                String panchayat=rs.getString("panchayat");
                String village=rs.getString("village");
                String address=rs.getString("address");
                String pincode=rs.getString("pincode");
                String mobileno=rs.getString("mobileno");
                String emailid=rs.getString("emailid");
                String id_proof=rs.getString("id_proof");
                String id_proof_no=rs.getString("id_proof_no");
                String photo=rs.getString("photo");
               
     %>
       
         
        
        
        
<form action="UpdateUserDetails" method="post" onsubmit="return checkForm(this)">
             <input type="hidden" name="user_regd_id" id="user_regd_id" size="80" value="<%=user_regd_id%>" />
     

  <table width="700" border="0" align="center" class="table1">
  
    
    <tr>
      <th colspan="3" scope="col" bgcolor="White"><h3>EDIT USER PROFILE</h3></th>
    </tr>
    <tr>
      <th width="150">User Registration ID</th>
      <td width="550"><label><%=user_regd_id%></label></td>
    </tr> 
    
    <tr>
      <th width="300">User Name</th>
      <td width="600"><input name="name" type="text" value="<%=name%>" placeholder="User Name" size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>Date Of Birth</th>
      <td ><input name="dob" id="dob" type="text" value="<%=dob%>" placeholder="DOB" size="10" maxlength="10" onfocus="this.blur()"/>
      <a href="javascript:NewCssCal('dob','yyyymmdd')"><img src="jscalendar/cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align:text-bottom"/></a>
      </td> 
    </tr>
    <tr>
      <th>Gender</th>
      <td><label><input name="gender" type="radio" value="male"  <%if("Male".equalsIgnoreCase(gender))out.print("checked='true'"); %>/>
              Male</label>
          <label><input name="gender" type="radio" value="female"  <%if("Feale".equalsIgnoreCase(gender))out.print("checked='true'"); %>/>
              Female</label>
          <label><input name="gender" type="radio" value="transgender"  <%if("Transgender".equalsIgnoreCase(gender))out.print("checked='true'"); %>/>
              Transgender</label>
          <label><input name="gender" type="radio" value="others" <%if("Others".equalsIgnoreCase(gender))out.print("checked='true'"); %> />
              Others (if  not an individual)</label></td>
    </tr>
    <tr>
      <th>Category :</th>
      <td>
           
          <select name="category" id="category" >
                <option value=""> Select </option> 
                <option <%if("SC".equalsIgnoreCase(category))out.print("selected"); %>>SC</option>
                <option <%if("ST".equalsIgnoreCase(category))out.print("selected"); %>>ST</option>
                <option <%if("OBC".equalsIgnoreCase(category))out.print("selected"); %>>OBC</option>
                <option <%if("GENERAL".equalsIgnoreCase(category))out.print("selected"); %>>GENERAL</option>
                <option <%if("NOT KNOWN".equalsIgnoreCase(category))out.print("selected"); %>>NOT KNOWN</option>
        </select>
          <span class="error" id="categoryL"></span>
      </td>
    </tr>
    <tr>
      <th>Type</th>
      <td>
          <select name="type" id="type" >
            <option value=""> Select </option> 
            <option <%if("NRI".equalsIgnoreCase(type))out.print("selected"); %>>NRI</option>
            <option <%if("SENIOR CITIZEN".equalsIgnoreCase(type))out.print("selected"); %>>SENIOR CITIZEN</option>
            <option <%if("DEFENCE PERSONNEL".equalsIgnoreCase(type))out.print("selected"); %>>DEFENCE PERSONNEL</option>
            <option <%if("OTHERS".equalsIgnoreCase(type))out.print("selected"); %>>OTHERS</option>
   </select>
          <span class="error" id="typeL"></span>
          
      </td>
    </tr>
    
    <tr>
      <th>Address Of Communication:</th>
      <td><textarea name="address" cols="30" rows="6"><%=address%></textarea></td>
    </tr>
    <tr>
      <th>PIN Code</th>
      <td><input name="pincode" type="text"  placeholder="pincode" size="" maxlength="6" value="<%=pincode%>"/></td>
    </tr>
    <tr>
      <th>Mobile Number</th>
      <td><input name="mobileno" type="text" value="<%=mobileno%>" placeholder="Mobile number" size="10" maxlength="10" />
        (Don't Prefix 0 or +91)</td>
    </tr>
    <tr>
      <th>e-mail id</th>
      <td><input name="emailid" type="text" value="<%=emailid%>" size="30" maxlength="30" /></td>
    </tr>
    <tr>
      <th>ID Proof</th>
      <td><%=id_proof%></td>
    </tr>
    <tr>
      <th>ID Proof Number</th>
      <td><input name="id_proof_no" type="text" size="20" maxlength="20" value="<%=id_proof_no%>"/></td>
    </tr>
    <tr>
      <th>Photo</th>
      <td><img src='uploadedfiles/<%=photo%>' width='100' height='100' alt="<%=photo%>" />
          <input name="photo1" id="photo1" type="hidden"  value="<%=photo%>"/>
      <input name="photo" id="photo" type="hidden"/>
      <input id="fileupload" type="file" name="files[]" />
        <label id="imageL"></label>
      </td>
    </tr>
    
    <tr>
      <th>&nbsp;</th>
      <th> <input name="submit" type="submit" value="Update" />&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; 
      <input name="reset" type="Reset" value="Reset" /></th>
    </tr>
    
  </table>
      <%}%>
 

</form>
        
        
<script src="jsFileUpload/jquery-1.7.1.min.js"></script>
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
