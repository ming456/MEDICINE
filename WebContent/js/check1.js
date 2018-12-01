 function checkmmode()
  {

	  var mmodeNum = document.getElementsByName("mmode");
	  var mmode = "" ;

	  for(var i=0;i<mmodeNum.length;++i)
	  {
		 
		  if(mmodeNum[i].checked)
		  	mmode = mmodeNum[i].value;
	  }
	  if( mmode == "")
	  {
		  document.getElementById("tips_mmode").innerHTML = "<em style='color:#FF0000'>* 至少选择一项</em>";   
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_mmode").innerHTML = "OK！"; 
	  }
  }
  
  function checkForm1()
  {  
	  var reg2 =  /^[0-9]{1,}+$/;
	  
	  if(document.getElementById("txtmno").value.length <1||document.getElementById("txtmno").value.length>6
			  ||reg2.test(document.getElementById("txtmno").value))
	  {
	 		 
			 document.getElementById("tips_mno").innerHTML = "<em style='color:#FF0000'>* 数字为1-6位</em>";
			 document.getElementById("txtmno").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_mno").innerHTML ="OK！";	
	  }
	  
	  var reg3= /^[\u4e00-\u9fa5]{1,}+$/;
	  if(document.getElementById("txtmname").value.length < 2||reg3.test(document.getElementById("txtmname").value)
			  ||document.getElementById("txtmname").value.length >10)
	  {
	 		 
			 document.getElementById("tips_mname").innerHTML = "<em style='color:#FF0000'>药名为2-10汉字</em>";
			 document.getElementById("txtmname").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_mname").innerHTML ="OK！";	
	  }
	
	  if(document.getElementById("tips_mefficacy").value.length > 40)
	  {
		  
		  document.getElementById("tips_mefficacy").innerHTML = "<em style='color:#FF0000'>*不超过100个字</em>";
		  document.getElementById("txtmefficacy").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_mefficacy").innerHTML = "OK!"
	  }
	  
	  
  }
