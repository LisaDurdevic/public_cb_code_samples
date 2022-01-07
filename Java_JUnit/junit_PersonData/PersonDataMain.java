package PersonData;

import java.util.Scanner;

public class PersonDataMain {
	
	public static Scanner sc = new Scanner (System.in);
	
	
    public static void main (String [] args) {

    	Boolean quit = false;
    	String yesNoDelete;
    	String firstName;
    	String lastName;
    	
    	PersonManagement staff = new PersonManagement();
    	
    	System.out.println("WELCOME TO PERSON-MANAGEMENT:");
    	
    	do {
    		System.out.println("Do you want to add a new person (t/f) or delete a Person (d) or print all persons (p)?");
    		yesNoDelete = sc.nextLine();
    		
    		if (yesNoDelete.equals("t")) {
    			
    			//creating a new person
    			staff.createPerson();
    			
    		} else if (yesNoDelete.equals("d")) {
    			
    			//searching the person to delete
    			System.out.println("Please enter the first name of the wanted person:");
    			firstName = sc.nextLine();
    			
    			System.out.println("Now please enter the last name of the wanted person:");
    			lastName = sc.nextLine();
    			
    			//deleting the person
    			staff.deletePerson(firstName, lastName);
    			
    		} else if (yesNoDelete.equals("p")) {
    			
    			System.out.println("Do you want to see all added persons (t/f)?");
    	    	yesNoDelete = sc.nextLine();
    	    	
    	    	if (yesNoDelete.equals("t")) {
    	    		System.out.println(staff.toString());
    	    	}
    	    	
    		} else {
    			quit = true;
    			System.out.println("Program gets closed");
    		}
    		
    	} while (!quit);
    	
    	
    	System.out.println("Have a nice day!");
    	sc.close();
    	
    }

}
