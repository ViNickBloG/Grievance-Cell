<%-- 
    Document   : CaseReportReceived_ActionReport
    Created on : 10 Dec, 2012, 4:28:41 PM
    Author     : USER
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="grv.cell.beans.DBConnection"%>

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
        
        <table width="722" height="178" border="1" class="table1">
            <%
        String grv_regd_id=request.getParameter("grv_regd_id");
        String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
        
    Connection con = new DBConnection().getConnection();   
    String sql="select * from case_report where grv_regd_id=? and sentto_pgo=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, grv_regd_id);
    ps.setString(2, pgo_regd_id);
    ResultSet rs=ps.executeQuery();
    /*String sql1="select gr.*,gpa.* from grv_regd gr join grv-pending_action gpa on(gr.grv_regd_id=gpa.grv_regd_id) where gr.grv_status='Disposed' and gr.grv_regd_id=? ";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1, grv_regd_id);
    ResultSet rs1=ps1.executeQuery();*/
    
    if (rs.next())
    {
        String action_report=rs.getString("action_report");
        String report_file=rs.getString("report_file");
        String receivedfrom_org=rs.getString("receivedfrom_org");
        String receivedfrom_pgo=rs.getString("receivedfrom_pgo");
        String report_id=rs.getString("report_id");
        
        String sqlab="update case_report set indicator=1 where report_id=?";
        PreparedStatement psab = con.prepareStatement(sqlab);
        psab.setString(1, report_id);
        psab.executeUpdate();
 
        
                                 String sql3="select or1.*,pr1.* from org_regd or1 join pgo_regd pr1 on(or1.org_id=pr1.org_id)  where or1.org_id=? and pr1.pgo_regd_id=?  ";
     PreparedStatement ps3 = con.prepareStatement(sql3);
     ps3.setString(1, receivedfrom_org);
     ps3.setString(2, receivedfrom_pgo);
                            //ps.setString(2, pgo_regd_id);
     ResultSet rs3=ps3.executeQuery();
                            if (rs3.next())
                            {
                                String pgo_name=rs3.getString("pgo_name");
                                String designation=rs3.getString("designation");
                                String govt_dept=rs3.getString("govt_dept");
                                String dist=rs3.getString("dist");
                                String block=rs3.getString("block");
                                
                                if(dist==null)
                                    dist="";
                                if(block==null)
                                    block="";

    
        
  %>
  
  <tr>
    <th width="187">ACTION TAKEN REPORT</th>
    <td width="157"><%=action_report%></td>
    <td width="12">&nbsp;</td>
    <th width="179">NAME OF THE OFFICE</th>
    <td width="153"><%=receivedfrom_org%>-<%=govt_dept%>-<%=dist%>-<%=block%></td>
  </tr>
  <tr>
    <th>ATTACHED FILE</th>
    <td>###<%=report_file%>### <%if(report_file!=null && !"-".equals(report_file)  && !"".equals(report_file)){ %>
            <a href="uploadedfiles/<%=report_file%>" target="_blank">Download</a>
            <%}%>
       </td>
    <td>&nbsp;</td>
    <th>NAME OF THE OFFICER</th>
    <td><%=receivedfrom_pgo%>-<%=pgo_name%>-<%=designation%></td>
  </tr>
  <tr>
    
    <td colspan="5">&nbsp;</td>
     </tr>
  <tr>
      <td colspan="5">      
          <table width="100%" border="1" class="table1">
                <tr>
                  <th width="250">Name of Organization</th>
                  <th width="300">Remarks</th>

                  </tr>
                  
                  <%
                  String ofc="";
                  String remarkz="";
                  String ofc_name="";
                  String dist_name="";
                  String block_name="";
                  String sqlm="select * from pass_grv where grv_regd_id=?";
                   PreparedStatement psm = con.prepareStatement(sqlm);
        psm.setString(1, grv_regd_id);
        ResultSet rsm=psm.executeQuery();
         while(rsm.next())
         {
             ofc=rsm.getString("org_id");
             remarkz=rsm.getString("pass_remarks");
             
         
        String sqld="select or2.*,pg.* from org_regd or2 join pass_grv pg on(or2.org_id=pg.org_id) where pg.org_id=?";
       PreparedStatement psd = con.prepareStatement(sqld);
        psd.setString(1, ofc);
        ResultSet rsd=psd.executeQuery();
        
        if(rsd.next())
         {
              ofc_name=rsd.getString("govt_dept");
              dist_name=rsd.getString("dist");
              block_name=rsd.getString("block");
             
         }
        if(dist_name==null){
            dist_name="";
        }
        if(block_name==null || block_name=="0"){
            block_name="";
        }
    
    
 
                  %>
                  <tr>
                      <td><%=ofc%>-<%=ofc_name%></br><%=dist_name%>-<%=block_name%></td>
                      <td><%=remarkz%></td>
                  </tr>
                  <%}%>

            </table>
        </td>
       
    
   
  </tr>
  <%}}%>
</table>

<%@ include file="common/lbody.jsp" %>
<%@ include file="floatmenu2.jsp" %>
  
    </body>
</html>
