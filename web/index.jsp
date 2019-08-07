<%@page import="grv.cell.beans.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type="text/javascript">
            function bbd()
            {
                window.history.forward();
            }
            setTimeout("bbd()",0);
        </script>
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Grievance Resolution</title>
<meta name="keywords" content="stable business, web design, free templates, website templates, CSS, HTML" />
<meta name="description" content="Stable Business is a free website template provided by templatemo.com" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="content_slider_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery.1.3.2.min.js" ></script>
<script type="text/javascript" src="js/jquery.innerfade.js" ></script>
<script type="text/javascript" src="js/jquery-ui.min.js" ></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#featured > ul").tabs({fx:{opacity: "toggle"}}).tabs("rotate", 3000, true);
	});
        
        $(document).ready(function() {
 	 
	$('#site_title').innerfade({
		//animationtype: 'slide',
		speed: 'slow',
		timeout: 5000,
		type: 'sequence',
		containerheight: '70px'
	});
	
 	 
	
	
});
</script>

<style type="text/css">
<!--
.style1 {color: #fff}
-->
.colstyle{
    background-color: cadetblue;
    border-radius: 6px;
    color: #fff;
}

.colstyle img{
    border-radius: 6px;
}
.colstyle a{
 color: #fff;   
}
</style>
</head>
<body onload="bbd()" onunload="bbd()"> 

<div id="templatemo_header">

    <div id="header_left">
        
        <div id="site_title">
           
           
           <img src="images/logo_1.png" width="380" height="72" alt="Logo"/>
        <!-- end of site_title -->

    </div>
    
    <div id="header_right">
    
        <div id="templatemo_menu">
            
            <ul>
                <li><a href="index.jsp" class="current">Home</a></li>
                <li><a href="AboutTheSite.jsp">About The Site </a></li>
                <li><a href="howitworks.jsp">How it works </a></li>
                <li class="last"><a href="ContactUs.jsp">Contact Us</a></li>
            </ul>    	
        
        </div> <!-- end of templatemo_menu -->
        
    </div>

    <div class="cleaner"></div>
</div>

<div id="templatemo_featured_content_wrapper">
	<div id="templatemo_featured_content">
    
		<div id="featured">
			<ul class="ui-tabs-nav">
				<li class="ui-tabs-nav-item" id="nav-fragment-1"><a href="#fragment-2"><img src="images/content_slider/image2-small.jpg" alt="Image 2" /><span> QUICK FEEDBACK RESPONSE</span></a></li>
				<li class="ui-tabs-nav-item" id="nav-fragment-2"><a href="#fragment-3"><img src="images/content_slider/image3-small.jpg" alt="Image 3" /><span>DIRECT BENEFIT TO THE COMMON CITIZEN</span></a></li>
				<li class="ui-tabs-nav-item" id="nav-fragment-3"><a href="#fragment-4"><img src="images/content_slider/image4-small.jpg" alt="Image 4" /><span>24X7 HELPLINE FOR CITIZENS ANYTIME ANYWHERE</span></a></li>
			</ul>

			

			<!-- Second Content -->
			<div id="fragment-1" class="ui-tabs-panel ui-tabs-hide" style="">
				<img src="images/content_slider/image2.jpg" alt="Image 2" />
				<div class="info">
					<h2><a href="#">QUICK FEEDBACK RESPONSE</a></h2>
					<p>Grievance Resolution provides the facility to lodge the grievances any time any where<a href="#" >read more</a></p>
				</div>
			</div>

			<!-- Third Content -->
			<div id="fragment-2" class="ui-tabs-panel ui-tabs-hide" style="">
				<img src="images/content_slider/image3.jpg" alt="Image 3" />
				<div class="info">
					<h2><a href="#">TRANSPARENT--ACCOUNTABLE--ACCESSIBLE </a></h2>
					<p>Paperless processing of grievances as per internal work flow of the organization<a href="#" >read more</a></p>
				</div>
			</div>

			<!-- Fourth Content -->
			<div id="fragment-3" class="ui-tabs-panel ui-tabs-hide" style="">
				<img src="images/content_slider/image4.jpg" alt="Image 4" />
				<div class="info">
					<h2><a href="#">24X7 HELPLINE FOR CITIZENS ANYTIME ANYWHERE</a></h2>
					<p>An integrated work flow application system,based on web technology which primarily aims at submission of grievances by the aggrieved citizens 24 X 7 basis<a href="#" >read more</a></p>
				</div>
			</div>
    
		</div>
		
	</div>
	
</div>

<div id="templatemo_content_wrapper">
	
    <div id="content_wo_sb">
    	
        <div class="col_w270 colstyle" style="width: 200px">
       
            <div class="heading1" align="center"> Contact </div>
            
           
           
            <div style="float: left;display: block;margin-top: 20px;">
                <img src="images/info.jpg" width="200" height="302" />
            </div>
            <div class="cleaner"></div>
      </div>
      <div class="col_w270 colstyle">
          
            
                <div class="image_wrapper"><img src="images/content_slider/image5.jpg" width="252" height="110" /></div>
                
      
                  <h2>Basic Services</h2>
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td height="20"><ul>
                  <li><span class="style1">Electricity </span></li>
                </ul></td>
              </tr>
              <tr>
                <td height="20"><ul>
                  <li><span class="style1">Water Supply</span></li>
                </ul></td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="20"><ul>
                  <li><span class="style1">Safe Drinking water</span></li>
                </ul></td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="20"><ul>
                  <li><span class="style1">Sanitation </span></li>
                </ul></td>
                <td height="20">&nbsp;</td>
              </tr>
              <tr>
                <td height="20"><ul>
                  <li><span class="style1">Environment protection </span></li>
                </ul></td>
                <td height="20">&nbsp;</td>
              </tr>
            
          </table>
                
                
                </div>
        
        <div class="col_w270 col_w270_last" style="margin-top: -25px" >
        
            <div class="col_w270" style="background: none">     
                 
<form  method="post" action="UserLogin" >
    <%
    String status=(String)request.getAttribute("status");
    if(status!=null)
    {
    %>
    <h5 style="color: red;"> <%=status%> </h5>
    <%}%>
   
    <div style="background: url(images/login-box-backg_2.png); width: 298px; height: 238px;">
   
        <table width="266" border="0" style="margin: 10px 0px 0px 16px;padding-top: 15px;color:#fff;"> 

  <tr>
    <th colspan="3" scope="col" bgcolor="#66CCFF">USER LOG IN</th>
    </tr>
    
  <tr>
    <td width="176">User Regd.Id</td>  
    <td width="315"><input type="text" name="user_regd_id" size="25" maxlength="20"/></td>
  </tr>
  <tr>
    <td>User Password</td>
        <td><input type="password" name="password" size="25" maxlength="15" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="submit" type="submit" value="Submit" /></td>
    </tr>
    
    <tr>
    <td colspan="2">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<a href="forgetPassword.jsp"> Forgot Password?</a>    </td>
    </tr>
  
  <tr>
      <td colspan="2">&nbsp;Are you a new User?  <a href="UserRegistration.jsp">REGISTER</a></td>
    </tr>
 </table>
    
       
    
            </div>
    
</form>
 
    
	
    <div class="sb_news_box" style="margin-top: -20px;">
                <%
    String status1=(String)request.getAttribute("status1");
    if(status1!=null)
    {
    %>
    <h5 style="color: red;"> <%=status1%> </h5>
    <%}%>
			 <form action="PGOLogin" method="post" name="PGOLogin">
 <div style="background: url(images/login-box-backg_2.png); width: 298px; height: 238px;">
                               
  <table width="266" border="0" style="margin: 10px 0px 0px 16px;padding-top: 15px;color:#fff;">
  <tr>
    <th colspan="3" scope="col" bgcolor="#66CCFF">PGO LOG IN</th>
    </tr>
    
  <tr>
    <td width="176">PGO Regd Id</td>  
    <td width="300"><input type="text" name="pgo_regd_id" size="25" maxlength="20"/></td>
  </tr>
  <tr>
    <td>PGO Password</td>
        <td><input type="password" name="password" size="25" maxlength="15" /></td>
  </tr>
  <tr>
  <td>&nbsp;</td>
    <td>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; <input name="submit" type="submit" value="Submit" /></td>
  </tr>
   
  <th colspan="2"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="AdminLogin.jsp"> ADMIN LOG IN</a>
  </th>
    <tr>
        <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="GuestFeedback.jsp"> FEEDBACK AND SUGGESTION</a>
 </td>
    </tr>
    
</table>

 </div>
</form>

              <div class="cleaner"></div>
          </div>
                         
            </div>              
                         
            <div class="sb_news_box">
              <div class="cleaner"></div>
            </div>
                         
                         
            
      </div>
        <div class="cleaner"></div>
        
    </div>

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
    
        Copyright @ 2015 Grievance Resolution. <a href="#">KIIT UNIVERSITY</a> | Developed by VICKY </div>
</div>

</body>
</html>