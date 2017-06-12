package pl.komp.aso.testy;

import static org.junit.Assert.*;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.sterowniki.SterownikPolBD;

public class SterownikPolBDTest {
	
	SterownikPolBD spbd;
	
	@Before
	public void prepare() {
		spbd = new SterownikPolBD();
	}

	@Test
	public void zalogujTest() {
		assertEquals(5, spbd.zaloguj("aga234", DigestUtils.sha1Hex("Oskaoska1")));
		assertEquals(6, spbd.zaloguj("grzesiu", DigestUtils.sha1Hex("Oskaoska1")));
		assertEquals(7, spbd.zaloguj("filemon", DigestUtils.sha1Hex("Oskaoska1")));
		assertEquals(8, spbd.zaloguj("kasia", DigestUtils.sha1Hex("Oskaoska1")));
	}
	
	@Test
	public void pobierzUzytkownikaTest() {
		Uzytkownik user = new Uzytkownik();
		user = spbd.pobierzUzytkownika("aga234");
		
		assertEquals("Agnieszka", user.getImie());
		assertEquals("Kozłowska", user.getNazwisko());
		assertEquals(456563256, user.getNrTelefonu());
		
		user = null;
	}
	
	@Test
	public void czyIstniejeTest() {
		
	}
	
	@After
	public void finish(){
		spbd = null;
	}

}
