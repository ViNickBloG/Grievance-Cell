
function showBlock(id,id2)
{
	var govt_dept="";
	if(document.getElementById("govt_dept")!=undefined)
	govt_dept=document.getElementById("govt_dept").value
	
        var val=document.getElementById(id).value
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
        var url= "AjaxShowBlock";
	url=url+"?dist="+val
	url=url+"&id="+id2
        //url=url+"&govt_dept="+govt_dept
	url=url+"&sid="+Math.random()
	//alert(url)
        
        xmlHttp.open("GET",url,true)
	xmlHttp.send(null)
        
	xmlHttp.onreadystatechange=function(){ 
		if(xmlHttp.readyState==4) 
		{ 
                    var output=xmlHttp.responseText;
                    //alert(output)
                    document.getElementById(id2+'Label').innerHTML=output
                }
	}
	
}
