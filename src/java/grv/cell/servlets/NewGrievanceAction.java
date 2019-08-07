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
public class NewGrievanceAction extends HttpServlet {
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
             
            String action_taken_by = (String)session.getAttribute("pgo_regd_id");

            
             String grv_regd_id = request.getParameter("grv_regd_id");
            String target_date = request.getParameter("tg_date");
            String case_presently_with = action_taken_by;
            
            String decision = request.getParameter("decision");
            String remarks = request.getParameter("remarks");
            String subordinate_org = request.getParameter("subordinate_org");
            String attached_file = request.getParameter("attached_file");
            String suggested_office = request.getParameter("govt_dept");
            String local_file_no = request.getParameter("local_file_no");
            String grv_type = request.getParameter("grv_type");
            String forwarding_remarks = request.getParameter("forwarding_remarks");
            String noaction_remarks = request.getParameter("noaction_remarks");
            String not_pertaining_remarks = request.getParameter("not_pertaining_remarks");
            String file = request.getParameter("file");
            
            
            String action_date=DateTime.sysDateTime();
            
            //String grv_regd_id = "1";
            //String user_id = "1";
            //String clarification_reply = "";
            
            //String status = "Pending";

            con = new DBConnection().getConnection();
            
            String org_id=(String)session.getAttribute("org_id");
  
             String pgo_regd_id="";
             int turn=0;
                 
             
            if(subordinate_org!=null && !"".equals(subordinate_org)){
             int pcount=0;
                String sql00="Select count(*) from pgo_regd where org_id=?";
                 PreparedStatement ps00 = con.prepareStatement(sql00);
                 ps00.setString(1, subordinate_org);
                 
                 ResultSet rs00=ps00.executeQuery();
                 if(rs00.next())
                 {
                     pcount=rs00.getInt(1);
                     
                 }
                 String sq200="Select max(turn) from org_regd where org_id=?";
                 PreparedStatement ps11 = con.prepareStatement(sq200);
                 ps11.setString(1, subordinate_org);
                 
                 ResultSet rs11=ps11.executeQuery();
                 if(rs11.next())
                 {
                    turn=rs11.getInt(1);                     
                 }
                 
                 
                 if(turn>0)
                 {
                   
                     if(turn==pcount)
                         turn=0;
                     else if(turn>pcount)
                         turn  = turn-pcount; 
                       
                     turn=turn+1;
                     
                 }
                 else
                     turn=1;

            
                 String sqlp="SELECT pgo_regd_id FROM pgo_regd where org_id=? and (cast(substring(pgo_regd_id,1,3)as unsigned))=?";
                 PreparedStatement psp = con.prepareStatement(sqlp);
                 psp.setString(1, subordinate_org);
                 psp.setInt(2, turn);
                 
                 ResultSet rsp=psp.executeQuery();
                 if(rsp.next())
                 {
                    pgo_regd_id=rsp.getString(1);
                 }
                 
                 
            }
            int ref_action_id=0;
            String sqlp="SELECT max(action_id) FROM grv_action where grv_regd_id=? and case_presently_with=? and decision=?";
            PreparedStatement psp = con.prepareStatement(sqlp);
            psp.setString(1, grv_regd_id);
            psp.setString(2, action_taken_by);
            psp.setString(3, "forward to subordinate organization");

            ResultSet rsp=psp.executeQuery();
            if(rsp.next())
            {
                ref_action_id=rsp.getInt(1);
            }
            
            
             
            String sql = "Insert into grv_action(grv_regd_id,action_taken_by,case_presently_with,decision,subordinate_org,suggested_office,action_date,noaction_remarks,file,forwarding_remarks,not_pertaining_remarks,ref_action_id)values(?,?,?,?, ?,?,?,?, ?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, grv_regd_id);
            ps.setString(2, action_taken_by);
            ps.setString(3, pgo_regd_id);
            ps.setString(4, decision);
            ps.setString(5, subordinate_org);
            //ps.setString(7, attached_file);
            ps.setString(6, suggested_office);
            ps.setString(7, action_date);
            ps.setString(8, noaction_remarks);
            ps.setString(9, file);
            ps.setString(10, forwarding_remarks);
            ps.setString(11, not_pertaining_remarks);
            ps.setInt(12, ref_action_id);
            
            int row = ps.executeUpdate();
            //out.println(row + " row inserted");
            if(target_date==null || target_date.equals("") || target_date.equals("-")){}
            else{
            String sql123 = "update grv_regd set target_date=?,grv_type=?,local_file_no=? where grv_regd_id=?";
            PreparedStatement ps123 = con.prepareStatement(sql123);
            ps123.setString(1, target_date);
            ps123.setString(2, grv_type);
            //ps123.setString(3, forwarding_remarks);
            ps123.setString(3, local_file_no);
            ps123.setString(4, grv_regd_id);
            System.out.println(ps123);
            row = ps123.executeUpdate();
            }
                         
            
            if (row>0) {
              
                  new Grievance().updateGrievanceStatus(grv_regd_id,action_taken_by,decision, subordinate_org,pgo_regd_id);
              
                if(decision.contains("forward")){
                
                 String sql2 = "insert into grv_status (grv_regd_id,govt_dept,received_by,status,pgo_regd_id) values(?,?,?,?,?)";
                PreparedStatement ps2 = con.prepareStatement(sql2);           

                ps2.setString(1, grv_regd_id);
                ps2.setString(2, subordinate_org);           
                ps2.setString(3, pgo_regd_id);           
                ps2.setString(4, "New");
                ps2.setString(5,action_taken_by);
                row=ps2.executeUpdate();
                
                 String sqlu="Update org_regd set turn=? where org_id=?";
                 PreparedStatement psu =con.prepareStatement(sqlu);
                 psu.setInt(1, turn);
                 psu.setString(2, subordinate_org);
                 psu.executeUpdate();
                 
                 
                }
                
                
                if(decision.contains("no action")){
                    
                      String sqlab = "insert into direct_action (grv_regd_id) values(?)";
                 PreparedStatement psab = con.prepareStatement(sqlab);           

                psab.setString(1, grv_regd_id);
                psab.executeUpdate();
            
                    
                    
                    
                    
                     String sql10 = "update grv_regd set grv_status=?,direct_action=? where grv_regd_id=?";
            PreparedStatement ps10 = con.prepareStatement(sql10);           
            ps10.setString(1, "Disposed");
            ps10.setString(2, "Yes");
            ps10.setString(3, grv_regd_id);
            int yy=ps10.executeUpdate();
            
             String sql50 = "insert into grv_disposed (grv_regd_id,disposal_type,status,disposal_date,disposed_by,attached_file,disposal_remark) values(?,?,?,?, ?,?,?)";
                 PreparedStatement ps50 = con.prepareStatement(sql50);           

                ps50.setString(1, grv_regd_id);
                ps50.setString(2, "no action");           
                ps50.setString(3, "Disposed");
                ps50.setString(4,action_date);
                ps50.setString(5,action_taken_by);
                ps50.setString(6,file);
                ps50.setString(7,noaction_remarks);
                ps50.executeUpdate();
                
                
                String sql60 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps60 = con.prepareStatement(sql60);           
                ps60.setString(1,"Disposed");
                ps60.setString(2, grv_regd_id);
                
                ps60.setString(3,action_taken_by);
                ps60.executeUpdate();
                
                
             
                
            
            
            System.out.println(yy + " row updated");
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DisposedGrievance.jsp");
                rd.forward(request, response);
                }
                else if(decision.contains("not pertaining to our organization")){
                    
            
            String sql90 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                 PreparedStatement ps90 = con.prepareStatement(sql90);           
                ps90.setString(1,"");
                ps90.setString(2, grv_regd_id);
                
                ps90.setString(3,action_taken_by);
                ps90.executeUpdate();
                
                String abc="";
                String sql87 = "select pgo_regd_id from grv_status where grv_regd_id=? and received_by=?";
                PreparedStatement ps87 = con.prepareStatement(sql87);           
                ps87.setString(1, grv_regd_id);
                ps87.setString(2,action_taken_by);
                 ResultSet rs87=ps87.executeQuery();
                 if(rs87.next())
                 {
                    abc=rs87.getString(1);
                 }
                

                
                String sql910 = "update grv_status set status=? where grv_regd_id=? and status=? and received_by=? ";
                 PreparedStatement ps910 = con.prepareStatement(sql910);           
                ps910.setString(1,"Returned");
                ps910.setString(2, grv_regd_id);
                ps910.setString(3, "Pending");
                
                ps910.setString(4,abc);
                ps910.executeUpdate();
            
                
           
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ReturnedGrievance.jsp");
                rd.forward(request, response);
                }
                else{
                
                
            String sql30 = "update grv_regd set grv_status=? where grv_regd_id=?";
            PreparedStatement ps30 = con.prepareStatement(sql30);           
            ps30.setString(1, "Pending");
            ps30.setString(2, grv_regd_id);
            int xx=ps30.executeUpdate();
            System.out.println(xx + " row updated");
                request.setAttribute("status","Action Taken;" + decision);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PendingGrievance.jsp");
                rd.forward(request, response);
                }
            } else {
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
