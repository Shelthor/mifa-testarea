package com.mifatest.executers;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.mifatest.entities.*;

public class EinzeilerTestklasse {

	public static void main(String[] args) {
		Facade f = new Facade();
		
		f.newPassagierFahrt(f.getUserById(1), f.getFahrtById(1), "Dresden", "Leipzig");
		f.session.close();

	}

}
