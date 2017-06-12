package pl.komp.aso.testy;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.dto.Zamowienie;
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
	public void czyIstniejeLoginTest() {
		assertTrue(spbd.czyIstniejeLogin("aga234"));
		assertFalse(spbd.czyIstniejeLogin("joejoe"));
		assertTrue(spbd.czyIstniejeLogin("janosik"));
		assertFalse(spbd.czyIstniejeLogin("kamil123"));
	}
	
	@Test
	public void czyIstniejeEmailTest() {
		assertTrue(spbd.czyIstniejeEmail("goryl.to.wielka@interia.pl"));
		assertFalse(spbd.czyIstniejeEmail("joejoe@o2.pl"));
		assertTrue(spbd.czyIstniejeEmail("kasiaftw@gmail.com"));
		assertFalse(spbd.czyIstniejeEmail("kamil123@wp.pl"));
	}
	
	@Test
	public void czyIstniejeEmailEdycjaTest() {
		assertTrue(spbd.czyIstniejeEmailEdycja("goryl.to.wielka@interia.pl", "goryl"));
		assertFalse(spbd.czyIstniejeEmailEdycja("joejoe@o2.pl", "Robak"));
		assertTrue(spbd.czyIstniejeEmailEdycja("kasiaftw@gmail.com", "Kasia"));
		assertFalse(spbd.czyIstniejeEmailEdycja("kamil123@wp.pl", "kamil"));
	}
	
	@Test
	public void czyIstniejeNrTelefonuTest() {
		assertTrue(spbd.czyIstniejeNrTelefonu("555777888"));
		assertFalse(spbd.czyIstniejeNrTelefonu("502193123"));
		assertTrue(spbd.czyIstniejeNrTelefonu("412412412"));
		assertFalse(spbd.czyIstniejeNrTelefonu("091232432"));
	}
	
	@Test
	public void czyIstniejeNrTelefonuEdycjaTest() {
		assertTrue(spbd.czyIstniejeNrTelefonuEdycja("555777888","goryl"));
		assertFalse(spbd.czyIstniejeNrTelefonuEdycja("502193123", "andrzej"));
		assertTrue(spbd.czyIstniejeNrTelefonuEdycja("412412412", "justus"));
		assertFalse(spbd.czyIstniejeNrTelefonuEdycja("091232432", "karol"));
	}
	
	@Test
	public void znajdzSamochodTest() {
		assertEquals("392242", spbd.znajdzSamochod("Caddy","2006","Van","1.9"));
		assertEquals("392243", spbd.znajdzSamochod("Golf","2010","Kombi","1.9"));
		assertEquals("392254", spbd.znajdzSamochod("Lupo","2004","Sedan","4.0"));
		assertEquals("392262", spbd.znajdzSamochod("Passat","2005","Kombi","1.4"));
	}
	
	@Test
	public void pobierzSamochodyTest() {
		ArrayList<Samochod> samochody = new ArrayList<Samochod>();
		ArrayList<Samochod> samochody1 = spbd.pobierzSamochody("aga234");
		Samochod s = new Samochod();
		s.setModel("Up");
		s.setRocznik(2013);
		s.setTyp("Kombi");
		s.setSilnik("1.9");
		s.setVin("123456789abcdefa");
		samochody.add(s);
		s = new Samochod();
		s.setModel("Caddy");
		s.setRocznik(2006);
		s.setTyp("Van");
		s.setSilnik("1.9");
		s.setVin("123456789abcdefg");
		samochody.add(s);
		s = new Samochod();
		s.setModel("Fox");
		s.setRocznik(2014);
		s.setTyp("Hatchback");
		s.setSilnik("2.0");
		s.setVin("qwertyuiop1234657");
		samochody.add(s);
		
		assertEquals(samochody.get(0).getModel(), samochody1.get(0).getModel());
		assertEquals(samochody.get(0).getId(), samochody1.get(0).getId());
		assertEquals(samochody.get(1).getSilnik(), samochody1.get(1).getSilnik());
		assertEquals(samochody.get(2).getVin(), samochody1.get(2).getVin());
	}
	
	@Test
	public void czyIstniejeVinTest() {
		assertTrue(spbd.czyIstniejeVin("123456789abcdefa"));
		assertFalse(spbd.czyIstniejeVin("1231233132313"));
		assertTrue(spbd.czyIstniejeVin("123456789abcdefg"));
		assertFalse(spbd.czyIstniejeVin("643654365636456"));
	}
	
	@Test
	public void pobierzWarsztatyTest() {
		ArrayList<Warsztat> warsztaty = new ArrayList<Warsztat>();
		ArrayList<Warsztat> warsztaty1 = spbd.pobierzWarsztaty();
		
		Warsztat w = new Warsztat();
		w.setAdres("Pszona 16");
		w.setMiasto("Kraków");
		w.setNrTelefonu("555666777");
		w.setEmail("pszona@koska.pl");
		w.setGodzinaO("10:00");
		w.setGodzinaZ("17:00");
		w.setIloscStanowisk(2);
		w.setId(1);
		warsztaty.add(w);
		
		assertEquals(warsztaty.get(0).getAdres(), warsztaty1.get(0).getAdres());
		assertEquals(warsztaty.get(0).getGodzinaO(), warsztaty1.get(0).getGodzinaO());
		assertEquals(warsztaty.get(0).getEmail(), warsztaty1.get(0).getEmail());
	}
	
	@Test
	public void czyZajetaGodzinaTest() {
		assertEquals(1, spbd.czyZajetaGodzina(1, "19/06/2017", "12:00"));
		assertEquals(0, spbd.czyZajetaGodzina(3, "20/06/2017", "12:00"));
		assertEquals(2, spbd.czyZajetaGodzina(1, "12/06/2017", "10:00"));
		assertEquals(0, spbd.czyZajetaGodzina(15,"22/07/2020", "11:00"));
	}
	
	@Test
	public void pobierzWarsztatIdTest() {
		Warsztat w = spbd.pobierzWarsztatId(1);
		
		assertEquals("Pszona 16", w.getAdres());
		assertEquals("555666777", w.getNrTelefonu());
		assertEquals("pszona@koska.pl", w.getEmail());
		assertEquals("Kraków", w.getMiasto());
	}
	
	@Test
	public void pobierzSamochodVinTest() {
		Samochod s = spbd.pobierzSamochodVin("123456789abcdefa");
		
		assertEquals("Up", s.getModel());
		assertEquals(2013, s.getRocznik());
		assertEquals("Kombi", s.getTyp());
		assertEquals("1.9", s.getSilnik());
	}
	
	@Test
	public void pobierzIdWarsztatuTest() {
		assertEquals(1, spbd.pobierzIdWarsztatu("amil"));
		assertEquals(2, spbd.pobierzIdWarsztatu("grzesiu"));
		assertEquals(1, spbd.pobierzIdWarsztatu("krzysiu"));
	}
	
	@Test
	public void pobierzFormularzeMechanikaTest() {
		ArrayList<FormularzNaprawy> formularze = spbd.pobierzFormularzeMechanika(1,"warsztat");
		
		assertEquals("12/06/2017", formularze.get(0).getDataOddania());
		assertEquals(4, formularze.get(0).getId());
		assertEquals(3, formularze.get(0).getPrzewidywany_czas());
	}
	
	@Test
	public void pobierzFormularzTest() {
		FormularzNaprawy f = spbd.pobierzFormularz(1);
		
		assertEquals("12/06/2017", f.getDataOddania());
		assertEquals(1, f.getId());
		assertEquals(6, f.getPrzewidywany_czas());
	}
	
	@Test
	public void pobierzCzesciTest() {
		ArrayList<Czesc> czesci = spbd.pobierzCzesci(2,392242);
		
		assertEquals(2, czesci.get(0).getId());
		assertEquals("bęben hamulcowy", czesci.get(0).getNazwa());
		assertEquals(0.0, czesci.get(0).getCena(), 0000.1);

	}
	
	@Test
	public void pobierzCzescTest() {
		Czesc czesci = spbd.pobierzCzesc(16,1);
		
		assertEquals(16, czesci.getId());
		assertEquals("szyba tylnia", czesci.getNazwa());
		assertEquals(0.0, czesci.getCena(), 0000.1);

	}
	
	@Test
	public void pobierzSamochodIdTest() {
		Samochod s = spbd.pobierzSamochodId("Lupo","2004","Sedan","4.0");
		
		
		assertEquals(392254, s.getId());
		assertEquals("Lupo", s.getModel());
		assertEquals("Sedan", s.getTyp());
		assertEquals("4.0", s.getSilnik());
	}
	
	@Test
	public void pobierzCzescIdTest() {
		Czesc czesci = spbd.pobierzCzesc(10);
		
		assertEquals(10, czesci.getId());
		assertEquals("olej", czesci.getNazwa());
		assertEquals(530.0, czesci.getCena(), 0000.1);

	}
	
	@Test
	public void pobierzZamowieniaTest() {
		ArrayList<Zamowienie> zamowienia = spbd.pobierzZamowienia();
		
		assertEquals(5, zamowienia.get(0).getId());
		assertEquals(6, zamowienia.get(1).getId());
		assertEquals(7,zamowienia.get(2).getId());

	}
	
	@Test
	public void pobierzZamowienieTest() {
		Zamowienie zamowienia = spbd.pobierzZamowienie(5);
		
		assertEquals(15764.00 , zamowienia.getKoszt(), 000.1);
		assertEquals("11/06/2017", zamowienia.getData());

	}
	
	@Test
	public void pobierzCzesciZamowienieTest() {
		ArrayList<Czesc> czesci = spbd.pobierzCzesciZamowienie(5);
		
		assertEquals(10 , czesci.get(0).getIlosc(),00.1);
		assertEquals(3 , czesci.get(1).getIlosc(),00.1);

	}
	
	@Test
	public void pobierzUzytkownikowEmailTest() {
		ArrayList<Uzytkownik> uzytkownicy = spbd.pobierzUzytkownikowEmail();
		
		assertEquals("ooskaa93@gmail.com" , uzytkownicy.get(0).getEmail());
		assertEquals("Uzytkownik", uzytkownicy.get(0).getRodzaj());

	}
	
	@After
	public void finish(){
		spbd = null;
	}

}
