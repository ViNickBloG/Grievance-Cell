<%-- 
    Document   : RegisterPgo
    Created on : 9 Apr, 2013, 1:56:49 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%@page import="java.sql.Connection"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <script type="text/javascript" src="jscalendar/datetimepicker_css.js"></script>
         <%@ include file="common/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <!--<script type="text/javascript" src="js/jquery.min.js"></script>-->
           
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
  <script type="text/javascript">
      
      function showDistBlock(val)
      {
          if(val=="" || val=="0")
              return;
          
            $.ajax({
                url: 'AjaxShowDistBlock.jsp',
                data: { org_id:val },
                success: function(data, status){
                    data=$.trim(data);
                    
                    var arr= data.split("$");
                    $("#dist").val(arr[0]);
                    $("#block").val(arr[1]);
                    
                },
                dataType: 'html'
            });
       
      }
  </script>
  
    </head>
    <body>
         <%@ include file="common/ubody.jsp" %>
         
         <%
                  

         String org_id=request.getParameter("org_id");
         String govt_dept=request.getParameter("govt_dept");
         
         Connection con=new DBConnection().getConnection();
            
         %>
         
        <form action="RegisterPgo" method="post">
  <table width="700" border="1" class="table1">
    <tr>
      <th colspan="2" scope="col">PGO REGISTRATION</th>
    </tr>
    
    <tr>
      <th width="250">Organization ID</th>
      <td width="450">
          
          <%if(org_id!=null){%>
          
          <select name="org_id">
          <option value="<%=org_id%>"><%=org_id%>-<%=govt_dept%></option>
        </select>
         <%}else{%>
         
          
         <select name="org_id" id="org_id" onchange="showDistBlock(this.value)">
              <option value="0">Select</option>
    <%
  
  
            String sql1="select org_id,govt_dept from org_regd";
            PreparedStatement ps1=con.prepareStatement(sql1);
            
            ResultSet rs1= ps1.executeQuery();
            while(rs1.next())
            {
                String org_id1=rs1.getString("org_id");
                String govt_dept1=rs1.getString("govt_dept");
                %>
                <option value="<%=org_id1%>"><%=org_id1%>-<%=govt_dept1%></option>
         <%}%>
          </select>
          <%}%>
      </td>
    </tr>
 
    <tr>
      <th>Name</th>
      <td><label>
        <input type="text" name="pgo_name" id="textfield" />
      </label></td>
    </tr>
    <tr>
      <th>Gender</th>
      <td><label>
              <input type="radio" name="gender" id="radio" value="male" />MALE</label>
          <label> <input name="gender" type="radio" value="female" />FEMALE
      </label></td>
    </tr>
    <tr>
      <th>DOB</th>
      <td> 
          <input name="dob" id="dob" type="text" value="" placeholder="DOB" size="10" maxlength="10" onfocus="this.blur()"/>
          <a href="javascript:NewCssCal('dob','yyyymmdd')"><img src="jscalendar/cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align:text-bottom"/></a></td>
    </tr>
     
    <tr>
      <th>Designation</th>
      <td><label>
        <input type="text" name="designation" id="textfield2" />
      </label></td>
    </tr>
    <tr>
      <th>Address</th>
      <td><label>
        <textarea name="pgo_address" id="textarea" cols="45" rows="5"></textarea>
      </label></td>
    </tr>
    <tr>
      <th>Attach photO</th>
      <td><input name="photo" id="photo" type="hidden"  value=""/>
      <input id="fileupload" type="file" name="files[]" />
        <label id="imageL"></label></td>
    </tr>
    <tr>
      <th>Mobile No</th>
      <td><label>
        <input type="text" name="mob_no" id="textfield3" />
      </label></td>
    </tr>
    <tr>
      <th>email-id</th>
      <td><label>
        <input type="text" name="email_id" id="textfield4" />
      </label></td>
    </tr>
    <tr>
      <th>PASSWORD</th>
      <td><label>
        <input type="text" name="password" id="textfield5" />
      </label></td>
    </tr>
    <tr>
      <th>Confirm Password</th>
      <td><label>
        <input type="text" name="confirm_pwd" id="textfield6" />
      </label></td>
    </tr>
    <tr>
      <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       </th>
      <td><label>
        <input type="submit" name="submit" id="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input name="submit" type="button" value="RESET" />
      </label></td>
    </tr>
  </table>
</form>
    
        <%@ include file="common/lbody.jsp" %>

    </body>
</html>
