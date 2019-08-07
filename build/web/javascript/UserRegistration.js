function checkForm(frm)
{
    
   var regs=/^[a-zA-Z]*$/
	var regssp=/^[a-zA-Z\s]*$/
	var regno=/^[0-9]*$/
	var regsno=/^[a-zA-Z0-9]*$/
	var regsnosp=/^[a-zA-Z0-9\s]*$/
	var regemail=/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
        
        
	clearMessage(frm);
	var flag=true;
	var name=frm.name.value;
	var dob=frm.dob.value;
	var gender=frm.gender;
	var category=frm.category;
	var type=frm.type;
	var dist=frm.dist.value;
	var block=frm.block.value;
	//var panchayat=frm.panchayat.value;
	var village=frm.village.value;
	var address=frm.address.value;
	var pincode=frm.pincode.value;
	var mobileno=frm.mobileno.value;
	var emailid=frm.emailid.value;
	var id_proof=frm.id_proof;
	var id_proof_no=frm.id_proof_no.value;
	var photo=frm.photo.value;
	var password=frm.password.value;
	var confirmpassword=frm.confirmpassword.value;
	var captcha=frm.captcha.value;
	if(name=="")
	{
		showMessage(frm.name, "Name can't be left blank");
		flag=false;
	}
	if(dob=="")
	{
		showMessage(frm.dob, "Dob can't be left blank");
		flag=false;
	}
	if(dob!="")
	{
		var dt=dob.split("-");
		var today = new Date();
		var age=today.getFullYear()-parseInt(dt[0]);
		if( age < 18 ) {
			showMessage(frm.dob, "Invalid DOB; Min. age must be 18 ");
				flag=false;
		}
	}
	var genderFlag=false
	for(var i=0;i<gender.length;i++)
	{
		if(gender[i].checked==true){
                    genderFlag=true;
                    break;
		}
	}
	if(!genderFlag)
	{
		showMessage1(frm.gender, "Select Gender");
		flag=false;
	}        
	if(category.selectedIndex==0)
	{
		//showMessage(frm.category,"Select Category" );
                document.getElementById("categoryL").innerHTML="Select Category";                
		flag=false;
	}
	if(type.selectedIndex==0)
	{
		//showMessage(frm.type, "Select Type");
                document.getElementById("typeL").innerHTML="Select Type";  
		flag=false;
	}
	if(dist=="")
	{
		//showMessage(frm.dist, "Select Dist");
                document.getElementById("distL").innerHTML="Provide District";  
		flag=false;
	}
        else if(!regssp.test(dist)){
            document.getElementById("distL").innerHTML="District must be character only";  
		flag=false;
        }
	if(block=="")
	{
		showMessage(frm.block, "Select City/Block");
		flag=false;
	}
	else if(!regssp.test(block)){
            showMessage(frm.block, "Select City/Block");
            flag=false;
        }
	if(village=="")
	{
		showMessage(frm.village, "Select Area/Village");
		flag=false;
	}
        else if(!regssp.test(village)){
            showMessage(frm.village, "Select Area/Village");
		flag=false;
        }
	if(address=="")
	{
		showMessage(frm.address, "Address can't be left blank");
		flag=false;
	}
	if(pincode=="")
	{
		showMessage(frm.pincode, "Pincode can't be left blank");
		flag=false;
	}
	if(pincode!="" && pincode.length<5 || pincode.length>7)
	{
		showMessage(frm.pincode, "Pincode length must between 5 and 7 digit");
		flag=false;
	}
	if(pincode!="" && !regno.test(pincode))
	{
		showMessage(frm.pincode, "Pincode must contain digit only");
		flag=false;
	}
	if(mobileno=="")
	{
		showMessage(frm.mobileno, "Mobileno can't be left blank");
		flag=false;
	}
	if(mobileno!="" && mobileno.length<10 || mobileno.length>10)
	{
		showMessage(frm.mobileno, "Mobileno length must be 10 digit");
		flag=false;
	}
	if(mobileno!="" && !regno.test(mobileno))
	{
		showMessage(frm.mobileno, "Mobileno must be digit only");
		flag=false;
	}
	if(emailid=="")
	{
		showMessage(frm.emailid, "Emailid can't be left blank");
		flag=false;
	}
	if(emailid!="" && !regemail.test(emailid))
	{
		showMessage(frm.emailid, "Invalid Email address");
		flag=false;
	}
	if(id_proof.selectedIndex==0)
	{
		showMessage(frm.id_proof, "Select IdProof");
		flag=false;
	}
	if(id_proof_no=="")
	{
		showMessage(frm.id_proof_no, "IdProofNo can't be left blank");
		flag=false;
	}
	if(password=="")
	{
		showMessage(frm.password, "Password can't be left blank");
		flag=false;
	}
	if(confirmpassword=="")
	{
		showMessage(frm.confirmpassword, "Confirmpassword can't be left blank");
		flag=false;
	}
	if(confirmpassword!=password)
	{
		showMessage(frm.confirmpassword, "Confirmpassword doesn't match");
		flag=false;
	}
	if(captcha=="")
	{
		showMessage(frm.captcha, "Captcha can't be left blank");
		flag=false;
	}
	if(captcha!="" && !regsno.test(captcha))
	{
		showMessage(frm.captcha, "Captcha must contain character and digit only");
		flag=false;
	}
	return flag;
}
