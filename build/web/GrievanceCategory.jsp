<%-- 
    Document   : GrievanceCategory
    Created on : 9 Apr, 2013, 1:58:01 PM
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
        <%@ include file="common/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <form action="GrievanceCategory" method="post">
  <table width="600" height="240" border="1" class="table1">
    <tr>
      <th height="23" colspan="4" scope="col">Grievance Category</th>
    </tr>
    <tr>
      <td height="10">&nbsp;</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <th width="116" height="36">Add new category:</th>
      <td colspan="3"><label>
        <input type="text" name="grv_category" id="textfield" />
      </label></td>
    </tr>
    <tr>
      <th width="116" height="36">Dept:</th>
      <td colspan="3"><label>
         <select name="org_id" id="org_id" >
              <option value="0">Select</option>
    <%
  
   Connection con=new DBConnection().getConnection();
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
        
      </label></td>
    </tr>
    <tr>
      <td height="10">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;<input type="submit" name="button" id="button" value="ADD" /></td>
    </tr>
    <tr>
      <th height="39">**************</th>
      <th width="268"><strong>LIST OF GRIEVANCE CATEGORIES</strong></th>
      <th width="82">**********</th>
      <th width="82">**********</th>
    </tr>
    <tr>
      <td height="4">&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    
    <tr>
      <th height="23">SRL.NO</th>
      <th>CATEGORY NAME</th>
      <th>ORG ID</th>
      <th>DELETE</th>
    </tr>
    <%
  
  
    //Connection con = new DBConnection().getConnection();   
    String sql="select * from grv_category";
    PreparedStatement ps = con.prepareStatement(sql);
    
    ResultSet rs=ps.executeQuery();
   
    while (rs.next())
    {
     
        String grv_category_id=rs.getString("grv_category_id");
        String category_name=rs.getString("category_name");
        String org_id=rs.getString("org_id");
       
            
  %>
    <tr>
      <td height="41"><%=grv_category_id%></td>
      <td><%=category_name%></td>
      <td><%=org_id%></td>
      <td><a href="DeleteGrvCategory?id=<%=grv_category_id %>">DEL </a></td>
    </tr>
    <%}%>
  </table>
      
</form>
         <%@ include file="common/lbody.jsp" %>
    </body>
</html>
