package DoppeltVerkettet;

public class Example {

    public static void main (String [] args) {

        List list = new List ();

        //creating a root and adding two nodes
        list.createRoot(17);

        list.appendNode(list.getRoot(),19);
        list.appendNode(list.getRoot(),21);
        list.appendNode(list.getRoot(), 50);
        list.appendNode(list.getRoot(), 70);

        //outprint data
        list.printTail(list.getRoot());

        //outprint data reversed
        list.printTailReversed(list.getLast());

        //analyzing length
        System.out.println("Length of List: " + list.listLength(list.getRoot()));

        //seeking List for 50
        System.out.println("Seek for 50 (expect Node): " + list.seekList(list.getRoot(), 50));

        //seeking List for 55 (doesn't exist)
        System.out.println("Seek for 55 (expect null): " + list.seekList(list.getRoot(), 55));

        //reversed seeking List for 21
        System.out.println("Seek for 21 (expect Node): " + list.seekList(list.getRoot(), 21));

        System.out.println("--------------------------");

        //deleting root
        System.out.println("deleting root (17): " + list.deleteNode(list.getRoot(), 17));

        //deleting node
        System.out.println("deleting node (21): " + list.deleteNode(list.getRoot(), 21));

        //deleting last
        System.out.println("deleting last (70): " + list.deleteNode(list.getRoot(), 70));

        //deleting node which doesn't exist
        System.out.println("deleting node (55): " + list.deleteNode(list.getRoot(), 55));

        //outprint data
        list.printTail(list.getRoot());

        //insert data, adding new root
        list.insertNode(list.getRoot(), 16);

        //insert data, adding new nodes
        list.insertNode(list.getRoot(), 20);
        list.insertNode(list.getRoot(), 50);

        //insert data, adding new last
        list.insertNode(list.getRoot(), 55);

        //outprint data
        list.printTail(list.getRoot());

        //deleting all nodes beginning from data 21
        System.out.println("Tail got deleted beginning with data 21: " + list.deleteBeginningFrom(list.getRoot(), 21));

        //outprint data
        list.printTail(list.getRoot());
    }
}
