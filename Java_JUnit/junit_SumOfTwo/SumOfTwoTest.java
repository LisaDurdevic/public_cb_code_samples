package junit_SumOfTwo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

class SumOfTwoTest {

	@Test
	public void testPositiveValueTrue() {
        Integer[] a = {1,2,3};
        Integer[] b = {10,20,30,40};
        int v = 42;
        
        assertEquals(true, SumOfTwo.sumOfTwo(a,b,v));
    }
	
	@Test
	public void testNegativeValueTrue() {
		Integer[] a = {0,0,-5,30212};
		Integer[] b = {-10,40,-3,9};
        int v = -8;
        
        assertEquals(true, SumOfTwo.sumOfTwo(a,b,v));
    }
	
	@Test
	public void testPositiveValueFalse() {
		Integer[] a = {0,0,5,30212};
		Integer[] b = {-10,40,-3,9};
        int v = 8;
        
        assertEquals(false, SumOfTwo.sumOfTwo(a,b,v));
    }

	@Test
	public void testNegativeValueFalse() {
		Integer[] a = {1,-2,2, 3};
		Integer[] b = {10,20,30,40};
        int v = -42;
        
        assertEquals(false, SumOfTwo.sumOfTwo(a,b,v));
    }

}
