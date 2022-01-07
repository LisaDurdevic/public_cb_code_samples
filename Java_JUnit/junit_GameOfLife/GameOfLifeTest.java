package junit_GameOfLife;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class GameOfLifeTest {

	@Test
	void fieldDiesLonesomeAndOutOfRange() {
		int x = 2;
		int y = 2;
		int [][] fields = new int [3][3];
		fields[0][0] = 1;
		fields[0][1] = 1;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[1][1] = 0;
		fields[1][2] = 0;
		fields[2][0] = 1;
		fields[2][1] = 0;
		fields[x][y] = 1;
		
		assertEquals(0, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test
	void fieldDiesForOverpopulation() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 1;
		fields[0][1] = 1;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[x][y] = 1;
		fields[1][2] = 0;
		fields[2][0] = 0;
		fields[2][1] = 0;
		fields[2][2] = 0;
		
		assertEquals(0, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test 
	void fieldStaysDeadForTwoAndOutOfRange() {
		int x = 0;
		int y = 0;
		int [][] fields = new int [3][3];
		fields[x][y] = 0;
		fields[0][1] = 1;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[1][1] = 0;
		fields[1][2] = 1;
		fields[2][0] = 1;
		fields[2][1] = 1;
		fields[2][2] = 1;
		
		assertEquals(0, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test
	void fieldStaysDeadForOne() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 0;
		fields[0][1] = 0;
		fields[0][2] = 0;
		fields[1][0] = 1;		
		fields[x][y] = 0;
		fields[1][2] = 0;
		fields[2][0] = 0;
		fields[2][1] = 0;
		fields[2][2] = 0;
		
		assertEquals(0, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test
	void fieldStaysDeadForOverpopulation() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 0;
		fields[0][1] = 0;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[x][y] = 0;
		fields[1][2] = 1;
		fields[2][0] = 1;
		fields[2][1] = 0;
		fields[2][2] = 0;

		assertEquals(0, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test
	void fieldComesAliveForThree() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 0;
		fields[0][1] = 0;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[x][y] = 0;
		fields[1][2] = 1;
		fields[2][0] = 0;
		fields[2][1] = 0;
		fields[2][2] = 0;
		
		assertEquals(1, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test 
	void fieldLivesFurtherForTwo() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 0;
		fields[0][1] = 0;
		fields[0][2] = 0;
		fields[1][0] = 1;		
		fields[x][y] = 1;
		fields[1][2] = 1;
		fields[2][0] = 0;
		fields[2][1] = 0;
		fields[2][2] = 0;

		assertEquals(1, GameOfLife.deadOrAlive(fields, x, y));
	}
	
	@Test
	void fieldLivesFurtherForThree() {
		int x = 1;
		int y = 1;
		int [][] fields = new int [3][3];
		fields[0][0] = 0;
		fields[0][1] = 0;
		fields[0][2] = 1;
		fields[1][0] = 1;		
		fields[x][y] = 1;
		fields[1][2] = 1;
		fields[2][0] = 0;
		fields[2][1] = 0;
		fields[2][2] = 0;

		assertEquals(1, GameOfLife.deadOrAlive(fields, x, y));
	}
	
}
