<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0029)http://thefounderspledge.org/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<!-- Always force latest IE rendering engine or request Chrome Frame -->
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0" name="viewport">
<!-- Use title if it's in the page YAML frontmatter -->
<title>HOME</title>


<meta content="#ffffff" name="msapplication-TileColor">
<meta content="/images/favicon/ms-icon-144x144-46dbe12c.png" name="msapplication-TileImage">
<meta content="#ffffff" name="theme-color">
<link href="all-d951c374.css" rel="stylesheet" type="text/css">
<script async="" src="analytics.js"></script>
<script src="all-ecacc06a.js" type="text/javascript"></script>
<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="slick.css" rel="stylesheet" type="text/css">
<link href="slick-theme.css" rel="stylesheet" type="text/css">
<link href="css" rel="stylesheet" type="text/css">

<style type="text/css"> 
    *{ margin:0; padding:0;    list-style:none;} 
    .nav a{ color:#06c; font-size:14px; line-height:24px;text-decoration:none;font-weight:bold;font-size:20px;color:black;font-family:Microsoft YaHei;text-align:center} 
	#nav{height:100px;line-height:100px;padding-top:10%;padding-left:20%;list-style-type:none}
	#nav a:hover{color:#009fcc}
    #nav strong{ color:#696;} 
    #nav.dyn li ul{ display:none;} 
    #nav.dyn li ul.show{ display:block;} 
    #nav.dyn li{ padding-left:20%;line-height:250%} 
	.avatar{border:2px solid #999;border-radius:50%;padding:.8em;}
	.username{display:inline-block;width:200px;padding:15% 20% 0 33%;font-size:1.2em;color:#999;border-bottom:1px solid #e6e6e6;font-weight:bold}
	.username a{text-decoration:none}
	.u_info{padding:20% 20% 20% 20%;}
	h1{font-weight:bold;font-family:Microsoft YaHei}
</style> 

<script type="text/javascript">
DOMhelp={
	debugWindowId:'DOMhelpdebug',
	init:function(){
		if(!document.getElementById || !document.createTextNode){return;}
	},
	lastSibling:function(node){
		var tempObj=node.parentNode.lastChild;
		while(tempObj.nodeType!=1 && tempObj.previousSibling!=null){
			tempObj=tempObj.previousSibling;
		}
		return (tempObj.nodeType==1)?tempObj:false;
	},
	firstSibling:function(node){
		var tempObj=node.parentNode.firstChild;
		while(tempObj.nodeType!=1 && tempObj.nextSibling!=null){
			tempObj=tempObj.nextSibling;
		}
		return (tempObj.nodeType==1)?tempObj:false;
	},
	getText:function(node){
		if(!node.hasChildNodes()){return false;}
		var reg=/^\s+$/;
		var tempObj=node.firstChild;
		while(tempObj.nodeType!=3 && tempObj.nextSibling!=null || reg.test(tempObj.nodeValue)){
			tempObj=tempObj.nextSibling;
		}
		return tempObj.nodeType==3?tempObj.nodeValue:false;
	},
	setText:function(node,txt){
		if(!node.hasChildNodes()){return false;}
		var reg=/^\s+$/;
		var tempObj=node.firstChild;
		while(tempObj.nodeType!=3 && tempObj.nextSibling!=null || reg.test(tempObj.nodeValue)){
			tempObj=tempObj.nextSibling;
		}
		if(tempObj.nodeType==3){tempObj.nodeValue=txt}else{return false;}
	},
	createLink:function(to,txt){
		var tempObj=document.createElement('a');
		tempObj.appendChild(document.createTextNode(txt));
		tempObj.setAttribute('href',to);
		return tempObj;
	},
	createTextElm:function(elm,txt){
		var tempObj=document.createElement(elm);
		tempObj.appendChild(document.createTextNode(txt));
		return tempObj;
	},
	closestSibling:function(node,direction){
		var tempObj;
		if(direction==-1 && node.previousSibling!=null){
			tempObj=node.previousSibling;
			while(tempObj.nodeType!=1 && tempObj.previousSibling!=null){
				 tempObj=tempObj.previousSibling;
			}
		}else if(direction==1 && node.nextSibling!=null){
			tempObj=node.nextSibling;
			while(tempObj.nodeType!=1 && tempObj.nextSibling!=null){
				 tempObj=tempObj.nextSibling;
			}
		}
		return tempObj.nodeType==1?tempObj:false;
	},
	initDebug:function(){
		if(DOMhelp.debug){DOMhelp.stopDebug();}
		DOMhelp.debug=document.createElement('div');
		DOMhelp.debug.setAttribute('id',DOMhelp.debugWindowId);
		document.body.insertBefore(DOMhelp.debug,document.body.firstChild);
	},
	setDebug:function(bug){
		if(!DOMhelp.debug){DOMhelp.initDebug();}
		DOMhelp.debug.innerHTML+=bug+'\n';
	},
	stopDebug:function(){
		if(DOMhelp.debug){
			DOMhelp.debug.parentNode.removeChild(DOMhelp.debug);
			DOMhelp.debug=null;
		}
	},
	getKey:function(e){
		if(window.event){
	      var key = window.event.keyCode;
	    } else if(e){
	      var key=e.keyCode;
	    }
		return key;
	},
/* helper methods */
	getTarget:function(e){
		var target = window.event ? window.event.srcElement : e ? e.target : null;
		if (!target){return false;}
		while(target.nodeType!=1 && target.nodeName.toLowerCase()!='body'){
			target=target.parentNode;
		}
		return target;
	},
	stopBubble:function(e){
		if(window.event && window.event.cancelBubble){
			window.event.cancelBubble = true;
		} 
		if (e && e.stopPropagation){
			e.stopPropagation();
		}
	},
	stopDefault:function(e){
		if(window.event && window.event.returnValue){
			window.event.returnValue = false;
		} 
		if (e && e.preventDefault){
			e.preventDefault();
		}
	},
	cancelClick:function(e){
		if (window.event){
			window.event.cancelBubble = true;
			window.event.returnValue = false;
		}
		if (e && e.stopPropagation && e.preventDefault){
			e.stopPropagation();
			e.preventDefault();
		}
	},
	addEvent: function(elm, evType, fn, useCapture){
		if (elm.addEventListener){
			elm.addEventListener(evType, fn, useCapture);
			return true;
		} else if (elm.attachEvent) {
			var r = elm.attachEvent('on' + evType, fn);
			return r;
		} else {
			elm['on' + evType] = fn;
		}
	},
	cssjs:function(a,o,c1,c2){
		switch (a){
			case 'swap':
				o.className=!DOMhelp.cssjs('check',o,c1)?o.className.replace(c2,c1):o.className.replace(c1,c2);
			break;
			case 'add':
				if(!DOMhelp.cssjs('check',o,c1)){o.className+=o.className?' '+c1:c1;}
			break;
			case 'remove':
				var rep=o.className.match(' '+c1)?' '+c1:c1;
				o.className=o.className.replace(rep,'');
			break;
			case 'check':
				var found=false;
				var temparray=o.className.split(' ');
				for(var i=0;i<temparray.length;i++){
					if(temparray[i]==c1){found=true;}
				}
				return found;
			break;
		}
	},
    safariClickFix:function(){
      return false;
    }
}
DOMhelp.addEvent(window, 'load', DOMhelp.init, false);
</script> 

</head>

<body class="index" data-view="index" style="">
<div class="content">
<nav>
<ul>
<li><a href="health.php" style="font-weight:bold;font-family:Microsoft YaHei">1</a></li>
<li><a href="activity.php" style="font-weight:bold;font-family:Microsoft YaHei">2</a></li>
<li><a href="account.php" style="font-weight:bold;font-family:Microsoft YaHei">3</a></li>
<li><a href="authority.php" style="font-weight:bold;font-family:Microsoft YaHei">4</a></li>
<li><a href="suggestion.php" style="font-weight:bold;font-family:Microsoft YaHei">5</a></li>
<li><a class="button" href="presentation.php" style="font-weight:bold;font-family:Microsoft YaHei">6</a></li>
</ul>
</nav>
<div id='menu-toggle'>
<div class='menu-icon'><img src="menu-fe5f9c80.svg" /></div>
</div>

<div id='menu-overlay'>
<div class='menu-content'>
<ul>
<li><a href="health.php" style="font-weight:bold;font-family:Microsoft YaHei">1</a></li>
<li><a href="activity.php" style="font-weight:bold;font-family:Microsoft YaHei">2</a></li>
<li><a href="account.php" style="font-weight:bold;font-family:Microsoft YaHei">3</a></li>
<li><a href="authority.php" style="font-weight:bold;font-family:Microsoft YaHei">4</a></li>
<li><a href="suggestion.php" style="font-weight:bold;font-family:Microsoft YaHei">5</a></li>
<li><a href="presentation.php" style="font-weight:bold;font-family:Microsoft YaHei">6</a></li>
</ul>
</div>
</div>





<div id="header">
<TABLE borderColor=#00ff99 height="100%" width="100%" border=0 style="table-layout:fixed;" >
    <TR height="100%">
	<TD width="20%" style="vertical-align:top;background-size:cover" background="apic20451.jpg">
	 <div class="u_info">
            <span class="username"><a class="adm">${user}</a>
			&nbsp <a href="LoginOut" style="color:black;text-decoration:underline;font-weight:lighter">注销</a></span>
        </div>
        
<ul class="nav nav-pills nav-stacked nav-pills-stacked-example" >
      <li role="presentation"><a href="create.php">menu1</a></li>
      <li role="presentation"><a href="managemyact.php">menu2</a></li>
      <li role="presentation"><a href="managemyact.php">menu3</a></li>
      <li role="presentation"><a href="managemyact.php">menu4</a></li>
      <li role="presentation"><a href="managemyact.php">menu5</a></li>
    </ul>


	</TD>
	
	
    <TD width="80%" bgColor=#FFFFFF style="vertical-align:top;padding-top:80px;padding-bottom:50px;word-wrap:break-word;background-size:cover" background="bg5.jpg">
	<div class="container">
	 <div class="page-header">
  <h1>all projects</h1>
</div>
	

</div>
    <div class="pagination" style="padding-left:50px" >
        <a class="btn btn-default" href="#">&larr; 上一页</a>
		<span class="page-number">第 1 页/共 1 页</span>
        <a class="btn btn-default" href="#">下一页 &rarr;</a>
	</div>
	</TD>
    </TR>
</TABLE>
</div>


</div>


</body></html>