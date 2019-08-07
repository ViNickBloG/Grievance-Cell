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
public class Feedback extends HttpServlet {

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
           String name=request.getParameter("name");
           String mob_no=request.getParameter("mob_no");
           String email_id=request.getParameter("email_id");
           String content=request.getParameter("content");
           con=new DBConnection().getConnection();
           String sql="Insert into feedback(name,mob_no,email_id,content,submit_date) values(?,?,?,?,?)";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, name);
           ps.setString(2, mob_no);
           ps.setString(3, email_id);
           ps.setString(4, content);
           ps.setString(5, DateTime.sysDateTime());
           int row=ps.executeUpdate();
           out.println(row+" row inserted");
           if(row>0)
           {
                            String message="Hello "+name;
                            message+="<br/>";
                            message+="Thanks for your valuable feedback/suggestion !!";
                            message+="<br/>";

                            //String link="<a href=\"http://localhost:8084/GrievanceCell/\"> Click here to Login </a> ";
                            try{
                            SendExternalEmail semail =new SendExternalEmail();
                           // semail.setLink(link);
                            semail.setReceiver(email_id);
                            semail.setSubject("e-Grievance Cell FEEDBACK/SUGGESTION submission successfull");
                           
                            semail.setMessage(message);

                            String msg=semail.sendEmail();
                            if(msg.equals("fail"))
                                out.println("Please check your Internet settings");
                            System.out.println(msg);

                            }catch(Exception e){
                                e.printStackTrace();
                            }

               request.setAttribute("status","THANKS FOR THE FEEDBACK/SUGGESTION !!");
                
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/GuestFeedback.jsp");
               rd.forward(request, response);
           }            
           else
           {
               request.setAttribute("status", "Operation failed");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/index.jsp");
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
