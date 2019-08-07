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
public class UserRegistration extends HttpServlet {

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
           String address=request.getParameter("address");
           String category=request.getParameter("category");
           String type=request.getParameter("type");
           String pincode=request.getParameter("pincode");
           String dist=request.getParameter("dist");
           String panchayat=request.getParameter("panchayat");
           String block=request.getParameter("block");
           String village=request.getParameter("village");
           String mobileno=request.getParameter("mobileno");
           String emailid=request.getParameter("emailid");
           String id_proof=request.getParameter("id_proof");
           String id_proof_no=request.getParameter("id_proof_no");
           String photo=request.getParameter("photo");
           String gender=request.getParameter("gender");
           String dob=request.getParameter("dob");
           String password=request.getParameter("password");
          // String user_regd_id=request.getParameter("user_regd_id");
           int securityCode = new Double( Math.random() * 100000 ).intValue();
           
           String user_regd_id=Integer.toHexString(securityCode);
           
           con=new DBConnection().getConnection();
           String sql="Insert into user_regd(name,address,category,type,pincode,dist,panchayat,block,village,mobileno,emailid,id_proof,id_proof_no,photo,gender,dob,password,user_regd_id,user_regd_date) values(?,?,?,?,?,?, ?,?,?,?,?,?, ?,?,?,?,?,?, ?)";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, name);
           ps.setString(2, address);
           ps.setString(3, category);
           ps.setString(4, type);
           ps.setString(5, pincode);
           ps.setString(6, dist);
           ps.setString(7, panchayat);
           ps.setString(8, block);
           ps.setString(9, village);
           ps.setString(10, mobileno);
           ps.setString(11, emailid);
           ps.setString(12, id_proof);
           ps.setString(13, id_proof_no);
           ps.setString(14, photo);
           ps.setString(15, gender);
           ps.setString(16, dob);
           ps.setString(17, password);
           ps.setString(18, user_regd_id);
           ps.setString(19, DateTime.sysDateTime());
           
           int row=ps.executeUpdate();
           out.println(row+" row inserted");
           if(row>0)
           {
                            String message="Hello "+name;
                            message+="<br/>";
                            message+="Thank you!";
                            //message+="Your Password: "+password;
                            message+="<br/>";

                            //String link="<a href=\"http://localhost:8084/GrievanceCell/\"> Click here to Login </a> ";
                            try{
                            SendExternalEmail semail =new SendExternalEmail();
                           // semail.setLink(link);
                            semail.setReceiver(emailid);
                            semail.setSubject("e-Grievance Cell Registrartion Successfull");                          
                            semail.setMessage(message);

                            String msg=semail.sendEmail();
                            if(msg.equals("fail"))
                                out.println("Please check your Internet settings");
                            System.out.println(msg);

                            }catch(Exception e){
                                e.printStackTrace();
                            }

               HttpSession session =request.getSession();
               session.setAttribute("name", name);
               session.setAttribute("user_regd_id", user_regd_id);
               session.setAttribute("role", "user");

               RequestDispatcher rd=getServletContext().getRequestDispatcher("/GrievanceRegistration.jsp");
               rd.forward(request, response);
           }            
           else
           {
               request.setAttribute("status", "Operation failed");
               RequestDispatcher rd=getServletContext().getRequestDispatcher("/UserRegistration.jsp");
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
