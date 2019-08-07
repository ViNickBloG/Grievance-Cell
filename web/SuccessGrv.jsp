<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ include file="common/head.jsp" %>

</head>

<body> 

    <%@ include file="common/ubody.jsp" %>
    	
    <div class="successdiv" align="center">
        
        <div class="successdiv-box">
        <div class="successdiv-heading" align="center">
            Your Grievance has been registered successfully.
        
        </div>
        <%
        String user_regd_id=(String)session.getAttribute("user_regd_id");
        String grv_regd_id=(String)session.getAttribute("grv_regd_id");
        String count=(String)session.getAttribute("count");
        %>
        <h4>Your Registration ID (for LOGIN): <%=user_regd_id%> </h4>
        
        <h4> Grievance No : <%=count%> </h4>
        <h4> Grievance Registration ID: <%=grv_regd_id%> </h4>     
        
        <img src="images/Thank_you_pinned_note.png" style="margin-left: 20px" />
        
        <%
        
        %>
        </div>
    </div>  
        
       
   <%@ include file="common/lbody.jsp" %>

</body>
</html>