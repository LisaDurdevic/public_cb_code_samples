package PersonData;

public class Person {

    private String firstName;
    private String lastName;
    private int age;
    private Sex sex;
    private Address address;
    private int id;
    
    public static Integer COUNTER = 1;
    

    //constructor for creating a new person
  //-------------------------------------------------------------------------
    public Person (String firstName, String lastName, String street, int houseNo, int postCode, String town, int age, Sex sex) {
    	
    	setFirstName(firstName);
    	setLastName(lastName);  	
    	setAddress(street, houseNo, postCode, town);
    	setAge(age);
    	setSex(sex);
    	setID(COUNTER);
    	COUNTER++;
    }

  //constructor for creating a new person
  //-------------------------------------------------------------------------
    public Person (String firstName, String lastName) {
    	
    	this(firstName, lastName, null, 0, 0, null, 0, null);
    }

  //constructor for creating a new person
  //-------------------------------------------------------------------------
    public Person (String firstName, String lastName, int age, Sex sex) {

    	this(firstName, lastName, null, 0, 0, null, age, sex);
    	
    }
    
    //constructor for default person without values, no Counter++, id == 0
    //-------------------------------------------------------------------------
    public Person () {
    	
    	this(null, null, null, 0, 0, null, 0, null);
    }
    
	//creates a string with all data of each person
	//-------------------------------------------------------------------------
    @Override
	public String toString () {

    	String addressAsString;
    	
    	if (address != null) {
    		addressAsString = address.toString();
    	} else
    		addressAsString = null;
 

      return "First name: " + getFirstName() +
              "\n" + "Last name: " + getLastName() +
              
              //outprint of address, age and sex only if available
              (addressAsString!= null ? "\n" + "Address: " + addressAsString : "") +
              (getAge() > 0 ? "\n" + "Age: " + getAge() : "") +
              (getSex() != null ? "\n" + "Gender: " + (getSex() == Sex.FEMALE ? "female" : "male") : "");

	}
    
    
    //Setter for firstName
    //-------------------------------------------------------------------------
    public void setFirstName (String firstName) {
    	if (!Character.isAlphabetic(firstName.charAt(0))) {
    		System.out.println("First Name needs to be alphabetic.");
    		return;
    	} 
    	
    	this.firstName = firstName;
    }
    
    //Getter for firstName
    //-------------------------------------------------------------------------
    public String getFirstName () {
    	return firstName;
    }
    
    //Setter for lastName
    //-------------------------------------------------------------------------
    public void setLastName (String lastName) {
    	if (!Character.isAlphabetic(lastName.charAt(0))) {
    		System.out.println("Last Name needs to be alphabetic.");
    		return;
    	} 
    	
    	this.lastName = lastName;
    }
    
    //Getter for lastName
    //-------------------------------------------------------------------------
    public String getLastName () {
    	return lastName;
    }
    
    //Setter for age
    //-------------------------------------------------------------------------
    public void setAge (int age) {
    	if (age <= 0) {
    		System.out.println("Age can't be 0 or less.");
    		return;
    	} else if (age > 1000) {
    		System.out.println("Age can't be higher than 1.000");
    		return;
    	}
    	
    	this.age = age;
    }
    
    //Getter for age
    //-------------------------------------------------------------------------
    public int getAge () {
    	return age;
    }
    
    
  //Setter for sex
    //-------------------------------------------------------------------------
    public void setSex (Sex sex) {
    	if (sex != Sex.FEMALE && sex != Sex.MALE) {
    		System.out.println("Invalid value.");
    		return;
    	}
    	
    	this.sex = sex;
    }
    
    //Getter for sex
    //-------------------------------------------------------------------------
    public Sex getSex () {
    	return sex;
    }
    
    
    //Setter for address
    //-------------------------------------------------------------------------
    public void setAddress (String street, int houseNo, int postCode, String town) {
    	
    	if (street != null && houseNo != 0 && postCode != 0 && town != null) {
    		
    		this.address = new Address(street, houseNo, postCode, town);
    		
    	} else {
    		System.out.println("Address is uncomplete. Address will be null.");
    		this.address = null;
    	}
    }
    
    //Getter for address
    //-------------------------------------------------------------------------
    public Address getAddress () {
    	return address;
    }
    
    
    //Setter for id
    
    public void setID(int id) {
    	this.id = id;
    }
    
    //Getter for id
    //-------------------------------------------------------------------------
    public int getID () {
    	return id;
    }
    
}
