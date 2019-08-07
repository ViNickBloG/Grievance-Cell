
function showBlockParent(id,id2)
{
	var val=document.getElementById(id).value
	var org_type=document.getElementById('org_type').value
	if(val=="" || val=="0")
		return;
            
	var imageSpin="<img src='icons/spinner20.gif' /> ";
	var imageTick="<img src='icons/tick.gif' /> ";
	var imageCross="<img src='icons/cross.gif' /> ";
	document.getElementById(id2+'Label').innerHTML=imageSpin;
	var xmlHttp;
	if (window.XMLHttpRequest)
	{ //FireFox,Opera,...
		xmlHttp=new XMLHttpRequest()
	}
	else if (window.ActiveXObject)
	{   //IE 6 & below
		xmlHttp=new ActiveXObject("Microsoft.XMLHTTP")
	}
	else if(window.ActiveXObject)
	{ //IE 7.0 & above
		xmlHttp=new  ActiveXObject("Msxml2.XMLHTTP")
	}
	if(xmlHttp==null)
	{
		return;
	}
	//var url="ShowSubject"
        var url= "AjaxShowBlockParent";
	url=url+"?dist="+val
	url=url+"&id="+id2
	url=url+"&org_type="+org_type
	url=url+"&sid="+Math.random()
	//alert(url)
        
        xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
        
	xmlHttp.onreadystatechange=function(){ 
		if(xmlHttp.readyState==4) 
		{ 
                    var output=xmlHttp.responseText;
                    output= output.replace("\r\n", "");
                    output= output.replace("\n", "");
                    output= output.replace("<br/>", "");
                    //output= output.replace("<br/>", "");
                    
                   var data=output.split("$");
                   
                    //alert(output)
                    document.getElementById(id2+'Label').innerHTML=data[0];
                    document.getElementById('parent_org').value=data[1];
                    
                }
	}
	
}
