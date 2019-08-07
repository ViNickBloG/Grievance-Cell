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
public class UpdateOrganizationDetails extends HttpServlet {

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
            String org_id=request.getParameter("org_id");
            String govt_dept=request.getParameter("govt_dept");
            String address=request.getParameter("address");
            String pincode=request.getParameter("pincode");
            String authority=request.getParameter("authority");
            String status=request.getParameter("status");
            String contact_no=request.getParameter("contact_no");
            String email_id=request.getParameter("email_id");
                        
            Connection con=new DBConnection().getConnection();
           String sql="update org_regd set govt_dept=?,address=?,pincode=?,authority=?,status=?,contact_no=?,email_id=?  where org_id=?";
            PreparedStatement ps= con.prepareStatement(sql);
            ps.setString(1,govt_dept );
            ps.setString(2, address);
            ps.setString(3, pincode);
            ps.setString(4, authority);
            ps.setString(5, status);
            ps.setString(6, contact_no);
            ps.setString(7, email_id);
            ps.setString(8, org_id);
            
            int row=ps.executeUpdate();
            if(row>=0)
            {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/ManageOrganization.jsp");
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
