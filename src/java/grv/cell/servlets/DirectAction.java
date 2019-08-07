/*
/*
/*
/*
/*
/*
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
 * @author USER
 */
public class DirectAction extends HttpServlet {

    Connection con;
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
        try 
        {
            //String grv_regd_id=(String)session.getAttribute("grv_regd_id");
           String notes=request.getParameter("notes");
           String dealing_officer=request.getParameter("dealing_officer");
           String directaction_remarks=request.getParameter("directaction_remarks");
           String grv_regd_id=request.getParameter("grv_regd_id");
           
           con=new DBConnection().getConnection();
           String sql123 = "update direct_action set directaction_remarks=?,notes=?,dealing_officer=? where grv_regd_id=?";
            PreparedStatement ps123 = con.prepareStatement(sql123);
            ps123.setString(1, directaction_remarks);
            ps123.setString(2, notes);
            //ps123.setString(3, forwarding_remarks);
            ps123.setString(3, dealing_officer);
            ps123.setString(4, grv_regd_id);
            System.out.println(ps123);
            int row = ps123.executeUpdate();
            out.println(row+" row inserted");
           if(row>0)
           {
               request.setAttribute("status","Direct Action Grievance table Updated");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/DirectActionTakenGrievance.jsp");
               rd.forward(request, response);
           }            
           else
           {
               request.setAttribute("status", "Operation failed");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/DirectActionTakenGrievanceDetails.jsp");
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
