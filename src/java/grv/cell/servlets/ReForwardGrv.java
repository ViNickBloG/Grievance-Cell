/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

import grv.cell.beans.DBConnection;
import grv.cell.beans.DateTime;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Deepun
 */
public class ReForwardGrv extends HttpServlet {

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
             
            String pgo_regd_id = (String)session.getAttribute("pgo_regd_id");

            String grv_regd_id = request.getParameter("grv_regd_id");
            String return_date = request.getParameter("action_date");
            String regd_date = request.getParameter("regd_date");
            String target_date = request.getParameter("target_date");
            String name = request.getParameter("name");
           // String sending_date = request.getParameter("sending_date");
            String received_by= request.getParameter("received_by");
            String action_id = request.getParameter("action_id");
            String ref_action_id = request.getParameter("ref_action_id");
            
            String reforward_date=DateTime.sysDateTime();
            con = new DBConnection().getConnection();
            
        
                
                 String sql10 = "insert into reforward_grv (reforward_date,return_date,regd_date,target_date,grv_regd_id,name,pgo_regd_id) values(?,?,?,?,?,?,?)";
                PreparedStatement ps10 = con.prepareStatement(sql10);           

                ps10.setString(1, reforward_date);
                ps10.setString(2, return_date);           
                ps10.setString(3, regd_date);           
                ps10.setString(4, target_date);           
                ps10.setString(5, grv_regd_id);           
                ps10.setString(6, name);           
                ps10.setString(7, pgo_regd_id);           
               ps10.executeUpdate();
                
            
            
            
            
            
            
            
            String sql1="update grv_status set status=? where grv_regd_id=? and received_by=? and status=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setString(1, "Pending");
            
            ps1.setString(2, grv_regd_id);
            ps1.setString(3, pgo_regd_id);
            //ps123.setString(3, forwarding_remarks);
            ps1.setString(4, "Returned");
            //ps123.setString(4, grv_regd_id);
            //System.out.println(ps123);
             int row=ps1.executeUpdate();
            
            String sql2="update grv_status set status=? where grv_regd_id=? and received_by=? and pgo_regd_id=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setString(1, "New");
            
            ps2.setString(2, grv_regd_id);
            ps2.setString(3, received_by);
            //ps123.setString(3, forwarding_remarks);
            ps2.setString(4, pgo_regd_id);
            //System.out.println(ps123);
             ps2.executeUpdate();
            
           
            String sql3="update grv_action set status=0 where action_id=? or ref_action_id=?";
            PreparedStatement ps3= con.prepareStatement(sql3);
            ps3.setString(1, ref_action_id);
            ps3.setString(2, ref_action_id);
             ps3.executeUpdate();
            
            
            if (row > 0) {
                request.setAttribute("status","REFORWARDED SUCCESSFULLY");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PendingGrievance.jsp");
                rd.forward(request, response);
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
