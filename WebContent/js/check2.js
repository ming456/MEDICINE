 function checkasex()
  {

	  var asexNum = document.getElementsByName("asex");
	  var asex = "" ;

	  for(var i=0;i<asexNum.length;++i)
	  {
		 
		  if(asexNum[i].checked)
		  	asex = asexNum[i].value;
	  }
	  if( asex == "")
	  {
		  document.getElementById("tips_asex").innerHTML = "<em style='color:#FF0000'>* 至少选择一项</em>";   
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_asex").innerHTML = "OK！"; 
	  }
  }
  
  function checkForm2()
  {  
	  var reg2 =  /^[0-9]{1,}+$/;
	  
	  if(document.getElementById("txtano").value.length <1||document.getElementById("txtano").value.length>6
			  ||reg2.test(document.getElementById("txtano").value))
	  {
	 		 
			 document.getElementById("tips_ano").innerHTML = "<em style='color:#FF0000'>* 数字为1-6位</em>";
			 document.getElementById("txtano").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_ano").innerHTML ="OK！";	
	  }
	  
	  var reg3= /^[\u4e00-\u9fa5]{1,}+$/;
	  if(document.getElementById("txtaname").value.length < 2||reg3.test(document.getElementById("txtaname").value)
			  ||document.getElementById("txtaname").value.length >4)
	  {
	 		 
			 document.getElementById("tips_aname").innerHTML = "<em style='color:#FF0000'>顾客名为2-4汉字</em>";
			 document.getElementById("txtaname").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_aname").innerHTML ="OK！";	
	  }
	  
	  var reg =  /^1[3|4|5|7|8][0-9]\\d{8}+$/;
	  if(document.getElementById("txtaphone").value.length !=11 || 
	  						reg.test(document.getElementById("txtaphone").value) )
	  {	
			document.getElementById("tips_aphone").innerHTML= "<em style='color:#FF0000'>* 手机号码不为11位或者不符合国际</em>"
			document.getElementById("txtaphone").focus();
			return false;  
	  }
	  else
	  {
		 document.getElementById("tips_aphone").innerHTML = "OK！"; 
	  }
	  
	   
	  if(document.getElementById("txtaremark").value.length > 100)
	  {
		  
		  document.getElementById("tips_aremark").innerHTML = "<em style='color:#FF0000'>* 字数不超过100字</em>";
		  document.getElementById("txtaremark").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_aremark").innerHTML = "OK！"
	  }
  }
		  
