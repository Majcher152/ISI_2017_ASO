package pl.komp.aso.sterowniki;

import pl.komp.aso.interfejsy.Uwierzytelnij;

public class SterownikAdmina extends SterownikUwierzytelnijAdmin implements Uwierzytelnij {
	SterownikPolBD spbd = new SterownikPolBD();

	public int uwierzytelnij(String imie, String nazwisko, String email, String numer_telefonu, String login,
			String noweHaslo, String noweHaslo2) {
		SterownikRejestracji sr = new SterownikRejestracji();

		// za krotkie haslo
		if (!sr.minDlugosc(noweHaslo, 8))
			return 9;

		// za dlugie haslo
		if (!sr.maxDlugosc(noweHaslo, 18))
			return 10;

		// haslo za slabe
		if (!sr.silaHasla(noweHaslo))
			return 12;

		// hasla sie nie zgadzaja
		if (!noweHaslo.equals(noweHaslo2))
			return 13;
		// wszystko poprawne

		return uwierzytelnij(imie, nazwisko, email, numer_telefonu, login);
	}


	public boolean zapiszEdycjeInformacji(String imie, String nazwisko, String email, String numer_telefonu,
			String login, String haslo, String rodzaj_konta) {
		if (spbd.zapiszEdycjeInformacji(imie, nazwisko, email, numer_telefonu, login, haslo, rodzaj_konta))
			return true;

		return false;
	}

}
