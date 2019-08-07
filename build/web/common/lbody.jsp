     
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>
</div>
    <div id="sidebar1">
    

            
           <ul>
               
<%
String role=(String)session.getAttribute("role");               
%>
<%if(role==null){%>
             <li> <a href="index.jsp"> Home </a> </li>
<%}%>

             <%if("admin".equals(role)){%>
                
             <%}%>
             
             <%if("pgo".equals(role) && (request.getRequestURI().contains("PgoHome.jsp"))){%>
         
<div id="noticebox">
    <div class="noticehead" align="center">NOTICE</div>
             <!--<marquee direction="up" scroll="3000" onmouseover="this.stop()" onmouseout="this.start()">-->
                  <div class="noticediv">
  
      <marquee direction="up" height="355px" width="237" onmouseover="this.setAttribute('scrollamount', 1, 0);" onmouseout="this.setAttribute('scrollamount', 3, 0);">
  <table width="237"  border="0" class="table11">            
  <%
  Connection con51 = new DBConnection().getConnection(); 
  String sql51="select * from notice where type=?"; 
    PreparedStatement ps51 = con51.prepareStatement(sql51);
    ps51.setString(1, "PGO");
    ResultSet rs51=ps51.executeQuery();
    while (rs51.next())
   {
        String notice_date=rs51.getString("notice_date");
        String notice_no=rs51.getString("notice_no");
        String notice=rs51.getString("notice");
        
    %>
    
        <tr>
            <th>
                Notice No:<%=notice_no%>
            </th>
        </tr>
        <tr>
            <th>
                Notice Date:<%=notice_date%>
            </th>
        </tr>
        <tr>
            <td>
        <div  style="background: url(images/button0.png);height: 20px;width: 237px;"></div>
                <div style="word-break: break-all;width: 137px;">
                    <div  style="background: url(images/button1.png);width: 237px;">
                    <%=notice%>
                    </div>
                </div>
                
                <div style="background: url(images/button2.png);height: 33px;width: 237px;"></div>
            </td>
        </tr>
        <%}%>
    </table>

    
             </marquee>
    
  </div>
    
</div>
    
             <%}%>
             <%if("user".equals(role)){%>
             <h2>Quick Links</h2>

             <li> <a href="UserHome.jsp"> Home </a> </li> 
             <li> <a href="GrievanceRegistration.jsp"> Lodge Grievance </a> </li>
             <li> <a href="UserReminder.jsp"> Reminder </a> </li>
             <li> <a href="UserClarification.jsp"> Clarification </a> </li>
             
             <li> <a href="UserStatusQuery.jsp"> View Action Status </a> </li>
             <li> <a href="UserLetterList.jsp"> View letter </a> </li>
             <li> <a href="Logout.jsp"> Logout </a> </li>
                
             
             <%}%>
            
            
         
            
           </ul>
    
    </div>
	<div class="cleaner"></div>
</div>

<div id="templatemo_footer_wrapper">

	<div id="templatemo_footer">
    
        <div class="col_w270">
        	<h4>About the Site</h4>
          <p>Citizens can lodge their grievances related to Electricity, Water Supply, Sanitation department through this portal. Grievance Redressal Cell-Call Center is a physical place, which works 24X7, where anybody can make telephone calls to 1076 (tollfree number).</p>
        </div>
    	
        <div class="col_w270">
		
        	<h4>Our Pages</h4>
        	<ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="AboutTheSite.jsp">About the site </a></li>
                <li><a href="howitworks.jsp">How it works </a></li>
                
            </ul>  
 
        </div>
        
        <div class="col_w270 col_w270_last">
		
        	<h4>LINKS</h4>
        	<ul>
                <li><a href="#">National Portal Of India </a></li>               
                <li><a href="#">Dipt. of Electricity </a></li>
                <li><a href="#">Dept. of Water Supply </a></li>
		<li><a href="#">Dept. of Sanitation </a></li>
            </ul>    
 
        </div>
        
        <div class="cleaner"></div>
    </div>

</div>

<div id="templatemo_copyright_wrapper">
	<div id="templatemo_copyright">
    
        Copyright @ 2015 Grievance Resolution. <a href="#">KIIT UNIVERSITY</a> | Developed by VIKAS </div>
 
        </div>
</div>