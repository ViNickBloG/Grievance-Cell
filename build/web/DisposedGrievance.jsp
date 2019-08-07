<%-- 
    Document   : DisposedGrievance
    Created on : 9 Dec, 2012, 11:18:35 PM
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
</style>

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
   <h2><font color="purple">DISPOSED GRIEVANCE</font></h2>
    <div style="margin-top: -50px;margin-left: 500px;width: 200px;float: left">     <form action="SearchGrvDisposed.jsp" name="SearchGrvDisposed" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
        <input name="submit" type="submit" value="" class="searchbtn"/>
        
        </form>

        </div>
        
        <table width="504" border="1" class="table1">
            <thead>
  <tr>
    <th height="73" scope="col">GRIEVANCE <br />
    REGISTARTION NO</th>
    <th scope="col">DATE OF<br />
    REGISTRATION</th>
    <th scope="col">DATE OF DISPOSAL</th>
    <th scope="col">TYPE OF DISPOSAL</th>
    <th scope="col">VIEW GRIEVANCE FLOW STATUS</th>
    <th scope="col">SEND LETTER</th>
    <th scope="col">TARGET DATE</th>
    <th scope="col">INDICATOR</th>
  </tr>
            </thead>
  <%
  String ctype=request.getParameter("ctype");
  
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
    Connection con = new DBConnection().getConnection();   
    String sql="select gr.*,dp.* from grv_regd gr join grv_disposed dp on(gr.grv_regd_id=dp.grv_regd_id) where dp.status='Disposed' and disposed_by=?  ";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    int record=0;
    int cqcount=0;
    int lcount=0;
    int letter_not_sent=0;
    while (rs.next())
   {
        String grv_regd_id=rs.getString("grv_regd_id");
        String regd_date=rs.getString("regd_date");
        String disposal_date=rs.getString("disposal_date");
        String disposal_type=rs.getString("disposal_type");
        String target_date=rs.getString("target_date");
        if(target_date==null)
            target_date="-";
        
       if(ctype!=null && ctype.equalsIgnoreCase("Direct") && !disposal_type.equalsIgnoreCase(ctype))
       {
            continue;
       }  
       else if(ctype!=null && ctype.equalsIgnoreCase("transfered") && !disposal_type.equalsIgnoreCase(ctype))
       {
            continue;
       }
       else if(ctype!=null && ctype.equalsIgnoreCase("noaction") && !disposal_type.equalsIgnoreCase("no action"))
       {
            continue;
       }
       else if(ctype!=null && ctype.equalsIgnoreCase("passed") && !disposal_type.equalsIgnoreCase("passed_report"))
       {
            continue;
       }
       else if(ctype!=null && ctype.equalsIgnoreCase("sent") && !disposal_type.equalsIgnoreCase("sent_report"))
       {
            continue;
       }
  
      record++;
               
          String sql8="select count(*) from clarification_box where sent_to_pgo=? and grv_regd_id=? and indicator=0";
           PreparedStatement ps8 = con.prepareStatement(sql8);
            ps8.setString(1, pgo_regd_id);
            ps8.setString(2, grv_regd_id);
            ResultSet rs8=ps8.executeQuery();
            if(rs8.next())
            {
                cqcount=rs8.getInt(1);
            }

            
            
            String sql80="select count(*) from user_letter where pgo_regd_id=? and grv_regd_id=? and type=?";
           PreparedStatement ps80 = con.prepareStatement(sql80);
            ps80.setString(1, pgo_regd_id);
            ps80.setString(2, grv_regd_id);
            ps80.setString(3, "final letter");
            ResultSet rs80=ps80.executeQuery();
            if(rs80.next())
            {
                lcount=rs80.getInt(1);
            }

    
  %>
  
  <tr>
    <td height="26"><a href="DisposedGrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>"><%=grv_regd_id%></td>
    <td><%=regd_date%></td>
    <td><%=disposal_date%></td>
    <td><%=disposal_type%></td>
    <td><label>
        <h3><font color="purple"><a href="NewGrievanceFlowStatus.jsp?grv_regd_id=<%=grv_regd_id%>" class="various fancybox.ajax">SHOW</a></font></h3>
 
    </label></td>
    <%
        if(disposal_type.equals("passed_report")  || disposal_type.equals("sent_report") ){
    %>
    <td>&nbsp;</td>
    <%   
        }
           else{
    %>
    <td><a href="PgoWriteFinalLetter.jsp?grv_regd_id=<%=grv_regd_id%>">SEND</a></td>
    <%}%>
    <td><%=target_date%></td>
    <td>
        <%if(cqcount>0){%>
        <a href="PgoClarificationReceived.jsp">
            <img src="icons/question1.jpg" width="40" height="40" title="<%=cqcount%>  question received" />
        </a>
        <%}%>
        <%if(lcount>0){%>
        <img src="icons/lettersent.jpg" width="40" height="40" title="<%=lcount%>  LETTER SENT" />
        
        <%}else{%>
        <img src="icons/letternotsent.jpg" width="40" height="40" title="LETTER NOT SENT" />
        
        <%}%>
        
    
    </td>
  </tr>
  <%}%>
  <tr>
    <td colspan="1">NO OF RECORDS:</td>
   
    <td colspan="7"><%=record%></td>
  </tr>
</table>

    <%@ include file="common/lbody.jsp" %>
    
    <%@ include file="floatmenu0.jsp" %>
    
    <div class="slide-out-div">
            <a class="handle" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                    <li> <a href="DisposedGrievance.jsp?ctype=all"> All </a> </li>
                    <li> <a href="DisposedGrievance.jsp?ctype=direct"> Direct Disposal </a> </li>
                    <li> <a href="DisposedGrievance.jsp?ctype=transfered"> Transfered Disposal </a> </li>
                    <li> <a href="DisposedGrievance.jsp?ctype=noaction"> No Action Disposal </a> </li>
                    <li> <a href="DisposedGrievance.jsp?ctype=passed"> Passed Disposal </a> </li>
                    <li> <a href="DisposedGrievance.jsp?ctype=sent"> Sent Disposal </a> </li>
                     </ul>
            </div>   
		   
        </div>
    </body>
</html>
