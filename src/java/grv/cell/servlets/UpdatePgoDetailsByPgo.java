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
public class UpdatePgoDetailsByPgo extends HttpServlet {

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
            String pgo_name=request.getParameter("pgo_name");
            String gender=request.getParameter("gender");
            String dob=request.getParameter("dob");
            String designation=request.getParameter("designation");
            String pgo_address=request.getParameter("pgo_address");
            String photo=request.getParameter("photo");
            String photo1=request.getParameter("photo1");
            String mob_no=request.getParameter("mob_no");
            String email_id=request.getParameter("email_id");
            String password=request.getParameter("password");
            String pgo_regd_id=request.getParameter("pgo_regd_id");
            
            if(photo==null || "".equals(photo))
                photo=photo1;
            
            Connection con=new DBConnection().getConnection();
           String sql="update pgo_regd set pgo_name=?,gender=?,dob=?,designation=?,pgo_address=?,photo=?,mob_no=?, email_id=?, password=? where pgo_regd_id=?";
            PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1,pgo_name );
            ps.setString(2, gender);
            ps.setString(3, dob);
            ps.setString(4, designation);
            ps.setString(5, pgo_address);
            ps.setString(6, photo);
            ps.setString(7, mob_no);
            ps.setString(8, email_id);
            ps.setString(9, password);
            ps.setString(10, pgo_regd_id);
            
            int row=ps.executeUpdate();
            if(row>=0)
            {
                 request.setAttribute("status", "PROFILE SUCCESSFULLY UPDATED !!");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/PgoHome.jsp");
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
