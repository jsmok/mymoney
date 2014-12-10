package pl.jsmok.mymoney.stats;

import org.apache.commons.math3.stat.correlation.PearsonsCorrelation;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		double[] me = {0, 5, 4, 7, 9, 0, 1};
		
		double[] p1 = {0, 5, 4, 7, 9, 0, 1};
		double[] p2 = {0, 3, 2, 0, 4, 0, 6};
		double[] p3 = {0, 4, 6, 5, 7, 0, 2};
		
		 PearsonsCorrelation pc = new PearsonsCorrelation();
		 
		 System.out.println(pc.correlation(me, p1));
		 System.out.println(pc.correlation(me, p2));
		 System.out.println(pc.correlation(me, p3));
	}

}
