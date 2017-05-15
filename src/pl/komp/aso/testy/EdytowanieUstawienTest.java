package pl.komp.aso.testy;

import static org.junit.Assert.*;

import org.junit.Assert;
import org.junit.Test;


import pl.komp.aso.sterowniki.SterownikKlienta;

public class EdytowanieUstawienTest {

	@Test
	public void testUwierzytelnij() {
		SterownikKlienta ks = new SterownikKlienta();
		
		
       //testowanie imienia
		//imie jest puste
        Assert.assertEquals(18, ks.uwierzytelnij(null, null, null, null, null, null, null));
        //imie jest za dlugie
        Assert.assertEquals(5, ks.uwierzytelnij("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", null, null, null, null, null, null));
        //bledne znaki w imieniu 
        Assert.assertEquals(1, ks.uwierzytelnij("34ssss", null, null, null, null, null, null));
        //testowanie nazwiska
        //nazwisko jest puste
        Assert.assertEquals(19, ks.uwierzytelnij("Kasia", null, null, null, null, null, null));
        //nazwisko jest za dlugie
        Assert.assertEquals(2, ks.uwierzytelnij("Kasia", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", null, null, null, null, null));
        //bledne znaki w nazwisku
        Assert.assertEquals(6, ks.uwierzytelnij("Kasia", "4343<<", null, null, null, null, null));
        //testowanie emaila
        //bledny adres
        Assert.assertEquals(17, ks.uwierzytelnij("Kasia", "Klimek", "xxxx@", null, null, null, null));
        //email juz istnieje 
        Assert.assertEquals(15, ks.uwierzytelnij("Kasia", "Klimek", "katha.ftw@gmail.com", null, "kk", null, null));
        //testowanie nr telefonu
        //nie cyfry
        Assert.assertEquals(3, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "kkkk", null, null, null));
        //bledna ilosc cyfr
        Assert.assertEquals(11, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "111", null, null, null));
        //juz istnieje
        Assert.assertEquals(16, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883431798", "kk", null, null));
        //testowanie hasla
        //za krotkie
        Assert.assertEquals(9, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883451798", "kk", "xx", null));
        //za dlugie
        Assert.assertEquals(10, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883451798", "kk", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", null));
        //za slabe
        Assert.assertEquals(12, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883451798", "kk", "xxXxxxxxxx", null));
        //nie zgadzaja sie
        Assert.assertEquals(16, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883451798", "kk", "Xxx90#kjX","KasiaKasia2"));
      //wszystko poprawne
        Assert.assertEquals(0, ks.uwierzytelnij("Kasia", "Klimek", "katftw@gmail.com", "883451798", "kk", "KasiaKasia2", "KasiaKasia2"));


	}

	@Test
	public void testEdytujDane() {
		fail("Not yet implemented");
	}

}
