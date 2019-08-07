<%-- 
    Document   : ReforwardedGrievance
    Created on : 26 Apr, 2013, 7:59:30 AM
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
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">REFORWARDED GRIEVANCE</font></h2>
     <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">    <form action="SearchGrvReforward.jsp" name="SearchGrvReforward" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
        
        <table width="600" height="50" border="1" class="table1">
  <tr>
    <th width="100">DATE OF REFORWARDING</td>
    <th width="100">DATE OF RETURN</td>
    <th width="100">DATE OF REGISTRATION</td>
    <th width="100">TARGET DATE</td>
    <th width="100"> GRIEVANCE REGISTRATION NO</td>
    <th width="100">NAME OF COMPLAINANT</td>
  </tr>
  <%
   String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
 Connection con = new DBConnection().getConnection();   
    
  String sql3="select * from reforward_grv where pgo_regd_id=?";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, pgo_regd_id);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps3+"##############");
    
     ResultSet rs3=ps3.executeQuery();
                            while (rs3.next())
                            {
                                //String pgo_name=rs3.getString("pgo_name");
                                //String designation=rs3.getString("designation");
                                String return_date=rs3.getString("return_date");
                                String regd_date=rs3.getString("regd_date");
                                String target_date=rs3.getString("target_date");
                                String reforward_date=rs3.getString("reforward_date");
                                String grv_regd_id=rs3.getString("grv_regd_id");
                                String name=rs3.getString("name");
                                
     %>
  <tr>
    <td><%=reforward_date%></td>
    <td><%=return_date%></td>
    <td><%=regd_date%></td>
    <td><%=target_date%></td>
    <td><%=grv_regd_id%></td>
    <td><%=name%></td>
    
  </tr>
  <%}%>
  
</table>
        <%@ include file="common/lbody.jsp" %>
        <%@ include file="floatmenu2.jsp" %>
  

    </body>
</html>
