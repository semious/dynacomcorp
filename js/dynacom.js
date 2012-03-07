function expandCat(obj){
	if(obj.parentNode.getElementsByTagName("ul")[0].style.display=="none"){
		obj.parentNode.getElementsByTagName("ul")[0].style.display="block";
	}else{
		obj.parentNode.getElementsByTagName("ul")[0].style.display="none";
	}
}

$(document).ready(function(){
	$('a').focus(function(){
		this.blur();
	});
	
//	$('input[@type="text"]').focus(function(){
//		$(this).css('backgroundColor','#f4eac5');
//		$(this).css('border','1px solid #7f9db9');
//	});

//	$('input[@type="text"]').blur(function(){
//		$(this).css('backgroundColor','transparent');
//		$(this).css('border','1px solid #7f9db9');
//	});

	$('.a_show_cat').click(function(){
		var id = $(this).attr('id');
		$(this).next().slideToggle(function(){
			if($(this).css('display')!='none'){
				if($.cookie('nav_trace')){
					var flag = 0;
					var items = $.cookie('nav_trace').split(',');
					for(var i in items){
						if(items[i]==id){
							flag=1;
							break;
						}
					}
					flag?'':items.push(id);
					$.cookie('nav_trace',items.toString(),{expires: 360});
				}else{
					$.cookie('nav_trace',id,{expires: 360});
				}
			}else{
				if($.cookie('nav_trace')){
					var flag = 0;
					var items = $.cookie('nav_trace').split(',');
					var temp_array =[];
					for(var i in items){
						if(items[i]!=id){
							temp_array.push(items[i]);
						}
					}
					$.cookie('nav_trace',temp_array.toString(),{expires: 360});
				}
			}
		});
	});
	
	if($.cookie('nav_trace')){
		var items = $.cookie('nav_trace').split(',');
		for(var i in items){
			$('#'+items[i]).next().show();	
		}
	}
});

function MoveLayer(layerName){
//var diff = (document.body.scrollTop + y - document.all.AdLayer.style.posTop)*.40;
//var y = document.body.scrollTop + y - diff;
//eval("document.all." + layerName + ".style.top = y");
//eval("document.all." + layerName + ".style.left = x");//ƶ
//scroll(500,1000);

}

function popupWindow(){
    $.blockUI({
        message:$('#surveyMonkeyInfo'),
        width:500,
        height:354
    });
//    $.blockUI();
}

