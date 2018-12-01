
function expandMenu(menu_id,img_id){
var menuObj = $("#"+menu_id);
var imgObj= $("#"+img_id);
if(menuObj.css("display") == 'none'){
menuObj.css('display',"");
imgObj.attr('src',"images/open.png");
}else{
		menuObj.css('display',"none");
imgObj.attr('src',"images/close.png");
}
}
