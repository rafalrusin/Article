package article;

import org.apache.commons.io.IOUtils;
import org.w3c.dom.Node;

import xquery4j.DOMUtils;
import xquery4j.XQueryEvaluator;

public class Article {
    
    private XQueryEvaluator evaluator;
    
    public static class Mod {
        
    }
    
    public Article() {
        evaluator = new XQueryEvaluator();
        evaluator.declareJavaClass("urn:article", Mod.class);
    }
    
    public void gen() throws Exception {
        Node r = (Node) evaluator.evaluateExpression(IOUtils.toString(getClass().getResourceAsStream("/article.xq")), DOMUtils.parse(getClass().getResourceAsStream("/article.xml"))).get(0);
        System.out.println(DOMUtils.domToString(r));
    }
    
    public static void main() throws Exception {
        new Article().gen();
    }
}
