package junit_GameOfLife;
import java.io.IOException;
import java.util.Random;

public class GameOfLife {
	//Algorithmus der Automatentheorie
	//erstelle ein beliebig großes Feld x mal x
	//jede Zelle darauf ist entweder lebendig oder tot
	//erzeuge per random eine Anfangspopulation
	//entwickle x Generationen:
	// - eine tote Zelle mit genau 3 lebenden Nachbarn = lebt (wieder)
	// - eine lebende Zelle mit weniger als 2 lebenden Nachbarn = stirbt (einsam)
	// - eine lebende Zelle mit 2 oder 3 lebenden Nachbarn = lebt (weiter)
	// - eine lebende Zelle mit mehr als 3 lebenden Nachbarn = stirbt (an Mangel)
	
	
	//--------------------------------------------------------------------
	
	public static void main (String [] args) throws IOException {
		
		int gen = 5;
		int n = 10;
		int [][] fields = new int [n][n];
		int [][] fieldsNew;
		int start = random(n/2);
		
		
		//creating x generations, first generation is random -> g == 0 
		
		for (int g = 0; g <= gen; g++ ) {
			
			fieldsNew = new int [n][n]; //reseting array for analyzing
			
			//x line
			for (int i = 0; i < n; i++) {
				
				//y line
				for (int j = 0; j < n; j++) {
					
					//analyzing fields
					if (g == 0 && i < n/2 && j < n/2) { //random creates 9 random "people" starting on a random field
						fieldsNew[i+start][j+start] = random(2);
					} else if (g > 0) {
						fieldsNew[i][j] = deadOrAlive(fields, i, j);
					}
					
					//outprint
					switch(fieldsNew[i][j]) {
					case 1: shout("#"); break;
					default: shout("-");
					}
					
				}
				
				shout("\n");
			}
			
			shout("--------------------\n");
			
			//overwriting array for next method jump
			fields = fieldsNew; 
		}
	}
	
	//--------------------------------------------------------------------
	
	public static int deadOrAlive (int [][] field, int x, int y) {
		
		int sum = 0;
						
		for (int i = x-1; i <= (x+1); i++) {
			for (int j = y-1; j <= (y+1); j++) {
				
				if (i != x || j != y) { // i == x && j == y would be the current field
					try {
						//sum up all the alive one's (1) surrounding the current field
						sum += (field[i][j] >=0 ? field[i][j] : 0);
						
					} catch (IndexOutOfBoundsException e) {
						sum += 0;
					}
				}
				
			}
		}
			
		//checking if the current field is dead and surrounded by 3 alives OR is alive and surrounded by 2 or 3 alives
		if ((field[x][y] == 0 && sum == 3) ^ (field[x][y] == 1 && (sum == 2 || sum == 3))) {
			return 1;
			
			//otherwise dies or remains dead
		} else {
			return 0;
		}
	}
	
	//--------------------------------------------------------------------
	
	public static int random (int bound) {
		
		Random rd = new Random();
		return rd.nextInt(bound);
		
	}
	
	//--------------------------------------------------------------------
	
	public static void shout (String content) {
		
		System.out.printf("%2s", content);
	}
	
	
}
