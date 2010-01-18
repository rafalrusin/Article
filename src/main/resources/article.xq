declare namespace a="urn:article";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function a:articleItem($i) {
typeswitch ($i)
 case element(a:l, xs:untyped) return ($i/node(), <br/>)
 
 case element(a:code, xs:untyped) return 
  (<div style="border: thin dashed rgb(0, 0, 170);">
   { a:highlight($i/text(), $i/@lang)/body/* }
  </div>, <br/>)
  
 default return "error;"
};

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>a.xml</title>
<link rel="stylesheet" type="text/css" href="highlight.css"/>
</head>
<body>
{
for $i in a:article/* 
return 
a:articleItem($i)
}
</body>
</html>

