package pl.komp.aso.sterowniki;

import java.util.ArrayList;

import org.joda.time.DateTime;
import org.joda.time.DateTimeConstants;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;

public class SterownikWarsztatu {
	SterownikPolBD spbd = new SterownikPolBD();
	SterownikKlienta sk= new SterownikKlienta();
	

	
	public ArrayList<String> sprawdzDni() {
		ArrayList<String> dni=new ArrayList<String>();
		DateTime dzisiaj = new DateTime();
		DateTime doKiedy = dzisiaj.plusWeeks(2);
		DateTime dzien = dzisiaj;
		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
		
		while(dzien.isBefore(doKiedy)) {
			if(!(dzien.dayOfWeek().get()==DateTimeConstants.SATURDAY || dzien.dayOfWeek().get()==DateTimeConstants.SUNDAY))
				dni.add(fmt.print(dzien));
			dzien=dzien.plusDays(1);
		}
		return dni;
	}
	
	public ArrayList<String> sprawdzGodziny(String adres) {
		DateTimeFormatter fmt = DateTimeFormat.forPattern("HH:mm");
		ArrayList<String> godziny=new ArrayList<String>();
		Warsztat warsztat = spbd.pobierzWarsztat(adres);
		DateTime godzinaO = fmt.parseDateTime(warsztat.getGodzinaO());
		DateTime godzinaZ = fmt.parseDateTime(warsztat.getGodzinaZ());
		//System.out.println(fmt.print(godzinaO));
		while(godzinaO.isBefore(godzinaZ)) {
			godziny.add(fmt.print(godzinaO));
			godzinaO=godzinaO.plusHours(1);
		}	
		return godziny;
	}
	
	public boolean sprawdzGodzine(String godzina,String adres,String dzien) {
		boolean odp=true;
		Warsztat warsztat = spbd.pobierzWarsztat(adres);
		int ile = spbd.czyZajetaGodzina(warsztat.getId(), dzien, godzina);
		if(ile<warsztat.getIloscStanowisk()) {
			odp=false;
		}
		return odp;
	}
	
	
}
