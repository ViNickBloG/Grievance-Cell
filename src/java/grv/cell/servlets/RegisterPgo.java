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



/**
 *
 * @author USER
 */
public class RegisterPgo extends HttpServlet {

    private Connection con;

    
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             String pgo_name = request.getParameter("pgo_name");
             String dist = request.getParameter("dist");
             String block = request.getParameter("block");
             String pgo_address = request.getParameter("pgo_address");
             String dob = request.getParameter("dob");
             String org_id = request.getParameter("org_id");
             String designation = request.getParameter("designation");
             String mob_no = request.getParameter("mob_no");
             String email_id = request.getParameter("email_id");
             String photo = request.getParameter("photo");
             String gender = request.getParameter("gender");
             String password = request.getParameter("password");
             String pgo_regd_id="";
             String govt_dept="";
             String parent_org="";
             
             
            con = new DBConnection().getConnection();
             
            
            String sql11="Select parent_org,govt_dept from org_regd where org_id=?";
            PreparedStatement ps11 = con.prepareStatement(sql11);
            ps11.setString(1, org_id);
            ResultSet rs11=ps11.executeQuery();
            if(rs11.next())
            {
                parent_org=rs11.getString("parent_org");
                govt_dept=rs11.getString("govt_dept");
            }
            
            int count=0;
            
            String sql0="Select count(*) from pgo_regd where org_id=?";
            PreparedStatement ps0 = con.prepareStatement(sql0);
            ps0.setString(1, org_id);
            ResultSet rs0=ps0.executeQuery();
            if(rs0.next())
            {
                count=rs0.getInt(1);
            }
            count=count+1;
            
            String cnt=count+"";
            if(count<10)
                cnt="00"+count;
            else if(count<100)
                cnt="0"+count;
            
            pgo_regd_id=cnt+"/"+org_id;
                    
            String sql = "Insert into pgo_regd(pgo_name,dob,designation,pgo_address,mob_no,email_id,photo,gender,password,org_id,pgo_regd_id,govt_dept,parent_org)"
                    + " values(?,?,?,?, ?,?,?,?, ?,?,?,?, ? )";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pgo_name);
            ps.setString(2, dob);
            ps.setString(3, designation);
            ps.setString(4, pgo_address);
            ps.setString(5, mob_no);
            ps.setString(6, email_id);
            ps.setString(7, photo);
            ps.setString(8, gender);
            ps.setString(9, password);
            ps.setString(10, org_id);
            ps.setString(11, pgo_regd_id);
            ps.setString(12, govt_dept);
            ps.setString(13, parent_org);
            int row = ps.executeUpdate();
            out.println(row + " row inserted");
            if (row > 0) {
                
                            String message="Hello "+pgo_name;
                            message+="<br/>";
                            message+="Your Password: "+password;
                            message+="Your Department: "+govt_dept;
                            message+="<br/>";

                            //String link="<a href=\"http://localhost:8084/GrievanceCell/\"> Click here to Login </a> ";
                            try{
                            SendExternalEmail semail =new SendExternalEmail();
                           // semail.setLink(link);
                            semail.setReceiver(email_id);
                            semail.setSubject("e-Grievance Cell PGO Registrartion Successfull");
                           
                            semail.setMessage(message);

                            String msg=semail.sendEmail();
                            if(msg.equals("fail"))
                                out.println("Please check your Internet settings");
                            System.out.println(msg);

                            }catch(Exception e){
                                e.printStackTrace();
                            }
                            
                request.setAttribute("status", pgo_name+"---successfully registered with pgo registration id:"+pgo_regd_id);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminHome.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "ERROR:could not register");
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/RegisterPgo.jsp");
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
