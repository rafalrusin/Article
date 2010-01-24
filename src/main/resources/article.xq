declare namespace a="urn:article";
declare default element namespace "http://www.w3.org/1999/xhtml";

declare function a:articleItem($i) {
typeswitch ($i)
 case element(a:l, xs:untyped) 
   return 
     (a:articleItem($i/node()), <br/>)

 case element(a:link, xs:untyped) 
   return <a href="{$i/text()}">{$i/text()}</a>
 
 case element(a:code, xs:untyped) 
   return ( a:highlight($i/text(), $i/@lang)/body/* , <br/>)
 
 case text()
   return $i

 case $e as element(*, xs:untyped)
   return element {QName(namespace-uri($e), local-name($e))} { ( $e/attribute(), a:articleItem($e/node()) ) }
   
 case $k as node()+
   return for $j in $k return a:articleItem($j)
  
 default 
   return "ERROR"
};

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>a.xml</title>
<link rel="stylesheet" type="text/css" href="highlight.css"/>
</head>
<body>
{
a:articleItem(a:article/node())
}
</body>
</html>

