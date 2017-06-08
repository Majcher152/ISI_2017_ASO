package pl.komp.aso.sterowniki;

import java.util.ArrayList;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;

public class SterownikKsiegowego {
	SterownikPolBD spbd = new SterownikPolBD();
	
	public int zatwierdzRezerwacjeNaprawy(String vin, String dataoddania, String przewid_czas_trwania) {
		if (!SterownikWalidacjiKsiegowego.sprawdzDate(dataoddania))
			return 1;
		
		if (!SterownikWalidacjiKsiegowego.sprawdzIlosc(przewid_czas_trwania))
			return 2;
		
		if(spbd.zatwierdzRezerwacjeNaprawy(vin, dataoddania, przewid_czas_trwania))
			return 0;
		else return -1;
	}
	
	public int edytujCennik(String id, String nazwa, String cena) {
		if(spbd.zmienCennik(id, nazwa, cena))
			return 0;
		else return -1;
	}
	
	public int dodajCennik(String nazwa, String cena) {
		if(spbd.dodajCennik(nazwa, cena))
			return 0;
		else return -1;
	}
	
	public int dodajSamochod(String model, String rocznik, String typ, String silnik) {
		if(spbd.dodajSamochod(model, rocznik, typ, silnik))
			return 0;
		else return -1;
	}
	
	public ArrayList<Czesc> pobierzCzesciMagazyn(String model,String rocznik,String typ,String silnik){
		Samochod s = spbd.pobierzSamochodId(model,rocznik,typ,silnik);
		ArrayList<Czesc> czesci = spbd.pobierzCzesciMagazyn(s.getId());
		return czesci;
	}
	
	public ArrayList<Czesc> pobierzCzesciWarsztat(String model,String rocznik,String typ,String silnik,int id_warsztatu){
		Samochod s = spbd.pobierzSamochodId(model,rocznik,typ,silnik);
		ArrayList<Czesc> czesci = spbd.pobierzCzesci(id_warsztatu,s.getId());
		return czesci;
	}
}
