function checkForm(frm)
{
	clearMessage(frm);
	var flag=true;
	var govt_dept=frm.govt_dept;
	var dist=frm.dist;
	var block=frm.block;
	var lg_dist=frm.lg_dist;
	var lg_block=frm.lg_block;
	var lg_panchayat=frm.lg_panchayat;
	var lg_village=frm.lg_village;
	var nature=frm.nature;
	var grv_details=frm.grv_details.value;
	var action_suggested=frm.action_suggested.value;
	var file=frm.file.value;
	if(govt_dept.selectedIndex==0)
	{
		//showMessage(frm.govt_dept, "Select GovtDept");
                document.getElementById("govt_deptL").innerHTML="Select GovtDept";  
		flag=false;
	}
        if(govt_dept.selectedIndex>3)
	{
           if(dist.selectedIndex==0)
            {
                    //showMessage(frm.dist, "Select Dist");
                    document.getElementById("distL").innerHTML="Select District";  
                    flag=false;
            } 
        }
        if(govt_dept.selectedIndex==6)
	{
            if(block!=undefined)
            {
                
               if(block.selectedIndex==0)
                {
                        //showMessage(frm.dist, "Select Dist");
                        document.getElementById("blockL").innerHTML="Select Block";  
                        flag=false;
                } 
            }
        }
	
	if(lg_dist.selectedIndex==0)
	{
		//showMessage(frm.lg_dist, "Select LgDist");
                document.getElementById("lg_distL").innerHTML="Select Lg. Distict";  
		flag=false;
	}
	if(lg_block.selectedIndex==0)
	{
		showMessage(frm.lg_block, "Select LgBlock");
		flag=false;
	}
	if(lg_panchayat.selectedIndex==0)
	{
		showMessage(frm.lg_panchayat, "Select LgPanchayat");
		flag=false;
	}
	if(lg_village.selectedIndex==0)
	{
		showMessage(frm.lg_village, "Select LgVillage");
		flag=false;
	}
	if(nature.selectedIndex==0)
	{
		//showMessage(frm.nature, "Select Nature");
                document.getElementById("natureL").innerHTML="Select Nature";
		flag=false;
	}
	if(grv_details=="")
	{
		showMessage(frm.grv_details, "GrvDetails can't be left blank");
		flag=false;
	}
	
	return flag;
}
