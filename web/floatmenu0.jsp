
 <!-- Float Menu -->  
    
   <!--
<script src="js/jquery.tabSlideOut.v1.3.js"></script>
-->
    <script type="text/javascript">
      
    $(function(){
        $('.slide-out-div').tabSlideOut({
            tabHandle: '.handle',                     //class of the element that will become your tab
            pathToTabImage: 'images/category.png', //path to the image for the tab //Optionally can be set using css
            imageHeight: '150px',                     //height of tab image           //Optionally can be set using css
            imageWidth: '44px',                       //width of tab image            //Optionally can be set using css
            tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left
            speed: 300,                               //speed of animation
            action: 'click',                          //options: 'click' or 'hover', action to trigger animation
            topPos: '300px',                          //position from the top/ use if tabLocation is left or right
            leftPos: '20px',                          //position from left/ use if tabLocation is bottom or top
            fixedPosition: true                      //options: true makes it stick(fixed position) on scroll
        });	
				
    });
    
    $(function(){
        $('.slide-out-div2').tabSlideOut({
            tabHandle: '.handle2',                     //class of the element that will become your tab
            pathToTabImage: 'images/utilities.png', //path to the image for the tab //Optionally can be set using css
            imageHeight: '150px',                     //height of tab image           //Optionally can be set using css
            imageWidth: '44px',                       //width of tab image            //Optionally can be set using css
            tabLocation: 'left',                      //side of screen where tab lives, top, right, bottom, or left
            speed: 300,                               //speed of animation
            action: 'click',                          //options: 'click' or 'hover', action to trigger animation
            topPos: '452px',                          //position from the top/ use if tabLocation is left or right
            leftPos: '20px',                          //position from left/ use if tabLocation is bottom or top
            fixedPosition: true                      //options: true makes it stick(fixed position) on scroll
        });	
				
    });

	
	
    </script>
	
    <!--
	<div class="slide-out-div">
            <a class="handle" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                    <li> <a href="PendingGrievance.jsp?ctype=all"> All </a> </li>
                    <li> <a href="PendingGrievance.jsp?ctype=examine"> Examine at Our Level  </a> </li>
                    <li> <a href="PendingGrievance.jsp?ctype=forwarded"> Forwarded to Subordinate Organisation </a> </li>
                </ul>
            </div>   
		   
        </div>
    -->
    
    
	<div class="slide-out-div2">
            <a class="handle2" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                     <li> <a href="PgoReminder.jsp"> Reminders </a> </li>    
                     <li> <a href="PgoClarification.jsp"> Clarifications </a> </li>
                     <li> <a href="CaseReportReceivedList.jsp"> Case Report Received</a> </li>    
                     <li> <a href="PgoLetterList.jsp"> Correspondence Letter </a> </li>
            
                </ul>
            </div>
		   
		   
        </div>
	
    <!-- / Float Menu -->
    