     
    </div>
    <div id="sidebar1">
    
<h2>Quick Links</h2>
            
           <ul>
               
<%
String role=(String)session.getAttribute("role");               
%>
<%if(role==null){%>
             <li> <a href="index.jsp"> Home </a> </li>
<%}%>

             <%if("admin".equals(role)){%>
                <li> <a href="AdminHome.jsp"> Home </a> </li>
                <li> <a href="Logout.jsp"> Logout </a> </li>
               
             <%}%>
             
             <%if("pgo".equals(role)){%>
             <li> <a href="PgoHome.jsp"> Home </a> </li>
             <li> <a href="NewGrievance.jsp"> New Grievance </a> </li>    
             <li> <a href="PendingGrievance.jsp"> Pending grievance </a> </li>    
             <li> <a href="DisposedGrievance.jsp"> Disposed Grievance </a> </li>    
             <li> <a href="DirectActionTakenGrievance.jsp"> Direct Action Grievance </a> </li>    
             <li> <a href="AllGrievance.jsp"> All Grievance </a> </li>    
             <li> <a href="CaseReportReceivedList.jsp"> Case Report Received</a> </li>    
             <li> <a href="PgoReminder.jsp"> Reminders </a> </li>    
             <li> <a href="PgoClarification.jsp"> Clarifications </a> </li>    
             <li> <a href="ReforwardedGrievance.jsp"> Reforwarded Grievance </a> </li>    
             <li> <a href="ReturnedGrievance.jsp"> Returned Grievance </a> </li>
             <li> <a href="PgoLetterList.jsp"> Correspondence Letter </a> </li>
             <li> <a href="Logout.jsp"> Logout </a> </li>
            
                
             <%}%>
             <%if("user".equals(role)){%>

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
          <p>Citizens can lodge their grievances related to Panchayati Raj department in Government of Odisha through this portal. Grievance Redressal Cell-Call Center is a physical place, which works 24X7, where anybody can make telephone calls to 1076 (tollfree number) and can give their complaints to Panchayati Raj department's Call Center.<a href="about.html">More...</a></p>
        </div>
    	
        <div class="col_w270">
		
        	<h4>Our Pages</h4>
        	<ul>
                <li><a href="index.html">Home</a></li>
                <li><a href="AboutTheSite.jsp">About the site </a></li>
                <li><a href="howitworks.jsp">How it works </a></li>
                <li><a href="#" class="last">Statistics</a></li>
                <li><a href="#" class="last">Demo</a></li>
            </ul>  
 
        </div>
        
        <div class="col_w270 col_w270_last">
		
        	<h4>LINKS</h4>
        	<ul>
                <li><a href="#">National Portal Of India </a></li>
                <li><a href="#">Govt. of Odisha </a></li>
                <li><a href="#">Dist. Portal </a></li>
                <li><a href="#">Dept. of Panchayati raj </a></li>
				<li><a href="#">Chief Minister's Office </a></li>
            </ul>    
 
        </div>
        
        <div class="cleaner"></div>
    </div>

</div>

<div id="templatemo_copyright_wrapper">
	<div id="templatemo_copyright">
    
        Copyright © 2012 e-Grievance Cell. <a href="#">KIIT UNIVERSITY</a> | Developed by <a href="http://www.templatemo.com" target="_parent">Vicky,</a>
    
    VIKAS
        </div>
</div>