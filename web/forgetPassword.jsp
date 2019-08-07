<%@page import="grv.cell.servlets.SendExternalEmail"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>


<html>
    <head>
            <jsp:include page = "common/head.jsp"/>
    </head>
    
    <body>
        <jsp:include page = "common/ubody.jsp"/>   
        
        <h2><font color="purple"><p>Forgot Password?</p></font></h2>
    <%
                Connection con = new DBConnection().getConnection();
                Statement stmt = con.createStatement();
                    String status1="";
                    String Email=request.getParameter("uid");   
                    if(Email!=null){
                    String sql="select name,emailid,password from user_regd where emailid='"+Email+"' ";
                    ResultSet rs=stmt.executeQuery(sql);
                    if(rs.next())
                    {
                                String name=rs.getString("name");
                                //String email=rs.getString("email");
                                String password=rs.getString("password");

                                 String message="Hello "+name;
                                    message+="<br/>";
                                    message+="Your Password: "+password;
                                    message+="<br/>";

                                    //String link="<a href=\"http://localhost:8084/GrievanceCell/\"> Click here to Login </a> ";
                                    try{
                                    SendExternalEmail semail =new SendExternalEmail();
                                   // semail.setLink(link);
                                    semail.setReceiver(Email);
                                     semail.setSubject("e-Grievance Cell Password recovery");
                                    semail.setMessage(message);
                                    
                                    String msg=semail.sendEmail();
                                    if(msg.equals("fail"))
                                        out.println("Please check your Internet settings");
                                    System.out.println(msg);
                                                                      
                                    }catch(Exception e){
                                        e.printStackTrace();
                                    }

                        status1="Your password has been sent to your email id!";
                        out.println(status1);

                    }else{
                                status1="Email_id doesn't exist";
                        out.println(status1);
                        }
                    
                                       }
    %>
    <form action="">
<table width="500" border="1" class="table1">
  <tr>
    <th>Enter your Email_id: </th>
    <td><input name="uid" type="text" id="uid" size="30"/></td>
  </tr>
  
  <tr>
    <td colspan="2" align="center"><input type="submit" name="Submit" value="Submit" /></td>
    
  </tr>
</table>
    </form>
<p>&nbsp;</p>
            <jsp:include page = "common/lbody.jsp"/>

    </body>
</html>

  