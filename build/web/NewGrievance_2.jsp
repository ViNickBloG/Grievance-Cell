<%-- 
    Document   : NewGrievance
    Created on : 6 Dec, 2012, 4:43:20 PM
    Author     : USER
--%>

<%@page import="java.sql.Statement"%>
<%@page import="grv.cell.beans.DateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="common/head.jsp" %>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <h2><font color="purple">NEW GRIEVANCE</font></h2>
    <div style="margin-top: -50px;margin-left: 330px;">
        <form action="SearchGrvNew.jsp" name="SearchGrvNew" method="post" >
        <input name="grv_regd_id" type="text" value="" placeholder="Search GRV-REGD ID.." size="20" maxlength="30" />
       
        <input name="submit" type="submit" value="" class="searchbtn" />
        
        </form>

        </div>
        
    
        <table width="504" height="185" border="1" class="table1">
            
  
  <tr>
    <th height="73" scope="col">GRIEVANCE REGISTARTION NO</th>
    <th scope="col">NAME OF COMPLAINANT</th>
    <th scope="col">DATE OF REGISTRATION</th>
    
    <th scope="col">STATUS</th>
    <th scope="col">REMARKS</th>
    <th scope="col">DATE OF TARGET</th>
  </tr>
  <%
   int record=0;
  String ctype=request.getParameter("ctype");
  
  String org_id=(String)session.getAttribute("org_id");
  String govt_dept=(String)session.getAttribute("govt_dept");
  String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
  //Integer id=(Integer)session.getAttribute("id");
  System.out.println(govt_dept);
    Connection con = new DBConnection().getConnection();   
    
    
         int total_record=0;
         int total_page = 0;
         int records_per_page = 5;
         int page_no = 0;
         int start_record=0;

        String pageno1=request.getParameter("pageno");
        int pageno=0;
               
      
       
    String sql44="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id) where gr.grv_regd_id in (Select grv_regd_id from grv_status where govt_dept=? and status='New') and (gr.pgo_regd_id=? or gs.received_by=?) ";
    PreparedStatement ps44 = con.prepareStatement(sql44);
   
    ps44.setString(1, org_id);
    ps44.setString(2, pgo_regd_id);
    ps44.setString(3, pgo_regd_id); 
    ResultSet rs44=ps44.executeQuery();
        while(rs44.next())
        {
           //total_record= rs0.getInt(1); 
            total_record++;
        }
                        
      if(total_record>0)
          {
          
                     
            if(total_record%records_per_page==0)
              total_page = total_record/records_per_page;
            else
            total_page = total_record/records_per_page+1;
  if(pageno1!=null)
        pageno=Integer.parseInt(pageno1);

        if(pageno==0) pageno=1;
        if(pageno<1) pageno=1;
        if(pageno>total_page) pageno=total_page;

        //start_record=(pageno-1)*records_per_page+1;
        start_record=(pageno-1)*records_per_page;

        //String sql1=sql+" limit "+start_record+", "+records_per_page;
        
                        
               
         //String sql="select channel_id,channel_name,category_id,rtsp,iframe,popular,description,logo,about from channel";
         String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id) where gr.grv_regd_id in (Select grv_regd_id from grv_status where govt_dept=? and status='New') and (gr.pgo_regd_id=? or gs.received_by=?) ";
    
        // String sql1="select * from register order  by app_id DESC";
			
          sql=sql+" limit "+start_record+", "+records_per_page;       
    
    
    //String sql="select gr.*,ur.name from grv_regd gr join user_regd ur on(gr.user_regd_id=ur.user_regd_id) join grv_status gs on (gr.grv_regd_id=gs.grv_regd_id) where gr.grv_regd_id in (Select grv_regd_id from grv_status where govt_dept=? and status='New') and (gr.pgo_regd_id=? or gs.received_by=?) ";
    PreparedStatement ps = con.prepareStatement(sql);
   
    ps.setString(1, org_id);
    ps.setString(2, pgo_regd_id);
    ps.setString(3, pgo_regd_id);
 System.out.println(ps);   
    ResultSet rs=ps.executeQuery();
   
    while (rs.next())
    {
        
        String grv_regd_id=rs.getString("grv_regd_id");
        String regd_date=rs.getString("regd_date");
        //String name="";
        String name=rs.getString("name");
        
        //String grv_status=rs.getString("grv_status");
        String remarks=rs.getString("remarks");
        String target_date=rs.getString("target_date");
         boolean tflag=false;
        if(target_date==null)
            target_date="-";
        else
        {
            Date tdate=DateTime.getJavaDate(target_date);
            Date cdate=DateTime.getJavaDate(DateTime.sysDate());
            if(tdate.before(cdate))
            {
                tflag=true;
            }
            System.out.println(tdate+":"+cdate+":"+tflag);
        }
        
         String sql1="select gf.*,or1.* from grv_forward gf join org_regd or1 on(gf.sender_org_id=or1.org_id) where grv_regd_id=? and receiver_pgo=?" ; 
         PreparedStatement ps1 = con.prepareStatement(sql1);
         
         String status1="";
         String govt_dept1="";
         String dist="";
         String block="";
         String fremark="";
         
         
         
         ps1.setString(1, grv_regd_id);
         ps1.setString(2, pgo_regd_id);
         System.out.println("====="+ps1);
         ResultSet rs1=ps1.executeQuery();
         if(rs1.next())
         {
           status1=rs1.getString("status");  
           govt_dept1=rs1.getString("govt_dept");  
           dist=rs1.getString("dist");  
           block=rs1.getString("block");  
           fremark=rs1.getString("forward_remark");  
             
         }
         else{
                status1="New";
                govt_dept1="complainant/citizen";
                dist="";
                block="";
         }

           if(ctype!=null && ctype.equals("citizen"))
           {
                if(!govt_dept1.equalsIgnoreCase("complainant/citizen"))
                    continue;
           }
           else  if(ctype!=null && ctype.equals("higher"))
           {
                if(govt_dept1.equalsIgnoreCase("complainant/citizen"))
                    continue;
           }

         record++;
         
        if(status1==null){
            status1="";
        }
         if(govt_dept1==null){
            govt_dept1="";
        }
         if(dist==null){
            dist="";
        }
        if(block==null){
            block="";
        }
    if(fremark==null){
            fremark="";
        }
    
    
  %>
  <tr>
    <td height="26"> <%=grv_regd_id %>  </td>
    <td><a href="NewGrievanceDetails.jsp?grv_regd_id=<%=grv_regd_id%>">
        <%=name%>
        </a>
    </td>
    <td><%=regd_date%></td>
    <td><font color="blue">(<%=status1%>)</font></br>received from <font color="green"><%=govt_dept1%></font>-<%=dist%>-<%=block%></td>
    <td><%=fremark%></td>
     <%
      if(tflag==true){
          %>
          <td><font color="blue"> <%=target_date%></font></br><font color="red">OVER DUE DATE</font></td>
<%}  else
       {
             
%>

    <td><%=target_date%></td>
<%
       }
%>

  </tr>
  
<%}
    
       }
    %> 
  
  <tr>
    <td colspan="1">NO OF RECORDS:</td>
  
    <td colspan="5"><%=record%></td>
  </tr>
  
</table>
  
      
<div class="pagination1" style="float: right;margin-right: 20px;">
<%
//out.println(total_record);
String str="";
String pageName="viewchannel.jsp";

        
        %>
        
        <span class="first">
            <a href='<%=pageName %>?pageno=1'  > <img src="images/first.png" height="30" width="30" /> </a>            
        </span>
        <span class="prev">
            <a href='<%=pageName %>?pageno=<%= pageno-1 %>' onclick="show(<%= pageno-1 %>,0,'Prev')" > <img src="images/prev.png" height="30" width="30" /> </a>            
        </span>
        <span class="next">
            <a href='<%=pageName %>?pageno=<%= pageno+1 %>' onclick="show(<%= pageno+1 %>,<%= total_page %>,'Next')" > <img src="images/next.png" height="30" width="30" /> </a>            
        </span>
        <span class="last">
            <a href='<%=pageName %>?pageno=<%=total_page%>'  > <img src="images/last.png" height="30" width="30" /> </a>            
        </span>

</div>

        

    <%@ include file="common/lbody.jsp" %>
    
    <%@ include file="floatmenu0.jsp" %>
    
    <div class="slide-out-div">
            <a class="handle" href="http://link-for-non-js-users.html">Content</a>
           
            <div class="slidediv-container">
                <ul>
                    <li> <a href="NewGrievance.jsp?ctype=all"> All </a> </li>
                    <li> <a href="NewGrievance.jsp?ctype=citizen"> From Citizen  </a> </li>
                    <li> <a href="NewGrievance.jsp?ctype=higher"> From Higher Organization  </a> </li>
                </ul>
            </div>   
		   
        </div>
    
    </body>
</html>
