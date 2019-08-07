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
import java.sql.SQLException;
import java.sql.Statement;
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
public class GrievanceRegistration extends HttpServlet {

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
    
    
            String govt_dept = request.getParameter("govt_dept");
            String dist = request.getParameter("dist");
            String block = request.getParameter("block");
            String lg_dist = request.getParameter("lg_dist");
            String lg_block = request.getParameter("lg_block");
            String lg_panchayat = request.getParameter("lg_panchayat");
            String lg_village = request.getParameter("lg_village");
            String nature = request.getParameter("nature");
            String grv_details = request.getParameter("grv_details");
            String action_suggested = request.getParameter("action_suggested");
            String file = request.getParameter("file");
            String grv_ref_status = request.getParameter("grv_ref_status");

            // String user_regd_id=request.getParameter("user_regd_id");

            String grv_status="New";
            String grv_type="";
            String remarks="";
            
            String regd_date=DateTime.sysDateTime();
              
            
            String grv_regd_id = "1";
            int count=0;
            
            String user_regd_id = (String)session.getAttribute("user_regd_id");

            
if(captcha.equals(captcha1))
{
      try {
            
            con = new DBConnection().getConnection();
            
            String sql0="Select count(*) from grv_regd where user_regd_id=?";
            PreparedStatement ps0 = con.prepareStatement(sql0);
            ps0.setString(1, user_regd_id);
            ResultSet rs0=ps0.executeQuery();
            if(rs0.next())
            {
                count=rs0.getInt(1);
            }
            count=count+1;
            
            //grv_regd_id=user_regd_id+"/"+DateTime.sysMonthYear()+"/"+count;
            grv_regd_id=user_regd_id+"/"+count;
            
            String org_id="";
            String org_type=govt_dept;

           
                     
            Statement st8=con.createStatement();
            String sql8="";
            
             sql8="Select org_id from org_regd where govt_dept='"+govt_dept+"'";                 
           
           
            if(!"".equals(sql8))
            {
                
                 ResultSet rs8=st8.executeQuery(sql8);
                 if(rs8.next())
                 {
                    org_id=rs8.getString(1);
                 }
                 
            }
            int pcount=0;
                String sql00="Select count(*) from pgo_regd where org_id=?";
                 PreparedStatement ps00 = con.prepareStatement(sql00);
                 ps00.setString(1, org_id);
                 
                 ResultSet rs00=ps00.executeQuery();
                 if(rs00.next())
                 {
                     pcount=rs00.getInt(1);
                     
                 }
                 int turn=0;
                 String sq200="Select max(turn) from org_regd where org_id=?";
                 PreparedStatement ps11 = con.prepareStatement(sq200);
                 ps11.setString(1, org_id);
                 
                 ResultSet rs11=ps11.executeQuery();
                 if(rs11.next())
                 {
                    turn=rs11.getInt(1);                     
                 }
                 
                 
                 if(turn>0)
                 {
                   
                     if(turn==pcount)
                         turn=0;
                     else if(turn>pcount)
                         turn  = turn-pcount; 
                       
                     turn=turn+1;
                     
                 }
                 else
                     turn=1;

            
                 
                 String pgo_regd_id="";
                 String sqlp="SELECT pgo_regd_id FROM pgo_regd where org_id=? and (cast(substring(pgo_regd_id,1,3)as unsigned))=?";
                 PreparedStatement psp = con.prepareStatement(sqlp);
                 psp.setString(1, org_id);
                 psp.setInt(2, turn);
                 
                 ResultSet rsp=psp.executeQuery();
                 if(rsp.next())
                 {
                    pgo_regd_id=rsp.getString(1);
                 }
                 
                 
            //System.out.println(org_id);
            
            String sql = "Insert into grv_regd(grv_regd_id,govt_dept,dist,block,lg_dist,lg_block,lg_panchayat,lg_village,nature,grv_details,action_suggested,file,grv_ref_status,regd_date,user_regd_id,grv_status,grv_type,remarks,org_id,pgo_regd_id) values(?,?,?,?,?,?, ?,?,?,?,?,?, ?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, grv_regd_id);
            ps.setString(2, govt_dept);
            ps.setString(3, dist);
            ps.setString(4, block);
            ps.setString(5, lg_dist);
            ps.setString(6, lg_block);
            ps.setString(7, lg_panchayat);
            ps.setString(8, lg_village);
            ps.setString(9, nature);
            ps.setString(10, grv_details);
            ps.setString(11, action_suggested);
            ps.setString(12, file);
            ps.setString(13, grv_ref_status);
            ps.setString(14, regd_date);
            ps.setString(15, user_regd_id);
            ps.setString(16, grv_status);
            ps.setString(17, grv_type);
            //ps.setString(18, target_date);
            ps.setString(18, remarks);
            ps.setString(19, org_id);
            ps.setString(20, pgo_regd_id);
           // ps.setInt(20, turn);
            int row = ps.executeUpdate();
          
            out.println(row + " row inserted");
            if (row > 0) {
                                
                 String sqlu="Update org_regd set turn=? where org_id=?";
                 PreparedStatement psu =con.prepareStatement(sqlu);
                 psu.setInt(1, turn);
                 psu.setString(2, org_id);
                 psu.executeUpdate();
                 
               new Grievance().initGrievanceStatus(grv_regd_id, org_id, pgo_regd_id);//===============status
               
               session.setAttribute("grv_regd_id", grv_regd_id);
               session.setAttribute("count", count+"");

                RequestDispatcher rd = getServletContext().getRequestDispatcher("/SuccessGrv.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/GrievanceRegistration.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    else
    {
        request.setAttribute("status", "Captcha doesn't match");
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/GrievanceRegistration.jsp");
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
