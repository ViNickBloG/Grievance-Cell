<%-- 
    Document   : DirectActionTakenGrievance
    Created on : 10 Dec, 2012, 3:49:36 PM
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
        <%
    String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: green;"> <%=status%> </h5>
    <%}%>
    
    <h2><font color="purple">DIRECT ACTION GRIEVANCE</font></h2>
    <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">
        <form action="SearchGrvDirect.jsp" name="SearchGrvDirect" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
       <input name="submit" type="submit" value="" class="searchbtn"/>
         
        </form>

        </div>
        
        
        <table width="504" height="185" border="1" class="table1">
  <tr>
    <th height="73" scope="col">GRIEVANCE <br />
    REGISTARTION NO</th>
    <th scope="col">DATE OF<br />
    REGISTRATION</th>
    <th scope="col">DATE OF DISPOSAL</th>
    <th scope="col">TYPE OF DISPOSAL</th>
    <th scope="col">REMARKS</th>
    <th scope="col">NOTES</th>
    <th scope="col">LOCAL FILE NO</th>
    <th scope="col">DEALING OFFICER'S NAME</th>
  </tr>
  <%
   String ctype=request.getParameter("ctype");
 
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,dp.*,da.* from grv_regd gr join grv_disposed dp on(gr.grv_regd_id=dp.grv_regd_id)join direct_action da on(gr.grv_regd_id=da.grv_regd_id) where dp.status='Disposed' and gr.direct_action='Yes' and disposed_by=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    System.out.println("xxxxxxx"+ps+"xxxxxxxxxx");
    ResultSet rs=ps.executeQuery();
    
    int record=0;
    while (rs.next())
   {
        String grv_regd_id=rs.getString("grv_regd_id");
        String regd_date=rs.getString("regd_date");
        String disposal_date=rs.getString("disposal_date");
        String disposal_type=rs.getString("disposal_type");
        String directaction_remarks=rs.getString("directaction_remarks");
        String notes=rs.getString("notes");
        String local_file_no=rs.getString("local_file_no");
        String dealing_officer=rs.getString("dealing_officer");
        
         if(ctype!=null && ctype.equalsIgnoreCase("Direct") && !disposal_type.equalsIgnoreCase(ctype))
       {
            continue;
       }  
       else if(ctype!=null && ctype.equalsIgnoreCase("noaction") && !disposal_type.equalsIgnoreCase("no action"))
       {
            continue;
       }
       
     record++;
        
        
    
  %>
  
  <tr>
    <td height="26"><a href="DirectActionTakenGrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></td>
    
    <td><%=regd_date%></td>
    <td><%=disposal_date%></td>
    <td><%=disposal_type%></td>
    <td><%=directaction_remarks%></td>
    <td><%=notes%></td>
    <td><%=local_file_no%></td>
    <td><%=dealing_officer%></td>
  </tr>
  <%}%>
  <tr>
    <td colspan="1"><div align="right">NO OF RECORDS:</div></td>
    <td><%=record%></td>
    <td colspan="6">&nbsp;</td>
  </tr>
</table>

    <%@ include file="common/lbody.jsp" %>
   
    <%@ include file="floatmenu0.jsp" %>
    
    <div class="slide-out-div">
            <a class="handle" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                    <li> <a href="DirectActionTakenGrievance.jsp?ctype=all"> All </a> </li>
                  
                    <li> <a href="DirectActionTakenGrievance.jsp?ctype=direct"> Direct </a> </li>
                    <li> <a href="DirectActionTakenGrievance.jsp?ctype=noaction"> No Action </a> </li>
                      </ul>
            </div>   
		   
        </div>
  
    </body>
</html>
