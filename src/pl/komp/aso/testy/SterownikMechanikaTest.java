package pl.komp.aso.testy;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.sterowniki.SterownikMechanika;
import pl.komp.aso.sterowniki.SterownikWarsztatu;

public class SterownikMechanikaTest {

SterownikMechanika sm;
Uzytkownik u;
	
	@Before
	public void prepare() {
		sm = new SterownikMechanika();
		u=new Uzytkownik();
		u.setLogin("amil");
	}
	@Test
	public void pobierzWarsztatTest() {
		Warsztat w= sm.pobierzWarsztat(u);
		assertEquals("Pszona 16",w.getAdres());
		assertEquals("Kraków",w.getMiasto());
		assertEquals("555666777",w.getNrTelefonu());
		
	}
	
	@Test
	public void pobierzFormularzeTest() {
		ArrayList<FormularzNaprawy> formularze = sm.pobierzFormularze(u,"warsztat");
		assertEquals(2,formularze.size());
		formularze = sm.pobierzFormularze(u,"oczekiwanie");
		assertEquals(1,formularze.size());
		formularze = sm.pobierzFormularze(u,"potwierdzenie");
		assertEquals(1,formularze.size());
		formularze = sm.pobierzFormularze(u,"zakonczone");
		assertEquals(0,formularze.size());
	}
	
	@Test
	public void sortujFormularzeTest() {
		ArrayList<FormularzNaprawy> formularze = sm.pobierzFormularze(u,"warsztat");
		formularze=sm.sortujFormularze(formularze);
		assertEquals("12/06/2017",formularze.get(0).getDataOddania());
		assertEquals("12/06/2017",formularze.get(1).getDataOddania());
	}
	
	@Test
	public void pobierzCzesciTest() {
		ArrayList<Czesc>czesci=sm.pobierzCzesci("Caddy", "2008", "Kombi", "2.0", u);
		assertEquals(0,czesci.size());
	}
	
	@Test
	public void pobierzCzescTest() {
		Czesc czesc=sm.pobierzCzesc(3, u);
		assertEquals("wysprzęglik",czesc.getNazwa());
		assertEquals(14,czesc.getIlosc());
	}

}
