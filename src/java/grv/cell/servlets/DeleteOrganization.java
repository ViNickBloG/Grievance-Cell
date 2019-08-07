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
public class DeleteOrganization extends HttpServlet {

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
             
            String org_id = request.getParameter("org_id");

            con = new DBConnection().getConnection();
            
        
                
                String sql10 = "delete from org_regd where org_id=?";
                PreparedStatement ps10 = con.prepareStatement(sql10);
                ps10.setString(1, org_id);
                int s=ps10.executeUpdate();
                if(s>0)
                {
                     String sql1="delete from pgo_regd where org_id=?";
                     PreparedStatement ps1 = con.prepareStatement(sql1);
                   
                     ps1.setString(1, org_id);
                     int row=ps1.executeUpdate();
                }
                
            
            if (s > 0) {
                request.setAttribute("status","ORGANIZATION DELETED SUCCESSFULLY");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ManageOrganization.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ManageOrganization.jsp");
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
