/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

import grv.cell.beans.DBConnection;
import grv.cell.beans.DateTime;
import grv.cell.beans.Grievance;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
public class PendingGrievanceAction extends HttpServlet {
    private Connection con;

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
             HttpSession session =request.getSession();
             
             String govt_dept=(String)session.getAttribute("govt_dept");
             String action_taken_by = (String)session.getAttribute("pgo_regd_id");
             String org_id = (String)session.getAttribute("org_id");
          

            
             String grv_regd_id = request.getParameter("grv_regd_id");
             String decision = request.getParameter("decision");
             String case_presently_with = action_taken_by;
             String action_date=DateTime.sysDateTime();
             
             String reminder_sent_to = request.getParameter("reminder_sent_to");
             String reminder_sent_to_pgo = request.getParameter("reminder_sent_to_pgo");
             String reminder_to_sub_org = request.getParameter("reminder_to_sub_org");
             
             String clarification_type = request.getParameter("clarification_type");
             String clarification_ques = request.getParameter("clarification_ques");
             String sent_to_org = request.getParameter("subordinate_organization_clarification");
             String sent_to_pgo = request.getParameter("clarification_sent_to_pgo");
             String sent_to_user = request.getParameter("user_clarification");
             
             String action_report_sendreport = request.getParameter("action_report_sendreport");
             String file_sendreport = request.getParameter("file_sendreport");
             String parent_org_sendreport = request.getParameter("parent_org_sendreport");
             
             String attach_report = request.getParameter("attach_report");
             String report_id = request.getParameter("report_id");
             String attach_report_file = request.getParameter("attach_report_file");
             String passreport_remarks = request.getParameter("passreport_remarks");
             String parent_org_passreport = request.getParameter("parent_org_passreport");
             
             String action_report_disposedirect = request.getParameter("action_report_disposedirect");
             String file_disposedirect = request.getParameter("file_disposedirect");
             String remarks_disposedirect = request.getParameter("remarks_disposedirect");
             String to_user_direct = request.getParameter("to_user_direct");
             
             String attach_report_disposetransfer = request.getParameter("attach_report_disposetransfer");
             String attach_report_file_disposetransfer = request.getParameter("attach_report_file_disposetransfer");
             String disposetransfer_remarks = request.getParameter("disposetransfer_remarks");
             String to_user_transfer = request.getParameter("to_user_transfer");
           
            
             if(decision.equalsIgnoreCase("send reminder to subordinate organization"))
                    case_presently_with=reminder_sent_to_pgo;
            if(decision.equalsIgnoreCase("seek clarification from...")){
                 if(clarification_type.equalsIgnoreCase("SUBORDINATE ORGANIZATION"))
                   {
                       case_presently_with=sent_to_pgo;
            
                   }
                   else{
                       case_presently_with=sent_to_user;
                         }
                  
            }
            con = new DBConnection().getConnection();
           
            
            
             
              String sql = "Insert into grv_pending_action(grv_regd_id,action_taken_by,case_presently_with,decision,action_date,reminder_sent_to,reminder_to_sub_org,clarification_type,clarification_ques,subordinate_organization_clarification,user_clarification,action_report_sendreport,file_sendreport,parent_org_sendreport,attach_report,attach_report_file,passreport_remarks,parent_org_passreport,action_report_disposedirect,file_disposedirect,remarks_disposedirect,to_user_direct,attach_report_disposetransfer,attach_report_file_disposetransfer,disposetransfer_remarks,to_user_transfer)values(?,?,?,?, ?,?,?,?, ?,?,?,?, ?,?,?,?, ?,?,?,?, ?,?,?,?, ?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, grv_regd_id);
            ps.setString(2, action_taken_by);
            ps.setString(3, case_presently_with);
            ps.setString(4, decision);
            ps.setString(5, action_date);
            ps.setString(6, reminder_sent_to);
            ps.setString(7, reminder_to_sub_org);
            ps.setString(8, clarification_type);
            ps.setString(9, clarification_ques);
            ps.setString(10, sent_to_org);
            ps.setString(11, sent_to_user);
            ps.setString(12, action_report_sendreport);
            ps.setString(13, file_sendreport);
            ps.setString(14, parent_org_sendreport);
            ps.setString(15, attach_report);
            ps.setString(16, attach_report_file);
            ps.setString(17, passreport_remarks);
            ps.setString(18, parent_org_passreport);
            ps.setString(19, action_report_disposedirect);
            ps.setString(20, file_disposedirect);
            ps.setString(21, remarks_disposedirect);
            ps.setString(22, to_user_direct);
            ps.setString(23, attach_report_disposetransfer);
            ps.setString(24, attach_report_file_disposetransfer);
            ps.setString(25, disposetransfer_remarks);
            ps.setString(26, to_user_transfer);
            int row = ps.executeUpdate();
            
            String action_taken_report="";
            String pgo_parent="";
            
         
           if (row>0) {
               
               
               if(decision.contains("send reminder to subordinate organization")){
               
                    String sql601 = "insert into reminder_box (grv_regd_id,status,sender_type,rem_sent_date,sent_to_org,sent_to_pgo,content_sent,sent_by_org,sent_by_pgo) values(?,?,?,?, ?,?,?,?, ?)";
                    PreparedStatement ps601 = con.prepareStatement(sql601); 
                    ps601.setString(1, grv_regd_id);
                    ps601.setString(2, "sent");
                    ps601.setString(3, "higher org");
                    ps601.setString(4, DateTime.sysDateTime());
                    ps601.setString(5, reminder_sent_to);
                    ps601.setString(6, reminder_sent_to_pgo);
                    ps601.setString(7, reminder_to_sub_org);
                    ps601.setString(8, org_id);
                    ps601.setString(9, action_taken_by);
                    ps601.executeUpdate();
                    
                     request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PgoReminder.jsp");
                rd.forward(request, response);
               
                   
                   
               }
               
               
               
               if(decision.contains("seek clarification from...")){
               
                   if(clarification_type.equalsIgnoreCase("SUBORDINATE ORGANIZATION"))
                   {
                       sent_to_user="";
                   }
                   else{
                       sent_to_org="";
                       sent_to_pgo="";
                   }
                   
               String sql701 = "insert into clarification_box (grv_regd_id,clarification_type,clarification_ques,sent_to_org,sent_to_pgo,sent_to_user,sent_by_org,sent_by_pgo,clarification_sent_date) values(?,?,?,?, ?,?,?,?, ?)";
                    PreparedStatement ps701 = con.prepareStatement(sql701); 
                    ps701.setString(1, grv_regd_id);
                    ps701.setString(2, clarification_type);
                    ps701.setString(3, clarification_ques);
                    ps701.setString(4, sent_to_org);
                    ps701.setString(5, sent_to_pgo);
                    ps701.setString(6, sent_to_user);
                    ps701.setString(7, org_id);
                    ps701.setString(8, action_taken_by);
                    ps701.setString(9, DateTime.sysDateTime());
                    ps701.executeUpdate();
                    
                     request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PgoClarification.jsp");
                rd.forward(request, response);
                   
               }
               
               
               if(decision.contains("pass report")){
                   
                   
                   String sql401 = "insert into case_report (grv_regd_id,status,disposal_status,attach_status,action_report,report_file,receivedfrom_org,receivedfrom_pgo,sentto_org,sentto_pgo,report_receiving_date) values(?,?,?,?, ?,?,?,?, ?,?,?)";
                    PreparedStatement ps401 = con.prepareStatement(sql401);          

                    String attach_status="not_attached";
                    if(attach_report!=null && !"".equals(attach_report))
                    {
                       // attach_status="attached";
                         String sql407 = "update case_report set disposal_status=?,attach_status=? where report_id=? ";
                 PreparedStatement ps407 = con.prepareStatement(sql407);           
                ps407.setString(1,"Disposed(Passed Report)");
                ps407.setString(2, "attached");
                ps407.setString(3,report_id);
                ps407.executeUpdate();
                
               
                        
                    }
                    ps401.setString(1, grv_regd_id);
                    ps401.setString(2, "passed_report");
                    ps401.setString(3, "not_disposed");           
                    ps401.setString(4, attach_status);
                    ps401.setString(5, attach_report);
                    ps401.setString(6, attach_report_file);
                    ps401.setString(7, org_id);
                    ps401.setString(8, action_taken_by);
                    ps401.setString(9, parent_org_passreport);
                    ps401.setString(10, pgo_parent);
                    ps401.setString(11, action_date);
                    ps401.executeUpdate();
                    
                
                
                String sql403 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by,action_report,attached_file,disposal_remark) values(?,?,?,?, ?,?,?,?)";
                 PreparedStatement ps403 = con.prepareStatement(sql403);           

                ps403.setString(1, grv_regd_id);
                ps403.setString(2, "passed_report");           
                ps403.setString(3, "Disposed");
                ps403.setString(4,action_date);
                ps403.setString(5,action_taken_by);
                ps403.setString(6,attach_report);
                ps403.setString(7,attach_report_file);
                ps403.setString(8,passreport_remarks);
                ps403.executeUpdate();
                
                
                String sql404 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps404 = con.prepareStatement(sql404);           
                ps404.setString(1,"Disposed");
                ps404.setString(2, grv_regd_id);
                ps404.setString(3,action_taken_by);
                ps404.executeUpdate();
                
                
                 String sql405 = "insert into pass_grv (grv_regd_id,org_id,pass_remarks) values(?,?,?)";
                 PreparedStatement ps405 = con.prepareStatement(sql405);           

                ps405.setString(1, grv_regd_id);
                ps405.setString(2, org_id);           
                ps405.setString(3, passreport_remarks);
                ps405.executeUpdate();
               
                
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DisposedGrievance.jsp");
                rd.forward(request, response);
                
               
               
               }
               if(decision.contains("send report")){
                   
                   String sql301 = "insert into case_report (grv_regd_id,status,disposal_status,attach_status,action_report,report_file,receivedfrom_org,receivedfrom_pgo,sentto_org,sentto_pgo,report_receiving_date) values(?,?,?,?, ?,?,?,?, ?,?,?)";
                    PreparedStatement ps301 = con.prepareStatement(sql301);          
                    String attach_status="not_attached";
                    if(attach_report!=null && !"".equals(attach_report))
                        attach_status="attached";
                    
                    ps301.setString(1, grv_regd_id);
                    ps301.setString(2, "sent_report");
                    ps301.setString(3, "not_disposed");           
                    ps301.setString(4, attach_status);
                    ps301.setString(5, action_report_sendreport);
                    ps301.setString(6, file_sendreport);
                    ps301.setString(7, org_id);
                    ps301.setString(8, action_taken_by);
                    ps301.setString(9, parent_org_sendreport);
                    ps301.setString(10, pgo_parent);
                    ps301.setString(11, action_date);
                    
                    ps301.executeUpdate();
                    
                    
                     
                
                
                String sql303 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by,action_report,attached_file) values(?,?,?,?, ?,?,?)";
                 PreparedStatement ps303 = con.prepareStatement(sql303);           

                ps303.setString(1, grv_regd_id);
                ps303.setString(2, "sent_report");           
                ps303.setString(3, "Disposed");
                ps303.setString(4,action_date);
                ps303.setString(5,action_taken_by);
                ps303.setString(6,action_report_sendreport);
                ps303.setString(7,file_sendreport);
               // ps101.setString(8,remarks_disposedirect);
                ps303.executeUpdate();
                
                
                String sql304 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps304 = con.prepareStatement(sql304);           
                ps304.setString(1,"Disposed");
                ps304.setString(2, grv_regd_id);
                ps304.setString(3,action_taken_by);
                ps304.executeUpdate();
                
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DisposedGrievance.jsp");
                rd.forward(request, response);
                
               
                    
                    
               
               }
               
               
               
               if(decision.contains("DISPOSE (direct grievance)")){
                   
                   String sqlab = "insert into direct_action (grv_regd_id) values(?)";
                 PreparedStatement psab = con.prepareStatement(sqlab);           

                psab.setString(1, grv_regd_id);
                psab.executeUpdate();
            
                   
                    
                String sql100 = "update grv_regd set grv_status=?,direct_action=? where grv_regd_id=?";
                PreparedStatement ps100 = con.prepareStatement(sql100); 
               
                ps100.setString(1, "Disposed");           
                ps100.setString(2, "Yes");           
                ps100.setString(3, grv_regd_id);    
                ps100.executeUpdate();
                
                
                String sql101 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by,action_report,attached_file,disposal_remark) values(?,?,?,?, ?,?,?,?)";
                 PreparedStatement ps101 = con.prepareStatement(sql101);           

                ps101.setString(1, grv_regd_id);
                ps101.setString(2, "Direct");           
                ps101.setString(3, "Disposed");
                ps101.setString(4,action_date);
                ps101.setString(5,action_taken_by);
                ps101.setString(6,action_report_disposedirect);
                ps101.setString(7,file_disposedirect);
                ps101.setString(8,remarks_disposedirect);
                ps101.executeUpdate();
                
                
                String sql102 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps102 = con.prepareStatement(sql102);           
                ps102.setString(1,"Disposed");
                ps102.setString(2, grv_regd_id);
                ps102.setString(3,action_taken_by);
                ps102.executeUpdate();
                
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DisposedGrievance.jsp");
                rd.forward(request, response);
                
                
             
               
               }
               if(decision.contains("DISPOSE (transfered grievance)")){
               
                     String sql402 = "update grv_regd set grv_status=? where grv_regd_id=?";
                PreparedStatement ps402 = con.prepareStatement(sql402); 
               
                ps402.setString(1, "Disposed");           
                ps402.setString(2, grv_regd_id);    
                ps402.executeUpdate();
                
                
                String sql403 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by,action_report,attached_file,disposal_remark) values(?,?,?,?, ?,?,?,?)";
                 PreparedStatement ps403 = con.prepareStatement(sql403);           

                ps403.setString(1, grv_regd_id);
                ps403.setString(2, "transfered");           
                ps403.setString(3, "Disposed");
                ps403.setString(4,action_date);
                ps403.setString(5,action_taken_by);
                ps403.setString(6,attach_report_disposetransfer);
                ps403.setString(7,attach_report_file_disposetransfer);
                ps403.setString(8,disposetransfer_remarks);
                ps403.executeUpdate();
                
                
                String sql404 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps404 = con.prepareStatement(sql404);           
                ps404.setString(1,"Disposed");
                ps404.setString(2, grv_regd_id);
                ps404.setString(3,action_taken_by);
                ps404.executeUpdate();
                
                
               /*  String sql405 = "insert into pass_grv (grv_regd_id,org_id,pass_remarks) values(?,?,?)";
                 PreparedStatement ps405 = con.prepareStatement(sql405);           

                ps405.setString(1, grv_regd_id);
                ps405.setString(2, org_id);           
                ps405.setString(3, disposetransfer_remarks);
                ps405.executeUpdate();*/
               
                
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DisposedGrievance.jsp");
                rd.forward(request, response);
                
               
                 
                    
                    
               }
               
               
           }
            
         /*   if (row>0) {
                if("Office of the BDO".equalsIgnoreCase(govt_dept)){ 
                    
                    if(con==null)
                    con = new DBConnection().getConnection();
                    String sql1 = "insert into case_report (pgo_regd_id,grv_regd_id,action_report,status) values(?,?,?,?)";
                    PreparedStatement ps1 = con.prepareStatement(sql1);          

                    ps1.setString(1, action_taken_by);
                    ps1.setString(2, grv_regd_id);
                    ps1.setString(3, action_taken_report);           
                    ps1.setString(4, "Disposed");
                    row=ps1.executeUpdate();
                    
                    String sql3 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by) values(?,?,?,?,?)";
                    PreparedStatement ps3 = con.prepareStatement(sql3); 
                    ps3.setString(1, grv_regd_id);
                    ps3.setString(2, "Transfered");
                    ps3.setString(3, "Disposed");
                    ps3.setString(4, DateTime.sysDateTime());           
                    ps3.setString(5, action_taken_by); 
                    row=ps3.executeUpdate();
                    
                }
                else if("Office of the Collector".equalsIgnoreCase(govt_dept)){ 
                    
                    if(con==null)
                    con = new DBConnection().getConnection();
                    
                     String sql0 = "Select action_report from case_report where grv_regd_id=? and status=?";
                    PreparedStatement ps0 = con.prepareStatement(sql0); 
                    ps0.setString(1, grv_regd_id);
                    ps0.setString(2, "Disposed");
                    ResultSet rs0 =ps0.executeQuery();
                    if(rs0.next())
                    {
                        action_taken_report=rs0.getString("action_report");
                    }
                    
                    String sql1 = "insert into case_report (pgo_regd_id,grv_regd_id,action_report,status) values(?,?,?,?)";
                    PreparedStatement ps1 = con.prepareStatement(sql1);          

                    ps1.setString(1, action_taken_by);
                    ps1.setString(2, grv_regd_id);
                    ps1.setString(3, action_taken_report);           
                    ps1.setString(4, "Disposed");
                    row=ps1.executeUpdate();
                    
                    String sql3 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by) values(?,?,?,?,?)";
                    PreparedStatement ps3 = con.prepareStatement(sql3); 
                    ps3.setString(1, grv_regd_id);
                    ps3.setString(2, "Transfered");
                    ps3.setString(3, "Disposed");
                    ps3.setString(4, DateTime.sysDateTime());           
                    ps3.setString(5, action_taken_by); 
                    row=ps3.executeUpdate();
                }
                else if("Office of the Panchayati Raj Minister".equalsIgnoreCase(govt_dept)){ 
                    
                    if(con==null)
                    con = new DBConnection().getConnection();
                    
                     String sql0 = "Select action_report from case_report where grv_regd_id=? and status=?";
                    PreparedStatement ps0 = con.prepareStatement(sql0); 
                    ps0.setString(1, grv_regd_id);
                    ps0.setString(2, "Disposed");
                    ResultSet rs0 =ps0.executeQuery();
                    if(rs0.next())
                    {
                        action_taken_report=rs0.getString("action_report");
                    }
                    
                    String sql3 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by) values(?,?,?,?,?)";
                    PreparedStatement ps3 = con.prepareStatement(sql3); 
                    ps3.setString(1, grv_regd_id);
                    ps3.setString(2, "Transfered");
                    ps3.setString(3, "Disposed");
                    ps3.setString(4, DateTime.sysDateTime());           
                    ps3.setString(5, action_taken_by); 
                    row=ps3.executeUpdate();
                    
                    String sql7 = "insert into user_letter (received_date,type,pgo_regd_id,grv_regd_id,message,subject,letter_status,user_regd_id) values(?,?,?,?, ?,?,?,?)";
                    PreparedStatement ps7 = con.prepareStatement(sql7);          

                    ps7.setString(1, DateTime.sysDateTime());
                    ps7.setString(2, "Final Letter");
                    ps7.setString(3, action_taken_by);           
                    ps7.setString(4, grv_regd_id);
                    ps7.setString(5, action_taken_report);
                    ps7.setString(6, "Completion of Grievance");
                    ps7.setString(7, "Disposed");
                    ps7.setString(8, new Grievance().getUserRegdId(grv_regd_id));
                    row=ps7.executeUpdate();
                    
                    String sql1 = "insert into case_report (pgo_regd_id,grv_regd_id,action_report,status) values(?,?,?,?)";
                    PreparedStatement ps1 = con.prepareStatement(sql1);          

                    ps1.setString(1, action_taken_by);
                    ps1.setString(2, grv_regd_id);
                    ps1.setString(3, action_taken_report);           
                    ps1.setString(4, "Disposed");
                    row=ps1.executeUpdate();
                }
                
                
                new Grievance().disposeGrievanceStatus(grv_regd_id,action_taken_by);
                
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PendingGrievance.jsp");
                rd.forward(request, response);
            } */
           
           
           
           
           
           else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PendingGrievance.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {            
            try {
                if(con!=null)
                con.close();
            } catch (Exception ex) {
               ex.printStackTrace();
            }
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
