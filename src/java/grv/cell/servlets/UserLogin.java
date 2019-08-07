/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

import grv.cell.beans.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class UserLogin extends HttpServlet {
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
        boolean flag=false;
        try 
        {
           String user_regd_id=request.getParameter("user_regd_id");
           String password=request.getParameter("password");
           
           
           con=new DBConnection().getConnection();
           String sql="Select name,password from user_regd where user_regd_id=? ";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, user_regd_id);
           ResultSet rs = ps.executeQuery();
           if(rs.next())
           {
              
               String dbpass=rs.getString("password").trim();
               String name=rs.getString("name").trim();
               if(dbpass.equals(password))
               {
                   HttpSession session =request.getSession();
                   session.setAttribute("name", name);
                   session.setAttribute("user_regd_id", user_regd_id);
                   session.setAttribute("role", "user");
                   
                   flag=true;
               }
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
        
        if(flag)
        {
            response.sendRedirect("UserHome.jsp");
        }
        else
        {
            request.setAttribute("status", "Invalid userid/password");
            RequestDispatcher rdf= getServletContext().getRequestDispatcher("/index.jsp");
            rdf.forward(request, response);
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