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
          <!-- START Fancy Box -->
	<!--<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>-->

	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="fancy/jquery.fancybox.js?v=2.1.4"></script>
	<link rel="stylesheet" type="text/css" href="fancy/jquery.fancybox.css?v=2.1.4" media="screen" />
        <script type="text/javascript">
            $(document).ready(function() {

                    $('.various').fancybox();
            });
        </script>        
        <!-- END Fancy Box -->
     
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
<style>
.slide-out-div{

height: 170px;

}
.table1 th{
    padding: 0;
    margin: 0;
}
.table1 td{
    padding: 0;
    margin: 0;
}
</style>
        
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
        <h2><font color="purple">ALL GRIEVANCE</font></h2>
    <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">    <form action="SearchGrvAll.jsp" name="SearchGrvAll" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
       <input name="submit" type="submit" value="" class="searchbtn"/>
         
        </form>

    </div>
        
    <table width="700" height="139" border="1" class="table1" align="left">
  <tr>
    <th height="73" scope="col">GRIEVANCE <br />
    REGD. ID</th>
    <th scope="col">DATE OF<br />
    REGD.</th>
    <th scope="col">TARGET DATE</th>
    <th scope="col">DATE OF DISPOSAL</th>
    <th scope="col">USER REGD ID</th>
    
    <th scope="col">NAME OF COMPLAINANT</th>
    <th scope="col">STATUS</th>
    <th scope="col">Direct/<br/>Forwarded</th>
    <th scope="col">GRIEVANCE FLOW STATUS</th>
    <th scope="col">PGO REGD ID</th>
    <th scope="col">PGO NAME</th>
    <th scope="col">ORG ID</th>
    
  </tr>
  <%
    int record=0;
  String ctype=request.getParameter("ctype");
  
   String current_pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
   String org_id=(String)session.getAttribute("org_id");
 Connection con = new DBConnection().getConnection();   
    
 boolean flag1=true;
if(ctype!=null && (ctype.equalsIgnoreCase("forg") || ctype.equalsIgnoreCase("fpgo")))
{
    flag1=false;
}
if(flag1)
{
  String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) where org_id=?";
       PreparedStatement ps = con.prepareStatement(sql);
     ps.setString(1, org_id);
     System.out.println("%%%%%%%%%%%%%%%%%%%%%"+ps+"##############");
    
     ResultSet rs=ps.executeQuery();
   
                            while (rs.next())
                            {
                                
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
                                
       if(ctype!=null && ctype.equalsIgnoreCase("dfpgo") && !pgo_regd_id.equalsIgnoreCase(current_pgo_regd_id))
       {
            continue;
       }
       else if(ctype!=null && ctype.equalsIgnoreCase("dpgo") && !pgo_regd_id.equalsIgnoreCase(current_pgo_regd_id))
       {
            continue;
       }
       
       record++;
                                
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
    <td><a href="NewGrievanceFlowStatus.jsp?grv_regd_id=<%=grv_regd_id%>" class="various fancybox.ajax">SHOW</a></td>
    <td><%=pgo_regd_id%></td>
    <td><%=pgo_name%></td>
    <td><%=org_id%></td>
    
    
    
    
  </tr>
  <%}
 }  
   %>
  
  <%
 
  
}
  record2=record+record1;
%>
  
  <tr>
    <td colspan="1">NO OF RECORDS:</td>
    <td colspan="11"><%=record2%></td>
  </tr>
</table>
        
<%@ include file="common/lbody.jsp" %>

    <%@ include file="floatmenu0.jsp" %>
    
    <div class="slide-out-div">
            <a class="handle" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                    <li> <a href="AllGrievance.jsp?ctype=dforg"> Direct and Forward (ORG) </a> </li>
                    <li> <a href="AllGrievance.jsp?ctype=dfpgo"> Direct and Forward (PGO) </a> </li>
                    <li> <a href="AllGrievance.jsp?ctype=dorg"> Direct (ORG) </a> </li>
                    <li> <a href="AllGrievance.jsp?ctype=dpgo"> Direct (PGO) </a> </li>
                    <li> <a href="AllGrievance.jsp?ctype=forg"> Forward (ORG) </a> </li>
                    <li> <a href="AllGrievance.jsp?ctype=fpgo"> Forward (PGO) </a> </li>
                     </ul>
            </div>   
		   
        </div>
    </body>
</html>
