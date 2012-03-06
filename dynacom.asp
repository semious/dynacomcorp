<!--#include file="conn_access.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>
Dynacom - Affordable Quailty Network Cabling Products
</title>
<meta name="keywords" content="Dynacom, Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, cross, connect, connections, wire, management, backboard management, residential cabeling, structured wiring, home network management, structured cabling">
<meta name="description" content="Dynacom, is a manufacturer of Wire Management, 110 Cross Connect, Wire, Management, 110, Cross-connect, wire management, backboard management, residential cabling, structured wiring, home network management, structured cabling for the voice and data industries.">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script language="javascript" type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.cookie.js"></script>
<script language="javascript" type="text/javascript" src="js/dynacom.js"></script>

</head>
<body onselectstart="return false;">
	<div id="warp">
		<div id="head">
			<div id="company_icon"></div>
			<div id="company_banner">
				<!--#include file="inc/banner.inc" -->			
			</div>
			<ul id="navigator">
				<!--#include file="inc/navigator.inc" -->
				</ul>
			<div id="null"></div>
		</div>
		<div id="ibody">
			<div id="left_col"><!--#include file="inc/left_new.inc" --></div>
			<div id="main_col">
				<div id="main_pics">
				    <ul class="slide_show_container">
                        <li class="slide_show_item">
                            <!--<iframe width="350" height="208" src="http://www.youtube.com/embed/wau7jqDHZ5c?rel=0" frameborder="0" allowfullscreen></iframe>-->
                            <a href="http://youtu.be/wau7jqDHZ5c" target="_blank"><span class="video_play_large"></span><img style="border-radius: 5px;" width="350" src="http://img.youtube.com/vi/wau7jqDHZ5c/0.jpg"></a>
                        </li>
				        <li class="slide_show_item">
				            <img src="images/slideshow_demo1.jpg" />
				        </li>
				        <li class="slide_show_item"><a href="product.asp?id=XXXX" target="_blank"><img src="images/slideshow_demo2.jpg" /></a></li>
				        <li class="slide_show_item"><img src="images/slideshow_demo3.jpg" /></li>
				        <li class="slide_show_item"><img src="images/slideshow_demo2.jpg" /></li>      
						<li class="slide_show_item"><img src="images/slideshow_demo1.jpg" /></li>
				    </ul>
			    </div>
			</div>
		</div>
		<br clear="all" />
		<div id="footer">
		<!--#include file="inc/footer.inc" -->			
		</div>
	</div>
    <p>&nbsp;</p>
<script type="text/javascript">
    (function initSlideShow(){
        var count = 0;
        $('.slide_show_item').hide();
        $('.slide_show_item').eq(count++).fadeIn();
        startSlideShow(count);
    })();
    function startSlideShow(count){
        console.log(count);
        window.setTimeout(function(){
            var size = $('.slide_show_item').length;
            count = count>=size?0:count;
            $('.slide_show_item').eq(count-1).fadeOut("slow");
            $('.slide_show_item').eq(count).fadeIn("slow");
            startSlideShow(++count);
         },5000);
    }
</script>
</body>
</html>