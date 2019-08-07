/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */package grv.cell.servlets;

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
 * @author arun
 */
public class PgoWriteLetter extends HttpServlet {

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
           String received_date=DateTime.sysDateTime();
             
            
            String type=request.getParameter("type");
            HttpSession session =request.getSession();
            String pgo_regd_id=(String)session.getAttribute("pgo_regd_id");
            
            String user_regd_id=request.getParameter("user_regd_id");
            
            String grv_regd_id=request.getParameter("grv_regd_id");
            
            String message=request.getParameter("message");
            
            String subject=request.getParameter("subject");
            
            String letter_status="unread";
            
           // String user_regd="2";
            Connection con=new DBConnection().getConnection();
            String sql="insert into user_letter(type,pgo_regd_id,user_regd_id,grv_regd_id,message,subject,letter_status,received_date)"
                    +"values(?,?,?,?,?,?,?,?)";
              
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1,type);
            ps.setString(2,pgo_regd_id);
            ps.setString(3,user_regd_id);
            ps.setString(4,grv_regd_id);
            ps.setString(5,message);
            ps.setString(6,subject);
            ps.setString(7,letter_status);
            ps.setString(8,received_date);
            int row=ps.executeUpdate();
            System.out.println("row.........."+row);
             if(row>1)
             {
                  RequestDispatcher rd=getServletContext().getRequestDispatcher("/PgoLetterList.jsp");
                    rd.forward(request, response);
             }
             else
             {
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/PgoLetterList.jsp");
                rd.forward(request, response);
             }
        } catch(Exception e)
          {
              e.printStackTrace();
          }
       finally {            
            out.close();
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
