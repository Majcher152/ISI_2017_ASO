package pl.komp.aso.sterowniki;

import pl.komp.aso.dto.Uzytkownik;

public class SterownikLogowania {
	private SterownikPolBD spbd=new SterownikPolBD();
	
	public int uwierzytelnij(String login,String haslo) {
		
		String znak="`~!@#$%^&*()_-+=<,.>?;:'{}][|/";
		
		
		if(login ==null || login.equals("")) {
			return 1;
		}
		if(haslo==null || haslo.equals("")) {
			return 2;
		}
		
		for(int i=0;i<znak.length();i++) {
			for (char c : login.toCharArray())
				if(c==znak.charAt(i))
					return -1;
		}
		
		
		int odp = spbd.zaloguj(login, haslo);
		return odp;	
	}

	public Uzytkownik getUzytkownik(String login) {
		Uzytkownik uzytkownik = spbd.pobierzUzytkownika(login);
		return uzytkownik;
	}
}
