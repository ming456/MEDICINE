function outExcel(){
	var mmodeNum = document.getElementsByName("aname");
	var table=document.all.pay;		//获取表格
	row=table.rows.length;			//获取表格的行数
	column=table.rows(1).cells.length;	//获取表格的列数
	var excelapp=new ActiveXObject("Excel.Application");	
	//excelapp.visible=true;
	objBook=excelapp.Workbooks.Add(); //添加新的工作簿
	var objSheet = objBook.ActiveSheet;	//获取活动工作表

	title=objSheet.Range("C1").MergeArea;  //合并单元格
	title.Cells(1,1).Value ="经办人";
	title.Cells(1,1).Font.Size =16;			//设置字的大小
	for(i=1;i<row+1;i++){
		for(j=0;j<column;j++){
		  objSheet.Cells(i+1,j+1).value=table.rows(i-1).cells(j).innerHTML.replace("&nbsp;","");
		}
	}
	k=k+1;
    objBook.SaveAs("D:/经办人"+mmodeNum+".xls");	//将生成的Excel自动保存到指定路径下
	excelapp.UserControl = true;		//自动打印
}