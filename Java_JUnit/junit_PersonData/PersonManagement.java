package PersonData;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;

public class PersonManagement {

	private Map<Integer, Person> hashList;
	
	//constructor PersonManagement
	//-------------------------------------------------------------------------
	public PersonManagement() {
		
		hashList = new HashMap<>();
	}
	
	//adding the created person to hashList
	//-------------------------------------------------------------------------
	public void addPerson (Person person) {
	
	    this.hashList.put(person.getID(), person);
	    
	}
	    
	//method for asking the user for new data and adding the by method addPerson to hashList
	//-------------------------------------------------------------------------
	public void createPerson() {
	
	  Scanner sc = new Scanner(System.in);
	
	  System.out.println("First Name: ");
	  String firstName = sc.nextLine();
	
	  System.out.println("Last Name: ");
	  String lastName = sc.nextLine();
	
	  System.out.println("Street: ");
	  String street = sc.nextLine();
	
	  System.out.println("House-Number: ");
	  int houseNo = Integer.parseInt(sc.nextLine());
	
	  System.out.println("Postal code: ");
	  int postCode = Integer.parseInt(sc.nextLine());
	  
	  System.out.println("Town: ");
	  String town = sc.nextLine();
	
	  System.out.println("Age: ");
	  int age = Integer.parseInt(sc.nextLine());
	
	  System.out.println("Sex (f/m): ");
	  char sexChar = sc.nextLine().charAt(0);
	
	  Sex sex;
	  
	  if (sexChar == 'f') {
	      sex = Sex.FEMALE;
	  } else
	  	sex = Sex.MALE;

	  addPerson(new Person(firstName, lastName, street, houseNo, postCode, town, age, sex));
	  
	}
	  
	      
	//outprinting the whole hashList - Iterator
	//-------------------------------------------------------------------------
	@Override
	public String toString () {
		
		StringBuilder allPersons = new StringBuilder();
		
		Iterator<Person> itr = hashList.values().iterator();
		Person person;
		
		while (itr.hasNext()) {
			person = itr.next();
			allPersons.append(person.toString() + "\n-----------------------------------\n");
		}
	
		return allPersons.toString();
	}

	
	//method for finding a person using it's full name - Iterator
	//-------------------------------------------------------------------------
	public Person findPerson (String firstName, String lastName) {
		
		Iterator<Person> itr = hashList.values().iterator();
		Person person;
		
		while (itr.hasNext()) {
			person = itr.next();
			if (person.getFirstName().equals(firstName) && person.getLastName().equals(lastName)) {
				return person; //returning matched person
			}
		}
		
		//only reached when person couldn't be found
		System.out.println("The wanted person couldn't be found. Please check on correct spelling and try again.");
		return null;
		
	}
	
	  
	//searches for a person with it's full name and removing it from hashList
	//-------------------------------------------------------------------------
	public void deletePerson (String firstName, String lastName) {
	
		Person person = findPerson(firstName, lastName);
		int id = person.getID();
		
	    this.hashList.remove(id);
	    System.out.println("Entry ID " + id + " " + firstName + " " + lastName + " got deleted.");
	}

	

}
