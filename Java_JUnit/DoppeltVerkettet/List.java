package DoppeltVerkettet;

public class List {

    private StructNode root;
    private StructNode last;

    //-------------------------------------------------------------------------
    public StructNode createRoot (int data) {
        this.root = new StructNode(data, null, null);
        return root;
    }

    //-------------------------------------------------------------------------
    public StructNode appendNode (StructNode tail, int data) {
        if (tail == null) {
            return null;
        } else {
            //creating new node
            StructNode newNode = new StructNode(data, null, null);

            while (tail.getNext() != null) { //searching for the end of tail
                tail = tail.getNext();
            }
            //end of tail reached, adding the new node
            tail.setNext(newNode);
            newNode.setPrev(tail);
            this.last = newNode;
            return last;
        }
    }

    //-------------------------------------------------------------------------
    public StructNode getRoot () {
        return root;
    }

    //-------------------------------------------------------------------------
    public StructNode getLast() {
        return last;
    }

    //-------------------------------------------------------------------------
    public void printTail (StructNode root) {

        //printing always the value 'data' of root and beginning with second round changing data with next
        for (;root != null; root = root.getNext()) {
            System.out.printf("%d \n", root.getData());
        }

        System.out.println("--------------------------");
    }

    //-------------------------------------------------------------------------
    public void printTailReversed (StructNode last) {

        //printing always the value 'data' of last and beginning with second round changing data with next
        for (;last != null; last = last.getPrev()) {
            System.out.printf("%d \n", last.getData());
        }

        System.out.println("--------------------------");
    }

    //-------------------------------------------------------------------------
    public int listLength (StructNode root) {

        if (root == null) {
            return 0;
        } else {
            int length = 1;

            //counting StructNodes as long as getNext() doesn't return null
            for (;root.getNext() != null; length++) {
                root = root.getNext();
            }
            return length;
        }
    }

    //-------------------------------------------------------------------------
    public StructNode seekList (StructNode root, int data) {

        if (root == null) {
            return null;
        } else {

            //always checking getNext() for the wanted value as long as getNext() doesn't return null
            for (;root != null; root = root.getNext()) {
                if (root.getData() == data) {
                    return root;
                }
            }
        }

        return null;
    }

    //-------------------------------------------------------------------------
    public StructNode seekHigherData (StructNode root, int data) {

        if (root == null) {
            return null;
        } else {

            //always checking getNext() for the wanted value as long as getNext() doesn't return null = last
            for (;root != null; root = root.getNext()) {
                if (root.getData() >= data) {
                    return root;
                }
            }
        }

        return null;
    }

    //-------------------------------------------------------------------------
    public StructNode seekListReverse (StructNode last, int data) {

        if (last == null) {
            return null;
        } else {

            //always checking getPrev() for the wanted value as long as getPrev() doesn't return null = root
            for (;last != null; last = last.getPrev()) {
                if (last.getData() == data) {
                    return last;
                }
            }
        }

        return null;
    }

    //-------------------------------------------------------------------------
    public boolean deleteNode (StructNode node, int data) {

        node = seekList(node, data); //searching for the wanted node, starting with root

        //checking if the node is root (prev == null) or last (next == null) or found at all (!null)

        if (node != null){ //node was found
            if (node.getPrev() == null) { //root

                this.root = node.getNext();
                node.getNext().setPrev(null);
                System.out.println("New Root node got set: " + node);

            } else if (node.getNext() == null) { //last

                this.last = node.getPrev();
                node.getPrev().setNext(null);
                System.out.println("New last node got set: " + node);

            }

            node = null;
            return true;

        }

        //return if node == null (not found)
        return false;
    }

    //-------------------------------------------------------------------------
    public boolean deleteBeginningFrom (StructNode node, int data) {

        node = seekList(node, data); //searching for the wanted node, starting with root

        //checking if the node is root (prev == null) or last (next == null) or found at all (!null)

        if (node != null){ //node was found

        	//clearing the next() of the previous node because it becomes the new last
        	//node.getPrev().setNext(null);
        	this.last = node.getPrev();
        	last.setNext(null);
        	
            //always checking getNext() for the wanted value as long as getNext() != null (reached the last node to delete)
            while (node.getNext() != null) {
            	
            	node = node.getNext(); //overwriting node = deleting the current value of it
            	
            }
            
            //deleting the last node
            node = null;
            
            return true;
        }

        //return if node == null (not found)
        return false;
    }

    //-------------------------------------------------------------------------
    public void insertNode (StructNode node, int newData) {

        StructNode newNode = new StructNode(newData, null, null);
        node = seekHigherData(node, newData); //searching place, starting with root

        //checking if the new node becomes root (prev == null) or last (next == null) or within

        if (node != null){ //check is higher or equal to new data
            if (node.getPrev() == null) { //new data becomes new root

                this.root = newNode;
                node.setPrev(newNode);
                newNode.setNext(node);
                System.out.println("New Root node got set: " + newNode);

            } else { //new data sits within List

                node.getPrev().setNext(newNode);
                newNode.setPrev(node.getPrev());
                newNode.setNext(node);
                node.setPrev(newNode);
            }
        } else { //new data is the highest value so far, becomes new last

            this.last.setNext(newNode);
            newNode.setPrev(this.last);
            this.last = newNode;
            System.out.println("New last node got set: " + newNode);
        }
    }
}
