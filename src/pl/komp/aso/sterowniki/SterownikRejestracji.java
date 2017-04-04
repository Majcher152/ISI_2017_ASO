package pl.komp.aso.sterowniki;

public class SterownikRejestracji {

	public int uwierzytelnij(String imie, String nazwisko, String email, String nrTelefonu, String login, String haslo,String haslo2) {
		
		String litery="abcdefghijklmnoprstuwxyząęćźżńół";
		String liczby = "1234567890";
		String alfanumeryczne = litery+liczby;
			
		//bledne znaki w imieniu
		if(!sprawdzZnaki(imie, litery))
			return 1;
		//bledne znaki w nazwisku
		if(!sprawdzZnaki(nazwisko, litery))
			return 2;
		//inne znaki niz cyfry w numerze
		if(!sprawdzZnaki(nrTelefonu,liczby))
			return 3;
		
		//bledne znaki w loginie
		if(!sprawdzZnaki(login,alfanumeryczne))
			return 4;
		
		//za dlugie imie
		if(!maxDlugosc(imie,30))
			return 5;
		
		//za dlugie nazwisko
		if(!maxDlugosc(nazwisko,30))
			return 6;
		
		//za dlugi login
		if(!maxDlugosc(login,16))
			return 7;
		
		//za krotki login
		if(!minDlugosc(login,4))
			return 8;
		
		//za krotkie haslo
		if(!minDlugosc(haslo,8))
			return 9;
		
		//za dlugie haslo
		if(!maxDlugosc(haslo,18))
			return 10;
		
		//bledna ilosc cyfr w numerze telefonu
		if(nrTelefonu.length()!=9)
			return 11;
		
		//haslo za slabe
		if(!silaHasla(haslo))
			return 12;
		
		//hasla sie nie zgadzaja
		if(!haslo.equals(haslo2))
			return 13;
		
		
		//wszystko poprawne
		return 0;
	}

	private boolean sprawdzZnaki(String wejscie, String ciag) {
		boolean czyInna=true;
		String nazwa=wejscie.toLowerCase();
		// sprawdzenie imienia
		for (char c : nazwa.toCharArray()) {
			for (int i = 0; i < ciag.length(); i++) {
				if (c == ciag.charAt(i)) {
					czyInna=false;
					break;
				}
			}
			if(czyInna)
				return false;
		}
		return true;
	}	
	
	private boolean maxDlugosc(String wejscie,int max) {
		if(wejscie.length()>max)
			return false;
		return true;
	}
	
	private boolean minDlugosc(String wejscie,int min) {
		if(wejscie.length()<min)
			return false;
		return true;
	}
	
	private boolean silaHasla(String haslo) {
		String liczby = "1234567890";
		String znaki = "~`!@#$%^&*()_-+= {}[]|:;'<,>.?";
		boolean hasUppercase = !haslo.equals(haslo.toLowerCase());
		boolean hasLowercase = !haslo.equals(haslo.toUpperCase());
		if(czyMaZnak(haslo,liczby)&& czyMaZnak(haslo,liczby)&& hasUppercase && hasLowercase )
			return true;
		return false;	
	}
	
	private boolean czyMaZnak(String haslo,String ciag) {
		
		int i;
		for(char c: haslo.toCharArray()) {
			i=0;
			while(i<ciag.length()) {
				if(ciag.charAt(i)==c)
					return true;
				i++;
			}
		}
		return false;
	}
	
	
}
