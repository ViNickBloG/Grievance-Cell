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
         <h3><font color="purple">EDIT/VIEW PGO DETAILS</font></h3>
          
         
         
          <%
            String pgo_regd_id=request.getParameter("pgo_regd_id");
            Connection con=new DBConnection().getConnection();
            String sql="select * from pgo_regd where pgo_regd_id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, pgo_regd_id);
            ResultSet rs= ps.executeQuery();
            if(rs.next())
            {
                String org_id=rs.getString("org_id");
                String pgo_name=rs.getString("pgo_name");
                String gender=rs.getString("gender");
                String dob=rs.getString("dob");
                String designation=rs.getString("designation");
                String pgo_address=rs.getString("pgo_address");
                String photo=rs.getString("photo");
                String mob_no=rs.getString("mob_no");
                String password=rs.getString("password");
                String email_id=rs.getString("email_id");
                String govt_dept=rs.getString("govt_dept");
               
                
                
                String dist="--";
                String block="--";
                String sql2="Select dist,block from org_regd where org_id=?";
     PreparedStatement ps2 = con.prepareStatement(sql2);
    ps2.setString(1, org_id);
    ResultSet rs2=ps2.executeQuery();    
    if (rs2.next())
    {
       
         dist=rs2.getString(1);
         block=rs2.getString(2);
          
    }

                
            
        %>
       
         
        <form action="UpdatePgoDetails1" method="post" onsubmit="return checkForm(this)">
             <input type="hidden" name="pgo_regd_id" id="pgo_regd_id" size="80" value="<%=pgo_regd_id%>" />
     
  <table width="515" border="1" class="table1">
    <tr>
      <th colspan="2" scope="col"></th>
    </tr>
    <tr>
      <td>PGO Registration ID</td>
      <td><label>
        <%=pgo_regd_id%>
      </label></td>
    </tr>
     <tr>
      <td>Organization ID/Organization Name</td>
      <td><label>
        <%=org_id%>-<%=govt_dept%>
      </label></td>
    </tr>
   <tr>
      <td>District</td>
      <td><label>
        <input type="text" name="dist" id="textfield" value="<%=dist%>" onfocus="this.blur()" />
      </label></td>
    </tr>
   <tr>
      <td>Block</td>
      <td><label>
        <input type="text" name="block" id="textfield" value="<%=block%>" onfocus="this.blur()" />
      </label></td>
    </tr>
   
    
   
 
    <tr>
      <td>Name</td>
      <td><label>
        <input type="text" name="pgo_name" id="textfield" value="<%=pgo_name%>" />
      </label></td>
    </tr>
    <tr>
      <td>Gender</td>
      <td><label>
              <input type="radio" name="gender" id="radio" value="male" <%if("Male".equalsIgnoreCase(gender))out.print("checked='true'"); %>/>MALE
          </label><label><input name="gender" type="radio" value="female" <%if("Female".equalsIgnoreCase(gender))out.print("checked='true'"); %>/>FEMALE
      </label></td>
    </tr>
    <tr>
      <td>DOB</td>
      <td> 
          <input name="dob" id="dob" type="text" value="<%=dob%>" placeholder="DOB" size="10" maxlength="10" onfocus="this.blur()"/>
          <a href="javascript:NewCssCal('dob','yyyymmdd')"><img src="jscalendar/cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align:text-bottom"/></a></td>
    </tr>
     
    <tr>
      <td>Designation</td>
      <td><label>
        <input type="text" name="designation" id="textfield2" value="<%=designation%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Address</td>
      <td><label>
        <textarea name="pgo_address" id="textarea" cols="45" rows="5"><%=pgo_address%></textarea>
      </label></td>
    </tr>
    <tr>
      <td>Attach photO</td>
      <td>
          <img src='uploadedfiles/<%=photo%>' width='100' height='100' alt="<%=photo%>" />
          <input name="photo1" id="photo1" type="hidden"  value="<%=photo%>"/>
      <input name="photo" id="photo" type="hidden"/>
      <input id="fileupload" type="file" name="files[]" />
        <label id="imageL"></label></td>
    </tr>
    <tr>
      <td>Mobile No</td>
      <td><label>
        <input type="text" name="mob_no" id="textfield3" value="<%=mob_no%>"/>
      </label></td>
    </tr>
    <tr>
      <td>email-id</td>
      <td><label>
        <input type="text" name="email_id" id="textfield4" value="<%=email_id%>"/>
      </label></td>
    </tr>
    <tr>
      <td>PASSWORD</td>
      <td><label>
        <input type="text" name="password" id="textfield5" value="<%=password%>"/>
      </label></td>
    </tr>
    <tr>
      <td>Confirm Password</td>
      <td><label>
        <input type="text" name="confirm_pwd" id="textfield6" value="<%=password%>"/>
      </label></td>
    </tr>
    <tr>
      <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       </td>
      <td><label>
        <input type="submit" name="submit" id="button" value="UPDATE" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="ManagePgo.jsp">BACK</a>
      </label></td>
    </tr>
  </table>
</form>
      <%}%>
    
        <%@ include file="common/lbody.jsp" %>

    </body>
</html>
