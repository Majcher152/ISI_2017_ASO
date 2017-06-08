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

public class SterownikMechanika {
	SterownikPolBD spbd = new SterownikPolBD();
	
	
	private Warsztat pobierzWarsztat(Uzytkownik u) {
		int id = spbd.pobierzIdWarsztatu(u.getLogin());
		Warsztat w = spbd.pobierzWarsztatId(id);
		return w;
	}
	
	public boolean zmienStatus(int id) {
		boolean odp=spbd.edytujStatusNaprawy(id);
		return odp;
	}
	
	public boolean zakonczNaprawe(int id,String opis,String dataodebrania,double koszt) {
		boolean odp=spbd.uzupelnijFormularzNaprawy(id,opis,dataodebrania,koszt);
		return odp;
	}
	
	public ArrayList<FormularzNaprawy> pobierzFormularze(Uzytkownik u,String status) {
		Warsztat w = pobierzWarsztat(u);
		ArrayList<FormularzNaprawy> formularze = spbd.pobierzFormularzeMechanika(w.getId(),status);
		return formularze;
	}
	
	public ArrayList<FormularzNaprawy> sortujFormularze( ArrayList<FormularzNaprawy> formularze){
		DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");
		DateTime dzisiaj = new DateTime();
		DateTime najstarszy;
		DateTime dzien;
		DateTime dzien2;
		for(int i=0;i<formularze.size();i++) {
			dzien = fmt.parseDateTime(formularze.get(i).getDataOddania());
			if(dzien.isBefore(dzisiaj) || dzien.isEqual(dzisiaj)) {
				formularze.get(i).setZmien(true);
			}
		}
		FormularzNaprawy f;
		for(int i=0;i<formularze.size()-1;i++) {
			for(int j=0;j<formularze.size()-1;j++) {
				dzien = fmt.parseDateTime(formularze.get(j).getDataOddania());
				dzien2 = fmt.parseDateTime(formularze.get(j+1).getDataOddania());
				if(dzien.isAfter(dzien2)) {
					f=formularze.get(j);
					formularze.set(j, formularze.get(j+1));
					formularze.set(j+1, f);
				}
			}
		}
		 
		return formularze;
	}
	
	public ArrayList<Czesc> pobierzCzesci(String model,String rocznik,String typ,String silnik,Uzytkownik u){
		Warsztat w = pobierzWarsztat(u);
		Samochod s = spbd.pobierzSamochodId(model,rocznik,typ,silnik);
		ArrayList<Czesc> czesci = spbd.pobierzCzesci(w.getId(),s.getId());
		return czesci;
	}
	
	public Czesc pobierzCzesc(int id,Uzytkownik u) {
		Warsztat w = pobierzWarsztat(u);
		Czesc czesc = spbd.pobierzCzesc(id,w.getId());
		return czesc;
	}
	
}
