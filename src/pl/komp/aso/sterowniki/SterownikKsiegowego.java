package pl.komp.aso.sterowniki;

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
}
