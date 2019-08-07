
<head>

<%@ include file="common/head.jsp" %>

</head>

<body> 

    <%@ include file="common/ubody.jsp" %>
    	
        <h2><font color="green">You have registered the Organization successfully !!</font></h2>
        <%
        String org_id=(String)request.getAttribute("org_id");
        String govt_dept=(String)request.getAttribute("govt_dept");
        String parent_org_name=(String)request.getAttribute("parent_org_name");
        String parent_org=(String)request.getAttribute("parent_org");
        %>
        <h4>Organization Regd. ID: <%=org_id%> </h4>
        <h3>Organization Name: <%=govt_dept%> </h3>
        <h4>Parent Organization ID: <%=parent_org%></h4>
        <h3>Parent Organization Name:<%=parent_org_name%> </h3>
        </br><h3><font color="red">PLEASE REGISTER PGO FOR THIS ORGANIZATION Before Leaving this Page</font></h3>
        <a href="RegisterPgo.jsp?org_id=<%=org_id%>&govt_dept=<%=govt_dept%>">REGISTER PGO</a>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        
       <!-- <h3> <a href="index.jsp">Login Here</a> </h3> -->
        
   <%@ include file="common/lbody.jsp" %>

</body>
</html>