/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import grv.cell.beans.DBConnection;
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
 * @author HOME
 */
public class UpdateUserDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
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
             String name=request.getParameter("name");
                String dob=request.getParameter("dob");
                String gender=request.getParameter("gender");
                String category=request.getParameter("category");
                String type=request.getParameter("type");
                String dist=request.getParameter("dist");
                String block=request.getParameter("block");
                String panchayat=request.getParameter("panchayat");
                String village=request.getParameter("village");
                String address=request.getParameter("address");
                String pincode=request.getParameter("pincode");
                String mobileno=request.getParameter("mobileno");
                String emailid=request.getParameter("emailid");
                String id_proof=request.getParameter("id_proof");
                String id_proof_no=request.getParameter("id_proof_no");
                String photo=request.getParameter("photo");
                String photo1=request.getParameter("photo1");
                String user_regd_id=request.getParameter("user_regd_id");
               
            if(photo==null || "".equals(photo))
                photo=photo1;
            
            Connection con=new DBConnection().getConnection();
           String sql="update user_regd set name=?,gender=?,dob=?,category=?,type=?,photo=?,mobileno=?, emailid=?, address=?,  id_proof_no=? where user_regd_id=?";
            PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1, name );
            ps.setString(2, gender);
            ps.setString(3, dob);
            ps.setString(4, category);
            ps.setString(5, type);
            ps.setString(6, photo);
            ps.setString(7, mobileno);
            ps.setString(8, emailid);
            ps.setString(9, address);
            
            ps.setString(10, id_proof_no);
            ps.setString(11, user_regd_id);
            
            int row=ps.executeUpdate();
            if(row>=0)
            {
                 request.setAttribute("status", "Details of---"+name+"---successfully updated!!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserHome.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
