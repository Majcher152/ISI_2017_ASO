package pl.komp.aso.sterowniki;

import pl.komp.aso.dto.Uzytkownik;

public class SterownikLogowania {
	private SterownikPolBD spbd=new SterownikPolBD();
	
	public int uwierzytelnij(String login,String haslo) {
		if(login ==null || login.equals("")) {
			return 1;
		}
		if(haslo==null || haslo.equals("")) {
			return 2;
		}
		
		int odp = spbd.zaloguj(login, haslo);
		return odp;	
	}

	public Uzytkownik getUzytkownik(String login) {
		Uzytkownik uzytkownik = spbd.pobierzUzytkownika(login);
		return uzytkownik;
	}
}
