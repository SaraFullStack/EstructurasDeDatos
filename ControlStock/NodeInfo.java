package ejemplo;

public class NodeInfo extends Node {

	private int unidades;
	
	public NodeInfo(int u) {
		setUnidades(u);
	}
	
	public void setUnidades(int u) {
		this.unidades = u;
	}
	
	public int getUnidades() {
		return this.unidades;
	}
	
	public NodeType getNodeType() {
		return Node.NodeType.INFO;
	}
}
