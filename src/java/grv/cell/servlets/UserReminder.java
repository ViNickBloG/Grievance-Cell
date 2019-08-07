/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

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
 * @author USER
 */
public class UserReminder extends HttpServlet {
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
        
            
            HttpSession session =request.getSession();
           
            String captcha=request.getParameter("captcha");         
            String captcha1=(String)session.getAttribute("captcha");
    
            
            
            String user_regd_id=request.getParameter("user_regd_id");
        
             String grv_no = request.getParameter("grv_no");
           // String sending_date = request.getParameter("sending_date");
            //String followup_type= request.getParameter("followup_type");
            String description = request.getParameter("description");
            
            

            
            String sending_date=DateTime.sysDateTime();
            
            String grv_regd_id = user_regd_id+"/"+grv_no;
            //String user_regd_id = "1";
            
            //String org_id = "1";
if(captcha.equals(captcha1))
{
    
    try {

            con = new DBConnection().getConnection();
            String org_id="";
            String pgo_regd_id="";
            
            String sql11="select * from grv_regd where grv_regd_id=?";
     PreparedStatement ps11 = con.prepareStatement(sql11);
     ps11.setString(1, grv_regd_id);
     //ps11.setString(2, sent_by_pgo);
     ResultSet rs11=ps11.executeQuery();
                            if (rs11.next())
                            {
                                org_id=rs11.getString("org_id");
                                pgo_regd_id=rs11.getString("pgo_regd_id");
                               
                                
                                String sql = "Insert into reminder_box(grv_regd_id,rem_sent_date,sent_to_org,sent_to_pgo,content_sent,sender_type,sent_by_user)"
                    + " values(?,?,?,?, ?,?,?)";
                            PreparedStatement ps = con.prepareStatement(sql);
                            ps.setString(1, grv_regd_id);
                            ps.setString(2, sending_date);
                            ps.setString(3, org_id);
                            ps.setString(4, pgo_regd_id);
                            ps.setString(5, description);
                            ps.setString(6, "USER");
                            ps.setString(7, user_regd_id);
                            int row = ps.executeUpdate();
                            out.println(row + " row inserted");
                            if (row > 0) {
                                request.setAttribute("status", "Reminder sent successfully!! ");
                                RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserReminder.jsp");
                                rd.forward(request, response);
                            } else {
                                RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserReminder.jsp");
                                rd.forward(request, response);
                            }

                   }else
                    {
                        request.setAttribute("status", "Grievance no ("+grv_no+") doesn't exist");
                        RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserReminder.jsp");
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
            } catch (Exception ex) {
               ex.printStackTrace();
            }
        }
    
}
else{
     request.setAttribute("status", "Captcha doesn't match");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/UserReminder.jsp");
         rd.forward(request, response);
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
