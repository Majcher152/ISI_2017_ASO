package pl.komp.aso.sterowniki;

import java.util.ArrayList;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

import pl.komp.aso.dto.Czesc;
import pl.komp.aso.dto.FormularzNaprawy;
import pl.komp.aso.dto.Samochod;
import pl.komp.aso.dto.Uzytkownik;
import pl.komp.aso.dto.Warsztat;
import pl.komp.aso.dto.Zamowienie;

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
	
	public boolean aktualizujWarsztat(int ilosc,int id_czesc,int ile,int id_warsztat) {
		ile=ilosc+ile;
		boolean odp=spbd.aktualizujStanWarsztatu(id_warsztat, id_czesc, ile);
		return odp;
	}
	
	public int aktualizujONas(String tresc) {
		if(spbd.aktualizujONas(tresc))
			return 0;
		else return -1;
	}
	
	public boolean zlozZamowienie(Zamowienie z,double koszt) {
		boolean odp=true;
		DateTime dzis= new DateTime();
		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
		String data =fmt.print(dzis);
		odp=spbd.dodajZamowienie(data,koszt);
		if(odp==false)
			return odp;
		int id=spbd.pobierzId();
		System.out.println(id);
		for(int i=0;i<z.getCzesci().size();i++) {
			odp=spbd.dodajZamowienie(id,z.getCzesci().get(i).getId(),z.getCzesci().get(i).getIlosc());
			if(odp==false)
				return odp;
		}
			
		return odp;
	}
	
	public double obliczKoszt(ArrayList<Czesc>czesci) {
		double koszt=0;
		for(int i=0;i<czesci.size();i++)
			koszt+=czesci.get(i).getCena()*czesci.get(i).getIlosc();
		return koszt;
	}
	
	public ArrayList<Zamowienie> sortujZamowienia( ArrayList<Zamowienie> zamowienia){
		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
		DateTime dzisiaj = new DateTime();
		DateTime najstarszy;
		DateTime dzien;
		DateTime dzien2;
		
		Zamowienie f;
		for(int i=0;i<zamowienia.size()-1;i++) {
			for(int j=0;j<zamowienia.size()-1;j++) {
				dzien = fmt.parseDateTime(zamowienia.get(j).getData());
				dzien2 = fmt.parseDateTime(zamowienia.get(j+1).getData());
				if(dzien.isAfter(dzien2)) {
					f=zamowienia.get(j);
					zamowienia.set(j, zamowienia.get(j+1));
					zamowienia.set(j+1, f);
				}
			}
		}
		 
		return zamowienia;
	}
}
