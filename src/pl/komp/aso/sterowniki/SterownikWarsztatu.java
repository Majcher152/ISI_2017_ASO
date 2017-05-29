package pl.komp.aso.sterowniki;

import java.util.ArrayList;

public class SterownikWarsztatu {
	SterownikPolBD spbd = new SterownikPolBD();
	SterownikKlienta sk= new SterownikKlienta();
	
	
	public ArrayList<String> sprawdzDni(String adres) {
		ArrayList<String> dni=new ArrayList<String>();
		
		return dni;
	}
	
	public ArrayList<String> sprawdzGodziny(String adres,String dzien) {
		ArrayList<String> godziny=new ArrayList<String>();
		return godziny;
	}
}
