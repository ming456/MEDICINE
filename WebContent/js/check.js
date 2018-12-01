 function checkcsex()
  {

	  var csexNum = document.getElementsByName("csex");
	  var csex = "" ;

	  for(var i=0;i<csexNum.length;++i)
	  {
		 
		  if(csexNum[i].checked)
		  	csex = csexNum[i].value;
	  }
	  if( csex == "")
	  {
		  document.getElementById("tips_csex").innerHTML = "<em style='color:#FF0000'>* 至少选择一项</em>";   
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_csex").innerHTML = "OK！"; 
	  }
  }
  
  function checkForm()
  {  
	  if(document.getElementById("txtcno").value.length < 6 ||document.getElementById("txtcno").value.length > 18 )
	  {
	 		 //设置id为tips_username的<span>的HTML，显示错误信息
			 document.getElementById("tips_cno").innerHTML = "<em style='color:red'>用户名由6-18个字符组成</em>";
			 document.getElementById("txtcno").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_cno").innerHTML ="OK！";	
	  }
	  
	  
	  var reg3= /^[\u4e00-\u9fa5]{2,4}/;
	  if(document.getElementById("txtUser").value.length < 2||reg3.test(document.getElementById("txtUser").value)
			  ||document.getElementById("txtUser").value.length >4)
	  {
	 		 
			 document.getElementById("tips_cname").innerHTML = "<em style='color:#FF0000'>顾客名为2-4汉字</em>";
			 document.getElementById("txtUser").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_cname").innerHTML ="OK！";	
	  }
	  
	  if(document.getElementById("txtano").value.length < 2||reg3.test(document.getElementById("txtano").value)
			  ||document.getElementById("txtano").value.length >4)
	  {
	 		 
			 document.getElementById("tips_ano").innerHTML = "<em style='color:#FF0000'>经办人的编号为2-4字符</em>";
			 document.getElementById("txtano").focus();
			 return false;
	  }
	  else
	  {
			document.getElementById("tips_ano").innerHTML ="OK！";	
	  }
	  
	  //�绰����
	  var reg =  /^1[3|4|5|7|8][0-9]\\d{8}+$/;
	  //�жϵ绰���ȣ��Ƿ���Ϲ���
	  if(document.getElementById("txtphone").value.length !=11 || 
	  						reg.test(document.getElementById("txtphone").value) )
	  {	
			document.getElementById("tips_phone").innerHTML= "<em style='color:#FF0000'>* 手机号码为11位并符合国际</em>"
			document.getElementById("txtphone").focus();
			return false;  
	  }
	  else
	  {
		 document.getElementById("tips_phone").innerHTML = "OK！"; 
	  }
	  
	 

	  var regs =  /^[0-9][0-9][0-9]+$/;
	
	  if(document.getElementById("txtcage").value.length < 1 ||document.getElementById("txtcage").value.length > 3 || 
	  						regs.test(document.getElementById("txtcage").value) )
	  {	
			document.getElementById("tips_cage").innerHTML= "<em style='color:#FF0000'>*年龄由1-3数字组成</em>"
			document.getElementById("txtcage").focus();
			return false;  
	  }
	  else
	  {
		 document.getElementById("tips_cage").innerHTML = "OK！"; 
	  }

	  if(document.getElementById("tips_date").value == "")
	  {
		  document.getElementById("tips_date").innerHTML = "<em style='color:#FF0000'>* 录入日期不能为空</em>";
		  document.getElementById("txtdate").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_date").innerHTML = "OK！";
	  }
	   
	  if(document.getElementById("txtcremark").value.length > 100)
	  {
		  
		  document.getElementById("tips_cremark").innerHTML = "<em style='color:#FF0000'>* 字数不超过100字</em>";
		  document.getElementById("txtcremark").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_cremark").innerHTML = "OK！"
	  }
	  

	  if(document.getElementById("txtaddress").value.length > 40)
	  {
		  
		  document.getElementById("tips_address").innerHTML = "<em style='color:#FF0000'>*地址不能超过40字符</em>";
		  document.getElementById("txtaddress").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_address").innerHTML = "OK！"
	  }
	  
	  
	  if(document.getElementById("tips_mno").value.length > 40)
	  {
		  
		  document.getElementById("tips_mno").innerHTML = "<em style='color:#FF0000'>* 字数不能超过100个字</em>";
		  document.getElementById("txtmno").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_mno").innerHTML = "OK！"
	  }
	  
	
	  if(document.getElementById("tips_csymptom").value.length > 40)
	  {
		  
		  document.getElementById("tips_csymptom").innerHTML = "<em style='color:#FF0000'>*不超过100个字</em>";
		  document.getElementById("txtcsymptom").focus();
		  return false;
	  }
	  else
	  {
		   document.getElementById("tips_csymptom").innerHTML = "OK!"
	  }
	  
	  
  }
