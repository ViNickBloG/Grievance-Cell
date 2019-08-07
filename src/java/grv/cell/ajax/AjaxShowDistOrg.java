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
public class AjaxShowDistOrg extends HttpServlet {
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
           
            String org_type=request.getParameter("org_type").trim();
            //String id=request.getParameter("id").trim();
            
           
            String id="dist";
             con=new DBConnection().getConnection();
            String sql="Select dist from dist where dist not in (select distinct(dist) from org_regd where org_type=?)";
            PreparedStatement ps=con.prepareStatement(sql);
            ps.setString(1, org_type);  
            
            if(org_type.equalsIgnoreCase("Sub-Collector"))
            {
                sql="Select distinct(dist) from org_regd  where org_type='Collector' and dist not in (select distinct(dist) from org_regd where org_type=?)";
                ps=con.prepareStatement(sql);
                ps.setString(1, org_type);
            }
            else  if(org_type.equalsIgnoreCase("BDO"))
            {
               // sql="Select distinct(dist) from org_regd  where org_type='Sub-Collector' and dist not in (select distinct(dist) from org_regd where org_type=?)";
                sql="Select distinct(dist) from org_regd  where org_type='Sub-Collector'";
                ps=con.prepareStatement(sql);
                //ps.setString(1, org_type);
            }
            
            //System.out.println(ps);
            ResultSet rs=ps.executeQuery();   
            
            //String output="<select name='block' id=\"block\" onchange=\"showPanchayat('block','panchayat')\" >";
            String output="<select name='"+id+"' id='"+id+"' onchange=\"showBlockOrg('"+id+"','block')\" >";
            output+="<option value=\"0\">Select</option>";
                
            while(rs.next())            
            {
                String scode= rs.getString(1);
                String sname= rs.getString(1);
                 output+="<option value=\""+scode+"\">"+sname+"</option>";
            }
            output+="</select>";
            
            //[ {"optionValue": 0, "optionDisplay": "Mark"}, {"optionValue":1, "optionDisplay": "Andy"}, {"optionValue":2, "optionDisplay": "Richard"}]
           
            out.print(output);
            System.out.print(output);
            
            
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
