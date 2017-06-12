package pl.komp.aso.testy;

import static org.junit.Assert.*;

import java.util.ArrayList;

import org.junit.Before;
import org.junit.Test;

import pl.komp.aso.sterowniki.SterownikPolBD;
import pl.komp.aso.sterowniki.SterownikWarsztatu;

public class SterownikWarsztatuTest {

SterownikWarsztatu sw;
	
	@Before
	public void prepare() {
		sw = new SterownikWarsztatu();
	}
	
	@Test
	public void sprawdzDniTest() {
		ArrayList<String> dni= sw.sprawdzDni();
		assertEquals(10,dni.size());
	}
	
	@Test
	public void sprawdzGodziny() {
		ArrayList<String> godziny = sw.sprawdzGodziny("Pszona 16");
		assertEquals("10:00",godziny.get(0));
		assertEquals(7,godziny.size());
	}
	
	@Test
	public void sprawdzGodzine() {
		assertFalse(sw.sprawdzGodzine("20:00", "Pszona 16", "20/01/2017"));
		assertTrue(sw.sprawdzGodzine("10:00", "Pszona 16", "19/06/2017"));
	}

}
