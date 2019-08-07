<%-- 
    Document   : RegisterOrganization
    Created on : 9 Apr, 2013, 1:57:30 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="javascript/show_dist_org.js"></script>
        <script type="text/javascript" src="javascript/show_block_org.js"></script>
        
        <script type="text/javascript" >
            function displayBlock(id)
            {
                var ind=document.getElementById(id).selectedIndex;
                
                if(ind>=4)
                    {
                        showDistOrg();
                    }
                
                   
                  if(ind<4)
                  {
                      document.getElementById('dist').selectedIndex=0;                         
                      document.getElementById('block').selectedIndex=0;   
                      document.getElementById('dist').style.display='none';  
                      //document.getElementById('distText').style.display='none';  
                      //document.getElementById('blockText').style.display='none';    
                      document.getElementById('blockLabel').style.display='none';  
                      
                  }
                  else if(ind==4 || ind==5)
                  {
                      document.getElementById('dist').selectedIndex=0;                         
                      document.getElementById('block').selectedIndex=0;   
                     // document.getElementById('distText').style.display='block';  
                      document.getElementById('dist').style.display='block'; 
                      
                     // document.getElementById('blockText').style.display='none';    
                      document.getElementById('blockLabel').style.display='none';   
                  }
                  else if(ind==6)
                  {
                      document.getElementById('dist').style.display='block'; 
                      //document.getElementById('distText').style.display='block';                          
                      //document.getElementById('blockText').style.display='block';                          
                      document.getElementById('blockLabel').style.display='block';                          
                  }
                  
            }
            
        </script>
        <%@ include file="common/head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="common/ubody.jsp" %>
       <form action="RegisterOrganization" method="post" name="RegisterOrganization">
           <table width="700" border="0" class="table1">
  <tr>
    <th colspan="3" scope="col">ORGANIZATION REGISTRATION</th>
    </tr>
  <tr>
    <th width="200">Org. Type</th>
    <td width="300"><label>
            <select name="org_type" id="org_type" onchange="showDistOrg()">
                <option value="">Select</option>
                <option>Collector</option>
                <option>Sub-Collector</option>
                <option>BDO</option>
            </select>
    </label></td>
    <td width="200">&nbsp;</td>
  </tr>
  <tr>
    <th width="127">Name of org</th>
    <td width="224"><label>
      <input type="text" name="govt_dept" id="textfield" />
    </label></td>
    <td width="164">&nbsp;</td>
  </tr>
  <tr>
    <th>District</th>
    
    <td>
        <label id="distLabel">
        <select name="dist" id="dist" onchange="showBlockOrg('dist','block')">
       <option selected="selected" value="0" >--Select--</option>
        
      </select>
        </label>
      <span class="error" id="distL"></span>
      
       
        
    </td>
    <td>choose Dist if District Level Organization</td>
  </tr>
  <tr>
    <th>Block</th>
    <td><label id="blockLabel" style="">
              <select name="block" id="block" >
                  <option selected="selected" value="0">--Select--</option>
              </select>
          </label>
          <span class="error" id="blockL"></span>
         
    </td>
    <td>choose Block if Block Level Organization</td>
  </tr>
   <tr>
    <th>Address</th>
    <td><label>
      <textarea name="address" id="textarea" cols="45" rows="5"></textarea>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Pincode</th>
    <td><label>
      <input type="text" name="pincode" id="textfield3" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Authority of Org</th>
    <td><label>
      <input type="text" name="authority" id="textfield4" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Status</th>
    <td><label>
      <input name="status" type="radio" id="radio" value="activate" checked="checked" />Activate
        </label><label><input name="status" type="radio" value="deactivate" />Deactivate
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>Contact No</th>
    <td><label>
      <input type="text" name="contact_no" id="textfield5" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>email_id</th>
    <td><label>
      <input type="text" name="email_id" id="textfield6" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <th>&nbsp;</th>
    <td><label>
      <input type="Submit" name="submit" id="button" value="SUBMIT" />&nbsp;&nbsp;&nbsp;&nbsp;
      <input type="Reset" name="reset" id="button" value="RESET" />
    </label></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
        <%@ include file="common/lbody.jsp" %>
    </body>
</html>
