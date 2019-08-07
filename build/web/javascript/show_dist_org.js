
function showDistOrg()
{
    var id="org_type";
	var val=document.getElementById(id).value
	if(val=="" || val=="0")
		return;
            
            var id2="dist";
            
	var imageSpin="<img src='icons/spinner20.gif' /> ";
	var imageTick="<img src='icons/tick.gif' /> ";
	var imageCross="<img src= 'icons/cross.gif' /> ";
	//document.getElementById(id2+'Label').innerHTML=imageSpin;
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
        var url= "AjaxShowDistOrg";
	url=url+"?org_type="+val
	url=url+"&sid="+Math.random()
	/alert//(url)
        
        xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
        
	xmlHttp.onreadystatechange=function(){ 
		if(xmlHttp.readyState==4) 
		{ 
                    var output=xmlHttp.responseText;
                    //alert(output)
                    document.getElementById('distLabel').innerHTML=output
                }
	}
	
}
