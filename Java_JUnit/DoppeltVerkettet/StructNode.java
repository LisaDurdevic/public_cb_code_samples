package DoppeltVerkettet;

public class StructNode {

    private int data;
    private StructNode prev;
    private StructNode next;

    //-------------------------------------------------------------------------
    public StructNode() {

    }
    //-------------------------------------------------------------------------
    public StructNode (int data, StructNode prev, StructNode next) {
        this.data = data;
        this.prev = prev;
        this.next = next;
    }

    //-------------------------------------------------------------------------
    public void setNext (StructNode next) {
        this.next = next;
    }

    //-------------------------------------------------------------------------
    public void setPrev (StructNode prev) {
        this.prev = prev;
    }

    //-------------------------------------------------------------------------
    public StructNode getPrev () {
        return prev;
    }

    //-------------------------------------------------------------------------
    public StructNode getNext () {
        return next;
    }

    //-------------------------------------------------------------------------
    public int getData() {
        return data;
    }

}
