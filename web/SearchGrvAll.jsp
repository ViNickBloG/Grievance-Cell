<%-- 
    Document   : AllGrievance
    Created on : 10 Dec, 2012, 4:22:34 PM
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
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">ALL GRIEVANCE</font></h2>
    <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
        <form action="SearchGrvAll.jsp" name="SearchGrvAll" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
        
        <table width="700" height="139" border="1" class="table1">
  <tr>
    <th height="73" scope="col">GRIEVANCE <br />
    REGISTARTION ID</th>
    <th scope="col">DATE OF<br />
    REGISTRATION</th>
    <th scope="col">TARGET DATE</th>
    <th scope="col">DATE OF DISPOSAL</th>
    <th scope="col">USER REGD ID</th>
    
    <th scope="col">NAME OF COMPLAINANT</th>
    <th scope="col">STATUS</th>
    <th scope="col">direct/forwarded</th>
    <th scope="col">GRIEVANCE FLOW STATUS</th>
    <th scope="col">PGO REGD ID</th>
    <th scope="col">PGO NAME</th>
    <th scope="col">ORG ID</th>
    
  </tr>
  <%
   String search=request.getParameter("grv_regd_id");
   String current_pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
   String org_id=(String)session.getAttribute("org_id");
 Connection con = new DBConnection().getConnection();   
    
  String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where org_id=? and gr.grv_regd_id=?";
       PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, org_id);
     ps.setString(2, search);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps+"##############");
    
     ResultSet rs=ps.executeQuery();
     int record=0;
                            while (rs.next())
                            {
                                record++;
                                String grv_regd_id=rs.getString("grv_regd_id");
                                
                                String user_regd_id=rs.getString("user_regd_id");
                                String regd_date=rs.getString("regd_date");
                                String target_date=rs.getString("target_date");
                                if(target_date==null)
                                target_date="";
                                String grv_status=rs.getString("grv_status");
                                String name=rs.getString("name");
                                String pgo_regd_id=rs.getString("pgo_regd_id");
                                String pgo_name="";
                                String disposal_date="not disposed";
                                
      if(grv_status.equals("Disposed")){                          
   
    String sql1="select dp.disposal_date,pr.pgo_name from grv_disposed dp join pgo_regd pr on(dp.disposed_by=pr.pgo_regd_id) where dp.grv_regd_id=? and pr.org_id=? and pr.pgo_regd_id=? and dp.disposed_by=? and (disposal_type='no action' or disposal_type='transfered' or disposal_type='Direct')";
       PreparedStatement ps1 = con.prepareStatement(sql1);
     ps1.setString(1, grv_regd_id);
     ps1.setString(2, org_id);
     ps1.setString(3, pgo_regd_id);
     ps1.setString(4, pgo_regd_id);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps1+"##############");
    
     ResultSet rs1=ps1.executeQuery();
        if (rs1.next())
        {
            pgo_name=rs1.getString("pgo_name");

            disposal_date=rs1.getString("disposal_date");
                                                                                              
        }
      }
                              
     %>
  
  <tr>
    <td height="26"><%=grv_regd_id%></td>
    <td><%=regd_date%></td>
    <td><%=target_date%></td>
    <td><%=disposal_date%></td>
    <td><%=user_regd_id%></td>
    <td><%=name%></td>
    <td><%=grv_status%></td>
    <td>direct</td>
    <td>&nbsp;</td>
    <td><%=pgo_regd_id%></td>
    <td><%=pgo_name%></td>
    <td><%=org_id%></td>
    
    
    
    
  </tr>
  <%}%>
  

  <tr>
    <td colspan="1">NO OF RECORDS:</td>
    <td colspan="11"><%=record%></td>
  </tr>
</table>
        
<%@ include file="common/lbody.jsp" %>
<%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
