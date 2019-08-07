
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="grv.cell.beans.DBConnection"%>
<%
String org_id=request.getParameter("org_id");

Connection con=new DBConnection().getConnection();
String sql="select dist,block from org_regd where org_id='"+org_id+"'";
PreparedStatement ps=con.prepareStatement(sql);

        ResultSet rs=ps.executeQuery();
	if(rs.next()){
            String dist=rs.getString("dist");
            String block=rs.getString("block");
            if(dist==null)
                dist="0";
            if(block==null)
                block="0";
            out.print(dist+"$"+block);
        }
        else{
             out.print("0$0");
        }
            
%>
