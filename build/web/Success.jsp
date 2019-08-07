<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<%@ include file="common/head.jsp" %>

</head>

<body> 

    <%@ include file="common/ubody.jsp" %>
    	
        <h2>You have successfully registered. </h2>
        <%
        String user_regd_id=(String)session.getAttribute("user_regd_id");
        %>
        <h3>Your Regd. ID: <%=user_regd_id%> </h3>
        
       <!-- <h3> <a href="index.jsp">Login Here</a> </h3> -->
        
   <%@ include file="common/lbody.jsp" %>

</body>
</html>