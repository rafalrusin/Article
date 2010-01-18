declare namespace a="urn:article";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function a:processLine($l) {
for $i in $l/node()
return  
typeswitch ($i)
  case element(a:link, xs:untyped) return <a href="{$i/text()}">{$i/text()}</a>
  default return $i
};

declare function a:articleItem($i) {
typeswitch ($i)
 case element(a:l, xs:untyped) return (a:processLine($i), <br/>)
 
 case element(a:code, xs:untyped) return 
  ( a:highlight($i/text(), $i/@lang)/body/* , <br/>)
  
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

