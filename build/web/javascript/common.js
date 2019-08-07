/*
Copyright (c) 2012 Tusarkant Sahoo (trytusar@gmail.com | javapoint.net)
*/

	var regs=/^[a-zA-Z]*$/
	var regssp=/^[a-zA-Z\s]*$/
	var regno=/^[0-9]*$/
	var regsno=/^[a-zA-Z0-9]*$/
	var regsnosp=/^[a-zA-Z0-9\s]*$/
	var regemail=/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/

	function showMessage(obj,msg)
	{
		if(obj.length>1)
		obj=obj[obj.length-1];
		var child=obj;
		var parent=child.parentNode;
		var errorElm=document.createElement('span');
		errorElm.setAttribute("class", "error");
		errorElm.appendChild(document.createTextNode(msg));
		parent.insertBefore(errorElm,child.nextSibling);
		//parent.insertBefore(errorElm,child.nextSibling.nextSibling);
	}
        function showMessage1(obj,msg)
	{
		if(obj.length>1)
		obj=obj[obj.length-1];
		var child=obj;
		var parent=child.parentNode;
		var errorElm=document.createElement('span');
		errorElm.setAttribute("class", "error");
		errorElm.appendChild(document.createTextNode(msg));
		//parent.insertBefore(errorElm,child.nextSibling);
		parent.insertBefore(errorElm,child.nextSibling.nextSibling);
	}
	function clearMessage(frm)
	{
		var spans=frm.getElementsByTagName('span');
		for(var i=0;i<spans.length;i++)
		{
			spans[i].innerHTML="";
		}
	}
