package ejemplo;

public class NodeInner extends Node {

	private char letter;

	public NodeInner(char l) {
		this.letter = l;
	}
	
	public char getLetter() {
		return this.letter;
	}
		
	public NodeType getNodeType() {
		return Node.NodeType.INNER;
	}

}
