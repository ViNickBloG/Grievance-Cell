/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package grv.cell.beans;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author USER
 */
public class DBConnection {
    
    private Connection con;
    public Connection getConnection()
    {
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/grievance_resolution","root","");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
