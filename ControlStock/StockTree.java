package ejemplo;

import ejemplo.GTree;
import ejemplo.GTreeIF;
import ejemplo.IteratorIF;
import ejemplo.List;
import ejemplo.ListIF;

public class StockTree implements StockIF {

	protected GTreeIF<Node> stock;

	public StockTree() {
		stock = new GTree<>();
		stock.setRoot(new NodeInner('#'));
	}

	@Override
	public int retrieveStock(String p) {
		return retrieveStockRecursively(stock, p, 0);
	}

	private int retrieveStockRecursively(GTreeIF<Node> tree, String p, int index) {
	    GTreeIF<Node> current = tree;

	    while (current != null && index < p.length()) {
	        GTreeIF<Node> nextChild = findChild(current, p.charAt(index));
	        if (nextChild == null) {
	            break;
	        }
	        current = nextChild;
	        index++;
	    }

	    if (index == p.length() && current != null) {
	        GTreeIF<Node> infoChild = findChild(current);
	        if (infoChild != null) {
	            return ((NodeInfo) infoChild.getRoot()).getUnidades();
	        }
	    }

	    return -1;
	}

	@Override
	public void updateStock(String p, int u) {
	    GTreeIF<Node> current = stock;
	    int index = 0;

	    while (index < p.length()) {
	        GTreeIF<Node> nextChild = findChild(current, p.charAt(index));
	        if (nextChild == null) {
	        	char letter = p.charAt(index);
		        GTreeIF<Node> newNodeInner = new GTree<>();
		        newNodeInner.setRoot(new NodeInner(letter));
		        addChildInOrder(current, newNodeInner);
		        current = newNodeInner;
	        } else {
	        	current = nextChild;
	        }
	        index++;
	    }
	    
	    GTreeIF<Node> infoChild = findChild(current);
	    if (infoChild != null) {
	        ((NodeInfo) infoChild.getRoot()).setUnidades(u);
	    } else {
	        GTreeIF<Node> newNodeInfo = new GTree<>();
	        newNodeInfo.setRoot(new NodeInfo(u));
	        IteratorIF<GTreeIF<Node>> it = current.getChildren().iterator();
	        if(it.hasNext())
	        	current.addChild(1, newNodeInfo);
	        else
	        	current.addChild(current.getChildren().size() + 1, newNodeInfo);
	    }
	}

	private void addChildInOrder(GTreeIF<Node> tree, GTreeIF<Node> newNode) {
	    ListIF<GTreeIF<Node>> children = tree.getChildren();
	    IteratorIF<GTreeIF<Node>> it = children.iterator();
	    int index = 1;
	    Node newNodeRoot = newNode.getRoot();
	    char newNodeLetter = ((NodeInner) newNodeRoot).getLetter();
		while( it.hasNext()) {
		    GTreeIF<Node> child = it.getNext();
		    Node childNode = child.getRoot();
		    char childLetter = childNode.getNodeType() == Node.NodeType.INNER ? ((NodeInner) childNode).getLetter() : '\0';

	        if (Character.compare(newNodeLetter, childLetter) < 0) {
	            break;
	        }
		        index++;
		}
	    tree.addChild(index, newNode);
	}

	private GTreeIF<Node> findChild(GTreeIF<Node> tree, char letter) {
	    ListIF<GTreeIF<Node>> children = tree.getChildren();
	    IteratorIF<GTreeIF<Node>> it = children.iterator();
	    while (it.hasNext()) {
	        GTreeIF<Node> child = it.getNext();
	        Node childNode = child.getRoot();

	        if (childNode.getNodeType() == Node.NodeType.INNER) {
	            char childLetter = ((NodeInner) childNode).getLetter();
	            if (childLetter == letter) {
	                return child;
	            }
	        }
	    }
	    return null;
	}

	private GTreeIF<Node> findChild(GTreeIF<Node> tree) {
	    ListIF<GTreeIF<Node>> children = tree.getChildren();
	    IteratorIF<GTreeIF<Node>> it = children.iterator();
	    while (it.hasNext()) {
	        GTreeIF<Node> child = it.getNext();
	        Node childNode = child.getRoot();

	        if (childNode.getNodeType() == Node.NodeType.INFO) {
	            return child;
	        }
	    }
	    return null;
	}
	
	@Override
	public List<StockPair> listStock(String prefix) {
	    List<StockPair> stockList = new List<>();
	    listStockRecursively(stock, prefix.trim(), stockList, "");
	    return stockList;
	}
	
	private void listStockRecursively(GTreeIF<Node> tree, String prefix, List<StockPair> stockList, String nodeString ) {
	    if (tree == null || tree.isEmpty()) {
	        return;
	    }

	    IteratorIF<GTreeIF<Node>> children = tree.getChildren().iterator();
	    while (children.hasNext()) {
	        GTreeIF<Node> child = children.getNext();
	        if (child.getRoot().getNodeType() == Node.NodeType.INFO) {
	            int unidades = ((NodeInfo) child.getRoot()).getUnidades();
	            if (unidades >= 0) {
	                StockPair nodePair = new StockPair(nodeString, unidades);
	                stockList.insert(stockList.size() + 1, nodePair);
	            }
	        } else if (child.getRoot().getNodeType() == Node.NodeType.INNER && ((NodeInner) child.getRoot()).getLetter() != '#' ) {
	            nodeString += ((NodeInner) child.getRoot()).getLetter();
	            if( nodeString.startsWith(prefix) || prefix.startsWith(nodeString))
	            	listStockRecursively(child, prefix.trim(), stockList, nodeString);
	            nodeString = nodeString.substring(0, nodeString.length() - 1);
	        }
	    }
	}
}
