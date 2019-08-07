<div id="templatemo_header">

    <div id="header_left">
        
        <div id="site_title">
            <img src="images/logo_1.png" width="369" height="85" alt="Logo"/>

        </div> <!-- end of site_title -->

    </div>
    
    <div id="header_right">
    
        <div id="templatemo_menu">
            
            <ul id="nav">
                
<%
String role22=(String)session.getAttribute("role");               
%>

<%if(role22==null){%>
             <li> <a href="index.jsp"> Home </a> </li>
             <li><a href="AboutTheSite.jsp">About The Site </a></li>
             <li><a href="howitworks.jsp">How it works </a></li>
             <li class="last"><a href="ContactUs.jsp">Contact Us</a></li>
           
<%}%>
                
            <%if("admin".equals(role22)){%>
                <li> <a href="AdminHome.jsp"> Home </a> </li> 
                <li ><a href="#" >Grievance</a>
                
                    	<ul class="sub">
                             <li> <a href="GrievanceCategory.jsp">GRIEVANCE CATEGORY</a> </li>    
                             <li> <a href="Notice.jsp">NOTICE</a> </li>    
                             <li> <a href="Feedback.jsp">FEEDBACK EVALUATION</a> </li>    
                             <li> <a href="UserList.jsp">USER LIST</a> </li>    
                             <li> <a href="GrievanceAbstract.jsp">GRIEVANCE ABSTRACT</a> </li>    
                            
                        </ul>
                    
             </li>
             <li><a href="#">Manage</a>
                        
                    	<ul class="sub">
                             <li> <a href="RegisterOrganization.jsp">REGISTER ORGANIZATION</a> </li>    
                             <li> <a href="ManageOrganization.jsp">MANAGE ORGANIZATION</a> </li>    
                             <li> <a href="RegisterPgo.jsp">REGISTER PGO</a> </li>    
                             <li> <a href="ManagePgo.jsp">MANAGE PGO</a> </li>
                             <li> <a href="ManagePassword.jsp">CHANGE/RESET PASSWORD</a> </li>

                        </ul>
                </li> 
                <li class="last"><a href="Logout.jsp">Logout</a></li>
             
                
             <%}%>
             
             <%if("pgo".equals(role22)){%>
             <li> <a href="PgoHome.jsp"> Home </a> </li>
             <li ><a href="#" >Grievance</a>
                
                    	<ul class="sub">
                             <li> <a href="NewGrievance.jsp"> NEW </a> </li>    
                             <li> <a href="PendingGrievance.jsp"> PENDING </a> </li>    
                             <li> <a href="DisposedGrievance.jsp"> DISPOSED </a> </li>    
                            
                        </ul>
                    
             </li>
             <li><a href="#">Others</a>
                        
                    	<ul class="sub">
                             <li> <a href="DirectActionTakenGrievance.jsp"> DIRECT ACTION GRIEVANCE </a> </li>    
                             <li> <a href="AllGrievance.jsp"> ALL GRIEVANCE </a> </li>    
                             <li> <a href="ReforwardedGrievance.jsp"> REFORWARDED GRIEVANCE </a> </li>    
                             <li> <a href="ReturnedGrievance.jsp"> RETURNED GRIEVANCE </a> </li>

                        </ul>
                </li>
                <li class="last"><a href="Logout.jsp">Logout</a></li>
                
              <%}%>
              
             <%if("user".equals(role22)){%>

             <li> <a href="UserHome.jsp"> Home </a> </li> 
             <li ><a href="#" >User</a>
                
                    	<ul class="sub">
                             <li> <a href="GrievanceRegistration.jsp"> Lodge Grievance </a> </li>
                             <li> <a href="UserStatusQuery.jsp"> View Action Status </a> </li>
             
                             
                        </ul>
                    
                </li>
                
                
                <li><a href="howitworks.jsp">How it works</a></li>
                <li class="last"><a href="Logout.jsp">Logout</a></li>       
                    	
                                
                
              <%}%>
              
              
                
            </ul>    	
        
        </div> <!-- end of templatemo_menu -->
        
    </div>

    <div class="cleaner"></div>
    
</div>

<div id="templatemo_featured_content_wrapper1">
  <div id="templatemo_featured_content1">
    
    
        
        <table>
          <tr>
		   <td>  <img src="images/content_slider/image6.jpg" width="230" height="153"  /></td>
            <td><img src="images/content_slider/image3.jpg" width="500" height="153" /></td>
           
            <td> <img src="images/content_slider/image5.jpg" width="230" height="153"  /> </td>
          </tr>
        </table>
  </div>
    
</div>
<div id="name-div">
<%
String name555=(String)session.getAttribute("name");
String govt_dept555=(String)session.getAttribute("govt_dept");
String dist555=(String)session.getAttribute("dist");
String block555=(String)session.getAttribute("block");
if(name555==null)
name555="GUEST";      
if(govt_dept555==null)
govt_dept555="";  
else
    govt_dept555="Dept: "+govt_dept555;

if(dist555==null || "".equals(dist555))
dist555="";
else
dist555=" | Dist: "+dist555; 
      
if(block555==null || "".equals(block555) || "0".equals(block555))
block555="";
else
block555=" | Block: "+block555;        
%>
<div class="name">
            
Welcome: <%=name555%>
    
</div>

<div class="dept">&nbsp; <%=govt_dept555%> <%=dist555%> <%=block555%> </div>
<div style="clear: both"> </div>

</div>
<div id="templatemo_content_wrapper">
    
    <div id="content">
    	
       