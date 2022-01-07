package junit_SumOfTwo;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class SumOfTwo {
	
	public static Integer [] a = {1,2,3};
	public static Integer [] b = {10,20,30,40};
	public static int v = 42;
	
	//-------------------------------------------------------------------------
	public static void main (String [] args) {
        
		System.out.println(sumOfTwo(a, b, v));
		
	}

	//-------------------------------------------------------------------------
	public static Boolean sumOfTwo(Integer[] a, Integer[] b, int v) {
		
		Boolean has = false;
		int current = 0;
		
		Set<Integer> hashA = new HashSet<>(Arrays.asList(a));
        Set<Integer> hashB = new HashSet<>(Arrays.asList(b));
		
        Iterator<Integer> itr = hashA.iterator();
        
        while (itr.hasNext() ^ has) {
        	current = itr.next();
            if (hashB.contains(v - current)) {
            	has = true;
            } else
            	has = false;
        }
        
        return has;
		
	}
}
