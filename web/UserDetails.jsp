<%-- 
    Document   : UserDetails
    Created on : 7 Dec, 2012, 5:42:15 PM
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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        
    <%
    
    String user_regd_id=request.getParameter("user_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select * from user_regd where user_regd_id=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, user_regd_id);
    ResultSet rs=ps.executeQuery();
    if (rs.next())
   {
        String gender=rs.getString("gender");
        String category=rs.getString("category");
        //String name="";
        String name=rs.getString("name");
        
        String type=rs.getString("type");
        String address=rs.getString("address");
        String pincode=rs.getString("pincode");
        String dist=rs.getString("dist");
        String block=rs.getString("block");
        String panchayat=rs.getString("panchayat");
        String village=rs.getString("village");
        String mobileno=rs.getString("mobileno");
        String emailid=rs.getString("emailid");
        String id_proof=rs.getString("id_proof");
        String id_proof_no=rs.getString("id_proof_no");
        String photo=rs.getString("photo");
        //String target_date=rs.getString("target_date");
       if(photo==null || "".equals(photo.trim()))
        {
            if(gender.equalsIgnoreCase("female"))
                photo="femaleicon.png";
            else
                photo="maleicon.png";            
        } 
    
  %>
        
  <table width="504" height="437" border="1" class="table1">
  <tr>
    <th colspan="3" scope="col">COMPLAINANT'S DETAILS</th>
  </tr>
  <tr>
    <td width="121">NAME:</td>
    <td width="193"><%=name%></td>
    <td width="168" rowspan="16" align="center"> <img src="uploadedfiles/<%=photo%>" width="100" height="100" /></td>
  </tr>
   <tr>
    <td>USER REGD NO:</td>
    <td><%=user_regd_id%></td>
    </tr>
 
  
  <tr>
    <td>GENDER:</td>
    <td><%=gender%></td>
  </tr>
  <tr>
    <td>CATEGORY:</td>
    <td><%=category%></td>
  </tr>
  <tr>
    <td>TYPE:</td>
    <td><%=type%></td>
  </tr>
  <tr>
    <td>ADDRESS:</td>
    <td><%=address%></td>
  </tr>
  <tr>
    <td>PINCODE:</td>
    <td><%=pincode%></td>
  </tr>
  <tr>
    <td>DISTRICT:</td>
    <td><%=dist%></td>
  </tr>
  <tr>
    <td>BLOCK:</td>
    <td><%=block%></td>
  </tr>
  <tr>
    <td>PANCHAYAT:</td>
    <td><%=panchayat%></td>
  </tr>
  <tr>
    <td>VILLAGE:</td>
    <td><%=village%></td>
  </tr>
  <tr>
    <td>MOBILE NO:</td>
    <td><%=mobileno%></td>
  </tr>
  <tr>
    <td>EMAIL-ID:</td>
    <td><%=emailid%></td>
  </tr>
  <tr>
    <td>ID PROOF:</td>
    <td><%=id_proof%></td>
  </tr>
  <tr>
    <td>ID PROOF NO:</td>
    <td><%=id_proof_no%></td>
  </tr>
  <tr>
    <td colspan="2"><label>
            <a href="GrievanceListForUser.jsp?user_regd_id=<%=user_regd_id%>" >List of Grievance Lodged by <%=user_regd_id%>-<%=name%></a>
    </label></td>
  </tr>
</table>
  <%}%>
  
  
    </body>
</html>
