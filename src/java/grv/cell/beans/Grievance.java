/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author arun
 */
public class Grievance {
    
    Connection con;
    
    public String  getUserRegdId(String grv_regd_id)
    {
        String user_regd_id="";
        
        try
        {
            if(con==null)
            con = new DBConnection().getConnection();
            String sql1 = "Select user_regd_id from grv_regd where grv_regd_id=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);           
           
            ps1.setString(1, grv_regd_id);
            ResultSet rs =ps1.executeQuery();
            if(rs.next())
            {
                user_regd_id=rs.getString(1);
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return user_regd_id;
    }
    
    public boolean getGrievanceStatus(String grv_regd_id,String govt_dept)
    {
        boolean flag=false;
        
        try
        {
            if(con==null)
            con = new DBConnection().getConnection();
            String sql1 = "Select * from grv_status where grv_regd_id=? and govt_dept=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);           
           
            ps1.setString(1, grv_regd_id);
            ps1.setString(2, govt_dept);
            ResultSet rs =ps1.executeQuery();
            if(rs.next())
            {
                flag=true;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    
    public void updateGrievanceStatus(String grv_regd_id,String action_taken_by,String decision,String subordinate_org,String pgo_regd_id)
    {
        decision=decision.toLowerCase();
        
        
        String status="Pending";
        
        try
        {
            if(con==null)
            con = new DBConnection().getConnection();
            
            if(decision.contains("dispose"))
            {
                status="Disposed";
                String sql = "update grv_status set received_by=?,status=? where grv_regd_id=? and status=? ";
               // String sql = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                PreparedStatement ps = con.prepareStatement(sql); 
                ps.setString(1, pgo_regd_id);
                ps.setString(2, status);           
                ps.setString(3, grv_regd_id);            
                ps.setString(4, "Pending");            
                int x=ps.executeUpdate();
                System.out.println(x+" grv updated");
            }
            else
            {
                String sql = "update grv_status set status=? where grv_regd_id=? and status=? ";
                PreparedStatement ps = con.prepareStatement(sql); 
                //ps.setString(1, pgo_regd_id);
                ps.setString(1, status);           
                ps.setString(2, grv_regd_id);            
                ps.setString(3, "New");            
                int x=ps.executeUpdate();
                System.out.println(x+" grv updated");
            }
            
            
            if(decision.contains("forward"))
            {
                boolean flag=getGrievanceStatus(grv_regd_id,subordinate_org);
                if(!flag)
                {
                   // initGrievanceStatus(grv_regd_id, subordinate_org);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
    }

    public void disposeGrievanceStatus(String grv_regd_id,String pgo_regd_id)
    {
         
        try
        {
            if(con==null)
            con = new DBConnection().getConnection();
            
             
                String sql1 = "update grv_status set status=? where grv_regd_id=? and received_by=? ";
                PreparedStatement ps1 = con.prepareStatement(sql1); 
                
                ps1.setString(1, "Disposed");           
                ps1.setString(2, grv_regd_id);
                ps1.setString(3, pgo_regd_id);   
                int x=ps1.executeUpdate();
                
                String sql = "update grv_regd set grv_status=? where grv_regd_id=?";
                PreparedStatement ps = con.prepareStatement(sql); 
               
                ps.setString(1, "Disposed");           
                ps.setString(2, grv_regd_id);    
                int y=ps.executeUpdate();
                System.out.println(x+" grv updated "+y);
           
          
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
    }


    public int initGrievanceStatus(String grv_regd_id,String govt_dept,String pgo_regd_id)
    {
        int row=0;
        
           
        
        try
        {
            if(govt_dept!=null)
            {
                if(con==null)
                con = new DBConnection().getConnection();
                String sql1 = "insert into grv_status (grv_regd_id,govt_dept,received_by,status) values(?,?,?,?)";
                PreparedStatement ps1 = con.prepareStatement(sql1);           

                ps1.setString(1, grv_regd_id);
                ps1.setString(2, govt_dept);           
                ps1.setString(3, pgo_regd_id);           
                ps1.setString(4, "New");
                row=ps1.executeUpdate();
            }
            
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return row;
    }
/* ============================================  */
    
     public String getPendingGrievance(String pgo_regd_id)
    {
        int level=0;
        String grv_regd_ids="";
        try
        {
            String sql1 = "Select * from grv_status where received_by1=? or received_by2=? or received_by3=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setString(1, pgo_regd_id);
            ResultSet rs =ps1.executeQuery();
            if(rs.next())
            {
                level=rs.getInt("level");
                String grv_regd_id=rs.getString("grv_regd_id");
                String received_by1=rs.getString("received_by1");
                String received_by2=rs.getString("received_by2");
                String received_by3=rs.getString("received_by3");
                
                if(received_by3.equals(pgo_regd_id))
                    grv_regd_ids=","+grv_regd_ids;
                
                if(level==4)
                {
                    
                }
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return grv_regd_ids;
    }
    
     
     public boolean getGrievanceStatus1(String grv_regd_id)
    {
        boolean flag=false;
        
        try
        {
            String sql1 = "Select * from grv_status where grv_regd_id=?";
            PreparedStatement ps1 = con.prepareStatement(sql1);           
           
            ps1.setString(1, grv_regd_id);
            ResultSet rs =ps1.executeQuery();
            if(rs.next())
            {
                flag=true;
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return flag;
    }
}
