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

/**
 *
 * @author USER
 */
public class SeekClarification extends HttpServlet {
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
             String grv_regd_id = request.getParameter("grv_regd_id");
           // String sending_date = request.getParameter("sending_date");
            String user_type= request.getParameter("user_type");
            String description = request.getParameter("description");
            
            String request_date=DateTime.sysDateTime();
            
            //String grv_regd_id = "1";
            String user_id = "1";
            String clarification_reply = "";
            
            String status = "Pending";

            con = new DBConnection().getConnection();
            String sql = "Insert into user_clarification(grv_regd_id,user_type,user_id,description,clarification_reply,request_date,status)"
                    + " values(?,?,?,?, ?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, grv_regd_id);
            ps.setString(2, user_type);
            ps.setString(3, user_id);
            ps.setString(4, description);
            ps.setString(5, clarification_reply);
            ps.setString(6, request_date);
            ps.setString(7, status);
            int row = ps.executeUpdate();
            out.println(row + " row inserted");
            if (row > 0) {
                request.setAttribute("status", user_type+" sussessfully sent");
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
