package pl.komp.aso.testy;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikKlienta;

public class EdytowanieUstawienTest {
	
	@Test
	public void testUwierzytelnijImie() {
		SterownikKlienta sk = new SterownikKlienta();
		// Imie ma cyfry ( błędne znaki)
		Assert.assertEquals(1, sk.uwierzytelnij("89saasdasdasds", null, null, null, null));
		// Imie ma ponad 30 znaków (jest za długie)
		Assert.assertEquals(5, sk.uwierzytelnij("abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca",
				null, null, null, null));
		// Imie jest równe null (nie podane)
		Assert.assertEquals(18, sk.uwierzytelnij(null, null, null, null, null));
	}

	@Test
	public void testUwierzytelnijNazwisko() {
		SterownikKlienta sk = new SterownikKlienta();
		// Nazwisko zawiera cyfry i inne znaki ( błędne znaki)
		Assert.assertEquals(2, sk.uwierzytelnij("Kamilek", "#%^78", null, null, null));
		// Nazwisko ma ponad 30 znaków (jest za długie)
		Assert.assertEquals(6, sk.uwierzytelnij("Kamilek",
				"abcabcabcabcabcabcabcabcabcabcabcabcabcabcbacbacbacabcabcabcabca", null, null, null));
		// Nazwisko jest równe null (nie podane)
		Assert.assertEquals(19, sk.uwierzytelnij("Kamilek", null, null, null, null));
	}

	@Test
	public void testUwierzytelnijNumerTelefonu() {
		SterownikKlienta sk = new SterownikKlienta();
		// Numer telefonu zawiera litery (błędne znaki)
		Assert.assertEquals(3, sk.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "&*^", null));
		// Numer telefonu zawiera mniej niż 9 cyfer (jest za krótkie)
		Assert.assertEquals(11, sk.uwierzytelnij("Kamilek", "Nowak", "dlaczego@koska.pl", "000", null));

	}

	@Test
	public void testUwierzytelnijEmail() {
		SterownikKlienta sk = new SterownikKlienta();
		// Niepoprawny adres email(brak końcówki)
		Assert.assertEquals(17, sk.uwierzytelnij("Kamilek", "Nowak", "emailemail@", null, null));


	}

	@Test
	public void testUwierzytelnijHaslo() {
		SterownikKlienta sk = new SterownikKlienta();
		Uzytkownik u = new Uzytkownik();
		u.setHaslo("Oskaoska1");
		// Stare hasło jest niepoprawne ( niezgodność haseł)
		Assert.assertEquals(1, sk.uwierzytelnijHaslo(u, "Amilamil1", "mal", null));
	}

	@Test
	public void testEdytujDane() {
		SterownikKlienta sk = new SterownikKlienta();
		Uzytkownik u = new Uzytkownik();
		u.setLogin("oska12");
		// Poprawnie zapisane dane
		// baza danych
		Assert.assertEquals(true, sk.edytujDane("Andrzej", "Krzysiu", "zabilimizolwia@koska.pl", "101010101", u));
	}



}
