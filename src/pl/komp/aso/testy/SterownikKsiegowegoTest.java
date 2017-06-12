package pl.komp.aso.testy;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Zamowienie;
import pl.komp.aso.sterowniki.SterownikKsiegowego;
import pl.komp.aso.sterowniki.SterownikMechanika;

public class SterownikKsiegowegoTest {

	SterownikKsiegowego sk;
	Uzytkownik u;
		
		@Before
		public void prepare() {
			sk = new SterownikKsiegowego();
			u=new Uzytkownik();
			u.setLogin("filemon");
		}
		
	@Test
	public void pobierzCzesciMagazynTest() {
		ArrayList<Czesc>czesci= sk.pobierzCzesciMagazyn("Lupo", "2001", "Hatchback","1.9");
		assertEquals(2,czesci.size());
	}
	
	@Test
	public void pobierzCzesciWarsztatTest() {
		ArrayList<Czesc>czesci= sk.pobierzCzesciWarsztat("Lupo", "2001", "Hatchback","1.9",1);
		assertEquals(0,czesci.size());
	}
	
	@Test
	public void obliczKosztTest() {
		ArrayList<Czesc>czesci=new ArrayList<Czesc>();
		Czesc c1= new Czesc();
		c1.setCena(100);
		c1.setIlosc(5);
		Czesc c2= new Czesc();
		c2.setCena(200);
		c2.setIlosc(2);
		czesci.add(c1);
		czesci.add(c2);
		assertEquals(900,sk.obliczKoszt(czesci),0.0000001);
	}
	
	
	@Test
	public void sortujZamowieniaTest() {
		ArrayList<Zamowienie>zamowienia = new ArrayList<Zamowienie>();
		Zamowienie z1= new Zamowienie();
		z1.setData("10/12/2017");
		Zamowienie z2=new Zamowienie();
		z2.setData("10/11/2017");
		zamowienia.add(z1);
		zamowienia.add(z2);
		zamowienia=sk.sortujZamowienia(zamowienia);
		assertEquals("10/11/2017",zamowienia.get(0).getData());
	}

}
