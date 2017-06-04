package pl.komp.aso.sterowniki;

import java.util.ArrayList;

import pl.komp.aso.dto.FormularzNaprawy;
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
	
	public boolean zakonczNaprawe(int id) {
		FormularzNaprawy f = spbd.pobierzFormularz(id);
		boolean odp=spbd.uzupelnijFormularzNaprawy(f.getId(), f.getOpis(), f.getDataOdebrania(),f.getKoszt());
		return false;
	}
	
	public ArrayList<FormularzNaprawy> pobierzFormularze(Uzytkownik u,String status) {
		Warsztat w = pobierzWarsztat(u);
		ArrayList<FormularzNaprawy> formularze = spbd.pobierzFormularzeMechanika(w.getId(),status);
		return formularze;
	}
	
	
}
