/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.servlets;

import grv.cell.beans.DBConnection;
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
import org.apache.catalina.Session;


/**
 *
 * @author USER
 */
public class RegisterOrganization extends HttpServlet {

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
        try {
             String govt_dept = request.getParameter("govt_dept");
             String dist = request.getParameter("dist");
             String block = request.getParameter("block");
             String address = request.getParameter("address");
             String pincode = request.getParameter("pincode");
             String authority = request.getParameter("authority");
             String status = request.getParameter("status");
             String contact_no = request.getParameter("contact_no");
             String email_id = request.getParameter("email_id");
             
             String org_type = request.getParameter("org_type");
             
             String org_id="100";
             String parent_org="0";
           
            con = new DBConnection().getConnection();
             
            if(org_type.equalsIgnoreCase("Collector"))
            {
                parent_org="300";
                int maxOrgId=400;
                String sql0="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where parent_org=300";
                //String sql0="Select max(org_id) from org_regd where dist=?";
                 PreparedStatement ps0 = con.prepareStatement(sql0);
                 //ps0.setString(1, dist);
                
                 ResultSet rs0=ps0.executeQuery();
                 if(rs0.next())
                 {
                     maxOrgId=rs0.getInt(1);
                     maxOrgId=maxOrgId+1;
                 }
                 else
                 {
                     maxOrgId=401;
                 }
                 
                 if(maxOrgId<=400)
                     maxOrgId=401;
                                      
                 org_id=maxOrgId+"";
                 System.out.println("============="+org_id);
                
            }
            else if(org_type.equalsIgnoreCase("Sub-Collector"))
            {
                //parent_org="300";
                int parent_org1=300;
                String sql00="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where dist=? and org_type=?";
                 PreparedStatement ps00 = con.prepareStatement(sql00);
                 ps00.setString(1, dist);
                 ps00.setString(2, "Collector");
                
                 ResultSet rs00=ps00.executeQuery();
                 if(rs00.next())
                 {
                     parent_org1=rs00.getInt(1);
                     
                 }
                 else
                 {
                     parent_org1 = 300;
                 }
                 
                 parent_org=parent_org1+"";
                 
                int maxOrgId=501;
                String sql0="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where (CONVERT(org_id, SIGNED INTEGER))>500 and (CONVERT(org_id, SIGNED INTEGER))<600";
                 PreparedStatement ps0 = con.prepareStatement(sql0);
                 //ps0.setString(1, dist);
                // ps0.setString(2, "Collector");
                
                 ResultSet rs0=ps0.executeQuery();
                 if(rs0.next())
                 {
                     maxOrgId=rs0.getInt(1);
                     maxOrgId = maxOrgId+1;
                 }
                 else
                 {
                     maxOrgId = 501;
                 }
                 if(maxOrgId<=500)
                     maxOrgId=501;
                
                 
                 org_id=maxOrgId+"";
            }
            else if(org_type.equalsIgnoreCase("BDO"))
            {
                //parent_org="300";
                int parent_org1=300;
                String sql00="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where dist=? and org_type=?";
                 PreparedStatement ps00 = con.prepareStatement(sql00);
                 ps00.setString(1, dist);
                 //ps00.setString(2, block);
                 ps00.setString(2, "Sub-Collector");
                
                 ResultSet rs00=ps00.executeQuery();
                 if(rs00.next())
                 {
                     parent_org1=rs00.getInt(1);
                     
                 }
                 else
                 {
                     parent_org1 = 300;
                 }
                 parent_org=parent_org1+"";
                
                int maxOrgId=601;
                String sql0="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where  (CONVERT(org_id, SIGNED INTEGER))>600";
                 PreparedStatement ps0 = con.prepareStatement(sql0);
                 //ps0.setString(1, dist);
                 //ps0.setString(2, block);
                // ps0.setString(2, "Collector");
                
                 ResultSet rs0=ps0.executeQuery();
                 if(rs0.next())
                 {
                     maxOrgId=rs0.getInt(1);
                     maxOrgId = maxOrgId+1;
                 }
                 else
                 {
                     maxOrgId = 601;
                 }
                 if(maxOrgId<=600)
                     maxOrgId=601;
                
                 
                 org_id=maxOrgId+"";
            }


            if(parent_org.equals("0"))
                parent_org="300";
            
            String parent_org_name="";
             String sql5="Select govt_dept from org_regd where org_id=?";
                 PreparedStatement ps5 = con.prepareStatement(sql5);
                 ps5.setString(1, parent_org);
                
                 ResultSet rs5=ps5.executeQuery();
                 if(rs5.next())
                 {
                     parent_org_name=rs5.getString(1);
                 }
                 
            
            String sql = "Insert into org_regd(govt_dept,dist,block,address,pincode,authority,status,contact_no,email_id,org_id,parent_org,org_type)"
                    + " values(?,?,?,?, ?,?,?,?, ?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, govt_dept);
            ps.setString(2, dist);
            ps.setString(3, block);
            ps.setString(4, address);
            ps.setString(5, pincode);
            ps.setString(6, authority);
            ps.setString(7, status);
            ps.setString(8, contact_no);
            ps.setString(9, email_id);
            ps.setString(10, org_id);
            ps.setString(11, parent_org);
            ps.setString(12, org_type);
            int row = ps.executeUpdate();
            out.println(row + " row inserted");
            if (row >0) {
                request.setAttribute("govt_dept", govt_dept);
                request.setAttribute("org_id", org_id);
                request.setAttribute("parent_org", parent_org);
                request.setAttribute("parent_org_name", parent_org_name);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/SuccessOrgRegd.jsp");
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/RegisterOrganization.jsp");
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
