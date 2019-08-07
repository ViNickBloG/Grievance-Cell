<%-- 
    Document   : RegisterOrganization
    Created on : 9 Apr, 2013, 1:57:30 PM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="javascript/show_block_parent.js"></script>
        
        <script type="text/javascript" >
            function displayBlock(id)
            {
                
                   if(document.getElementById(id).selectedIndex==6)
                  {
                      document.getElementById('blockText').style.display='block';                          
                      document.getElementById('blockLabel').style.display='block';                          
                  }
                  else
                  {
                      document.getElementById('block').selectedIndex=0;                         
                      document.getElementById('blockText').style.display='none';                          
                      document.getElementById('blockLabel').style.display='none';                          
                  }  
            }
            
        </script>
        <%@ include file="common/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        
        <h3><font color="purple"></font></h3>
        <%
            String org_id=request.getParameter("org_id");
            Connection con=new DBConnection().getConnection();
            String sql="select * from org_regd where org_id=?";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, org_id);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                String org_type=rs.getString("org_type");
                String govt_dept=rs.getString("govt_dept");
                String dist=rs.getString("dist");
                String block=rs.getString("block");
                String pincode=rs.getString("pincode");
                String address=rs.getString("address");
                String authority=rs.getString("authority");
                String status=rs.getString("status");
                String contact_no=rs.getString("contact_no");
                String email_id=rs.getString("email_id");
                
            
        %>
        
        
       <form action="UpdateOrganizationDetails" method="post" name="RegisterOrganization" onsubmit="return checkForm(this)">
           <table width="700" border="1" class="table1">
               <tr>
                   <th colspan="3" scope="col">EDIT/VIEW ORGANIZATION DETAILS</th>
                       
               </tr>
  <tr>
    <th colspan="3" scope="col">
        <input type="hidden" name="org_id" id="org_id" value="<%=org_id%>" onfocus="this.blur()"/>
    </th>
    </tr>
  <tr>
    <th width="200">Org. Type</th>
    <td width="350">
        <input type="text" name="org_type" id="org_type" value="<%=org_type%>" onfocus="this.blur()"/>
        </td>
    <td width="150">&nbsp;</td>
  </tr>
  <tr>
    <th width="127">Name of org</th>
    <td width="224">
            <input type="text" name="govt_dept" id="textfield" value="<%=govt_dept%>" />
    </td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr>
    <th>District</th>
    
    <td>
        <input type="text" name="dist" id="dist" value="<%=dist%>" onfocus="this.blur()"/>
        
      
       
        
    </td>
    <td>choose Dist if District Level Organization</td>
  </tr>
  <tr>
    <th>Block</th>
    <td>
        <input type="text" name="block" id="block" value="<%=block%>" onfocus="this.blur()"/>
         
    </td>
    <td>choose Block if Block Level Organization</td>
  </tr>
   <tr>
    <th>Address</th>
    <td><label>
      <textarea name="address" id="textarea"  cols="45" rows="5"><%=address%></textarea>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Pincode</th>
    <td><label>
      <input type="text" name="pincode" value="<%=pincode%>" id="textfield3" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Authority of Org</th>
    <td><label>
      <input type="text" name="authority" id="textfield4" value="<%=authority%>"/>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Status</th>
    <td><label>
      <input name="status" type="radio" id="radio" value="activate" checked="checked" <%if("Activate".equals(status))out.print("checked='true'"); %>/>Activate<input name="status" type="radio" value="deactivate" <%if("Deactivate".equals(status))out.print("checked='true'"); %>/>Deactivate
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Contact No</th>
    <td><label>
      <input type="text" name="contact_no" id="textfield5" value="<%=contact_no%>"/>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>email_id</th>
    <td><label>
      <input type="text" name="email_id" id="textfield6" value="<%=email_id%>"/>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <td><label>
      <input type="Submit" name="submit" id="button" value="UPDATE" />&nbsp;&nbsp;&nbsp;&nbsp;
      <a href="ManageOrganization.jsp">BACK</a>
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
    <%}%>
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
