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
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author arun
 */
public class PGOLogin extends HttpServlet {
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
         boolean flag=false;
         try 
        {
           String pgo_regd_id=request.getParameter("pgo_regd_id");
           String password=request.getParameter("password");
           
           HttpSession session =request.getSession();
           
           con=new DBConnection().getConnection();
           String sql="Select pgo_name,password,govt_dept,org_id,parent_org,status from pgo_regd where pgo_regd_id=? ";
           PreparedStatement ps = con.prepareStatement(sql);
           ps.setString(1, pgo_regd_id);
           ResultSet rs = ps.executeQuery();
           if(rs.next())
           {
               int status=rs.getInt("status");
               String dbpass=rs.getString("password").trim();
                   
               if(dbpass.equals(password))
               {
                   int id=1;
                   if(pgo_regd_id.contains("/"))
                   {
                       String ids[]=pgo_regd_id.split("/");
                       id=Integer.parseInt(ids[0]);
                   }

                   session.setAttribute("id", id);
                   String name=rs.getString("pgo_name").trim();
                   String govt_dept=rs.getString("govt_dept").trim();
                   String org_id=rs.getString("org_id");
                   String parent_org=rs.getString("parent_org");


                   String sql1="Select dist,block from org_regd where org_id=? ";
                   PreparedStatement ps1 = con.prepareStatement(sql1);
                   ps1.setString(1, org_id);
                   ResultSet rs1 = ps1.executeQuery();
                   String dist="";
                   String block="";
                   if(rs1.next())
                   {
                       dist=rs1.getString("dist");
                       block=rs1.getString("block");
                   }

                   if(parent_org==null)
                       parent_org="0";
                   if(status==1)
                   {

                       session.setAttribute("name", name);
                       session.setAttribute("pgo_regd_id", pgo_regd_id);
                       session.setAttribute("govt_dept", govt_dept);
                       session.setAttribute("role", "pgo");
                       session.setAttribute("parent_org", parent_org);
                       session.setAttribute("org_id", org_id);
                       session.setAttribute("dist", dist);
                       session.setAttribute("block", block);

                       System.out.println("===="+(String)session.getAttribute("pgo_regd_id"));
                       flag=true;
                   }
                   else
                   {
                       flag=false;
                       request.setAttribute("status1", "Your account has been blocked");
                   }
               }
               else
               {
                   flag=false;
                   request.setAttribute("status1", "Invalid userid/password");
               }
               
           }//end: if(rs.next()
           else
           {
               request.setAttribute("status1", "Invalid userid/password");
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
        
        if(flag)
        {
            response.sendRedirect("PgoHome.jsp");
        }
        else
        {
            
            RequestDispatcher rdf= getServletContext().getRequestDispatcher("/index.jsp");
            rdf.forward(request, response);
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
