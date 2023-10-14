package ejemplo;

/* Representa un nodo */
public abstract class Node {
	public enum NodeType {
		ROOT, INNER, INFO
	}
	
	/* Prescribe un getter que devuelve el tipo de nodo */
	public abstract NodeType getNodeType();
}
