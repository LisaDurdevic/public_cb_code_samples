package PersonData;

public class Address {
    private String street;
    private int houseNo;
    private int postCode;
    private String town;

    //constructor for adding addresses to persons
	//-------------------------------------------------------------------------
    public Address (String street, int houseNo, int postCode, String town) {
        this.street = street;
        this.houseNo = houseNo;
        this.postCode = postCode;
        this.town = town;
    }

    //method for turning every address into a string for outprint - returns to personToString
	//-------------------------------------------------------------------------
    @Override
    public String toString () {

        return street + " " + houseNo + ", " + postCode + " " + town;

    }
    
    
}
