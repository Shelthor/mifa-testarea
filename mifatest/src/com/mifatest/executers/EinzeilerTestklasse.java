package com.mifatest.executers;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.*;

public class EinzeilerTestklasse {

	public static void main(String[] args) {
		Facade f = new Facade();
		
		f.newBewertung("haalll", 2, 2, 3, f.getUserById(1), f.getUserById(2), new Date(), f.getFahrtById(1));
		//f.newPassagierFahrt(f.getUserById(1), f.getFahrtById(1), "Dresden", "Leipzig");

	}

}
