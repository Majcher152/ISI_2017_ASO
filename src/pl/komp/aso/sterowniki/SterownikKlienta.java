package pl.komp.aso.sterowniki;

import java.util.ArrayList;
import java.util.regex.Pattern;

import org.apache.commons.codec.digest.DigestUtils;

import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.interfejsy.Uwierzytelnij;

public class SterownikKlienta extends SterownikUwierzytelnijAdmin implements Uwierzytelnij {
	SterownikPolBD spbd = new SterownikPolBD();

	public int uwierzytelnij(String imie, String nazwisko, String email, String numer_telefonu, String login) {
		// email juz istnieje(chyba ze nalezy do tej osoby)
		if (spbd.czyIstniejeEmail(email)) {
			if (!spbd.czyIstniejeEmailEdycja(email, login))
				return 15;
		}

		// nr telefonu juz istnieje(chyba ze nalezy do tej osoby)
		if (spbd.czyIstniejeNrTelefonu(numer_telefonu)) {
			if (!spbd.czyIstniejeNrTelefonuEdycja(numer_telefonu, login))
				return 16;
		}
		// wszystko poprawne

		return uwierzytelnijAdmin(imie, nazwisko, email, numer_telefonu, login);
	}

	public int uwierzytelnijUsuwanie(String login) {
		if (!spbd.czyIstniejeLogin(login)) {
			return -1;
		}
		return 0;
	}

	public int uwierzytelnijHaslo(Uzytkownik uzytkownik, String stareHaslo, String noweHaslo, String noweHaslo2) {
		stareHaslo = DigestUtils.sha1Hex(stareHaslo);
		SterownikRejestracji sr = new SterownikRejestracji();
		String litery = "abcdefghijklmnopqrstuvxwyząęćźżńół";
		String liczby = "1234567890";
		String alfanumeryczne = litery + liczby;
		// stare haslo zle
		if (!stareHaslo.equals(uzytkownik.getHaslo()))
			return 1;

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
		return 0;
	}

	public void usunKonto() {

	}

	public boolean edytujDane(String imie, String nazwisko, String email, String numer_telefonu,
			Uzytkownik uzytkownik) {
		String login = uzytkownik.getLogin();
		if (spbd.edytujUstawienia(imie, nazwisko, email, numer_telefonu, login)) {
			uzytkownik.setEmail(email);
			uzytkownik.setImie(imie);
			uzytkownik.setNazwisko(nazwisko);
			uzytkownik.setNrTelefonu(Integer.parseInt(numer_telefonu));
			return true;
		}
		return false;
	}

	public boolean edytujHaslo(Uzytkownik u, String haslo) {
		haslo = DigestUtils.sha1Hex(haslo);
		if (spbd.edytujHaslo(u.getLogin(), haslo)) {
			u.setHaslo(haslo);
			return true;
		}
		return false;
	}

	public boolean zarezerwujPrzeglad(String vin, String adres, String dzien, String godzina) {
		boolean odp = false;
		Warsztat w = spbd.pobierzWarsztat(adres);
		if (spbd.zarezerwujPrzeglad(vin, w.getId(), dzien, godzina)) {
			odp = true;
		}
		return odp;
	}

	public boolean zarezerwujNaprawe(String vin, String adres, String dzien, String opis, Uzytkownik u) {
		boolean odp = false;
		Warsztat w = spbd.pobierzWarsztat(adres);
		if (spbd.zarezerwujNaprawe(vin, w.getId(), dzien, opis, u.getLogin())) {
			odp = true;
			u.setFormularze(spbd.pobierzFormularze(u.getLogin()));
		}
		return odp;
	}

	public int dodajAuto(Uzytkownik uzytkownik, String model, String rocznik, String typ, String silnik, String vin) {
		String login = uzytkownik.getLogin();
		if (spbd.czyIstniejeVin(vin))
			return 1;
		if (!spbd.dodajAuto(model, rocznik, typ, silnik, login, vin))
			return -1;
		Samochod s = new Samochod();
		s.setModel(model);
		s.setRocznik(Integer.parseInt(rocznik));
		s.setSilnik(silnik);
		s.setTyp(typ);
		s.setVin(vin);
		s.setWarsztat(false);
		ArrayList<Samochod> list = uzytkownik.getSamochody();
		list.add(s);
		uzytkownik.setSamochody(list);
		return 0;
	}

	public boolean usunAuto(String vin, Uzytkownik u) {
		if (!spbd.usunSamochod(vin)) {
			return false;
		}
		ArrayList<Samochod> samochody = (ArrayList<Samochod>) spbd.pobierzSamochody(u.getLogin());
		u.setSamochody(samochody);
		return true;
	}

	public boolean usunUzytkownika(String login) {
		if (!spbd.usunUzytkownika(login)) {
			return false;
		}
		return true;
	}
}
