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
import java.sql.SQLException;

import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class GrievanceCategory extends HttpServlet {
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
            String category_name=request.getParameter("grv_category");
           
            String org_id=request.getParameter("org_id");
           
           
           con=new DBConnection().getConnection();
           String sql="Insert into grv_category(category_name,org_id) values(?,?)";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, category_name);
           ps.setString(2, org_id);
          
           
           int row=ps.executeUpdate();
           out.println(row+" row inserted");
           if(row>0)
           {
              

               RequestDispatcher rd=getServletContext().getRequestDispatcher("/GrievanceCategory.jsp");
               rd.forward(request, response);
           }            
           else
           {
               request.setAttribute("status", "Operation failed");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/GrievanceCategory.jsp");
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
            } catch (SQLException ex) {
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
