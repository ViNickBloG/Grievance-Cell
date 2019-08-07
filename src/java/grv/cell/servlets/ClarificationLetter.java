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
 * @author Deepun
 */
public class ClarificationLetter extends HttpServlet {
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
        try {
            String clarification_reply=request.getParameter("reply");
           String reply_sent_by_pgo=request.getParameter("reply_sent_by_pgo");
           String reply_sent_by_org=request.getParameter("reply_sent_by_org");
           String reply_sent_by_user=request.getParameter("reply_sent_by_user");
           String clarification_id=request.getParameter("clarification_id");
           String clarification_reply_date=DateTime.sysDateTime();
           
           con=new DBConnection().getConnection();
           
          
           String sql123 = "update clarification_box set clarification_reply=?,reply_sent_by_org=?,reply_sent_by_pgo=?,reply_sent_by_user=?, clarification_reply_date=?,indicator=2 where clarification_id=?";
            PreparedStatement ps123 = con.prepareStatement(sql123);
            ps123.setString(1, clarification_reply);
            ps123.setString(2, reply_sent_by_org);
            //ps123.setString(3, forwarding_remarks);
            ps123.setString(3, reply_sent_by_pgo);
            ps123.setString(4, reply_sent_by_user);
            ps123.setString(5, clarification_reply_date);
            ps123.setString(6, clarification_id);
            System.out.println(ps123);
            int row = ps123.executeUpdate();
            out.println(row+" row inserted");
           if(row>0)
           {
               //request.setAttribute("status","Direct Action Grievance table Updated");
               if(reply_sent_by_user==null || reply_sent_by_user.equals("")){
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/UserClarification.jsp");
               rd.forward(request, response);
               }else{
                   request.setAttribute("status", "Reply to the Question sent successfully!! ");
                   RequestDispatcher rd=getServletContext().getRequestDispatcher("/UserClarification.jsp");
               rd.forward(request, response);
               }
               
           }            
           else
           {
               request.setAttribute("status", "Operation failed");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/UserClarificationLetter.jsp");
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
