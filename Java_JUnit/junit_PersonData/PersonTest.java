package PersonData;

import org.junit.jupiter.api.Test;


import static org.junit.jupiter.api.Assertions.*;

class PersonTest {

    @Test
    void add() {
        String firstName = "Anna";
        String lastName = "Huemer";
        Person.COUNTER = 1;

        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName, new Person(firstName, lastName).toString());
    }


    @org.junit.jupiter.api.Test
    void testAdd() {
        String firstName = "Lisa";
        String lastName = "Durdevic";
        String street = "Musterstrasse";
        int houseNo = 35;
        int postCode = 4020;
        String town = "Linz";
        int age = 29;
        Sex sex = Sex.FEMALE;

        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female", new Person(firstName, lastName, street, houseNo, postCode, town, age, sex).toString());
    }

    
    @org.junit.jupiter.api.Test
    void testAdd1() {
        String firstName = "Jovica";
        String lastName = "Durdevic";
        int age = 28;
        Sex sex = Sex.MALE;

        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "male", new Person(firstName, lastName, age, sex).toString());
    }

   
    @Test
    void printPerson1() {
        String firstName = "Lisa";
        String lastName = "Durdevic";
        
        assertEquals("First name: " + firstName +
                "\nLast name: " + lastName, new Person(firstName, lastName).toString());
    }
    
   
    @Test
    void printPerson2() {
        String firstName = "Jovica";
        String lastName = "Durdevic";
        int age = 28;
        Sex sex = Sex.MALE;
        
        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "male", new Person(firstName, lastName, age, sex).toString());
    }
    
    
    @Test
    void printPerson3() {
        String firstName = "Lisa";
        String lastName = "Durdevic";
        String street = "Musterstrasse";
        int houseNo = 35;
        int postCode = 4020;
        String town = "Linz";
        int age = 29;
        Sex sex = Sex.FEMALE;
        
        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female", new Person(firstName, lastName, street, houseNo, postCode, town, age, sex).toString());
    }

    
    @Test
    void addPersonManagement() {
        String firstName = "Lisa";
        String lastName = "Durdevic";
        String street = "Musterstrasse";
        int houseNo = 35;
        int postCode = 4020;
        String town = "Linz";
        int age = 29;
        Sex sex = Sex.FEMALE;

        PersonManagement staff = new PersonManagement();
        staff.addPerson(new Person(firstName, lastName, street, houseNo, postCode, town, age, sex));

        String firstName2 = "Jovica";
        String lastName2 = "Durdevic";
        String street2 = "Musterstrasse";
        int houseNo2 = 35;
        int postCode2 = 4020;
        String town2 = "Linz";
        int age2 = 28;
        Sex sex2 = Sex.MALE;

        staff.addPerson(new Person(firstName2, lastName2, street2, houseNo2, postCode2, town2, age2, sex2));

        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female" +
                "\n-----------------------------------\n" +
                "First name: " + firstName2 +
                "\n" + "Last name: " + lastName2 +
                "\n" + "Address: " + street2 + " " + houseNo2 + ", " + postCode2 + " " + town2 +
                "\n" + "Age: " + age2 +
                "\n" + "Gender: " + "male" +
                "\n-----------------------------------\n", staff.toString());

    }
    
    
    @Test
    void deletePerson() {
    	String firstName = "Lisa";
        String lastName = "Durdevic";
        String street = "Musterstrasse";
        int houseNo = 35;
        int postCode = 4020;
        String town = "Linz";
        int age = 29;
        Sex sex = Sex.FEMALE;
        Person.COUNTER = 1; 

        PersonManagement staff = new PersonManagement();
        staff.addPerson(new Person(firstName, lastName, street, houseNo, postCode, town, age, sex));
        
        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female" +
                "\n-----------------------------------\n", staff.toString());

        String firstName2 = "Jovica";
        String lastName2 = "Durdevic";
        String street2 = "Musterstrasse";
        int houseNo2 = 35;
        int postCode2 = 4020;
        String town2 = "Linz";
        int age2 = 28;
        Sex sex2 = Sex.MALE;

        staff.addPerson(new Person(firstName2, lastName2, street2, houseNo2, postCode2, town2, age2, sex2));
        
        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female" +
                "\n-----------------------------------\n" +
                "First name: " + firstName2 +
                "\n" + "Last name: " + lastName2 +
                "\n" + "Address: " + street2 + " " + houseNo2 + ", " + postCode2 + " " + town2 +
                "\n" + "Age: " + age2 +
                "\n" + "Gender: " + "male" +
                "\n-----------------------------------\n", staff.toString());
        
        staff.deletePerson(firstName2, lastName2);
        
        assertEquals("First name: " + firstName +
                "\n" + "Last name: " + lastName +
                "\n" + "Address: " + street + " " + houseNo + ", " + postCode + " " + town +
                "\n" + "Age: " + age +
                "\n" + "Gender: " + "female" +
                "\n-----------------------------------\n", staff.toString());

        assertEquals(null, staff.findPerson(firstName2, lastName2));
    	
    }

}