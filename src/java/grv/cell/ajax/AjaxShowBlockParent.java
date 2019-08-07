/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.ajax;

import grv.cell.beans.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author arun
 */
public class AjaxShowBlockParent extends HttpServlet {
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
           
            String dist=request.getParameter("dist").trim();
            String id=request.getParameter("id").trim();
            String org_type=request.getParameter("org_type").trim();
           
             con=new DBConnection().getConnection();
            String sql="select block_name from blocks where district=?";
            //String sql1="select block_name from blocks where district='"+dist+"'";
            //System.out.println("==============="+sql1);
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, dist);  
            
            ResultSet rs=ps.executeQuery();   
            
            //String output="<select name='block' id=\"block\" onchange=\"showPanchayat('block','panchayat')\" >";
            String output="<select name='"+id+"' id='"+id+"' onchange=\"showPanchayat('"+id+"','panchayat')\" >";
            if(id.startsWith("lg"))
                output="<select name='"+id+"' id='"+id+"' onchange=\"showPanchayat('"+id+"','lg_panchayat')\" >";
                output+="<option value=\"0\">Select</option>";
                
            while(rs.next())            
            {
                String scode= rs.getString(1);
                String sname= rs.getString(1);
                 output+="<option value=\""+scode+"\">"+sname+"</option>";
            }
            output+="</select>";
            
            //[ {"optionValue": 0, "optionDisplay": "Mark"}, {"optionValue":1, "optionDisplay": "Andy"}, {"optionValue":2, "optionDisplay": "Richard"}]
           
            //out.print(output);
            
            int parent_org=300;
                String sql00="Select max(CONVERT(org_id, SIGNED INTEGER)) from org_regd where dist=? and org_type=?";
                 PreparedStatement ps00 = con.prepareStatement(sql00);
                 ps00.setString(1, dist);
                 ps00.setString(2, "Collector");
                
                 ResultSet rs00=ps00.executeQuery();
                 if(rs00.next())
                 {
                     parent_org=rs00.getInt(1);
                     
                 }
                 else
                 {
                     parent_org = 300;
                 }
                 
             out.print(output+"$"+parent_org);    
            
           // System.out.print(output);
            
            
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
