package PersonData;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class AddressTest {

    @Test
    void newAddress() {
        String street = "Musterstrasse";
        int houseNo = 35;
        int postCode = 4020;
        String town = "Linz";
        
        assertEquals(street + " " + houseNo + ", " + postCode + " " + town, new Address (street, houseNo, postCode, town).toString());
    }


}