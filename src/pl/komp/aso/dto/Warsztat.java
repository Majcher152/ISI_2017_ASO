package pl.komp.aso.dto;

import java.util.ArrayList;

public class Warsztat {
	private String adres;
	private String miasto;
	private String email;
	private String nrTelefonu;
	private int iloscStanowisk;
	private String godzinaO;
	private String godzinaZ;
	private int id;
	private ArrayList<Samochod>samochody=new ArrayList<Samochod>();
	private ArrayList<Mechanik> mechanicy=new ArrayList<Mechanik>();
	private ArrayList<Zamowienie>zamowienia=new ArrayList<Zamowienie>();
	private ArrayList<Czesc>czesci;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getMiasto() {
		return miasto;
	}
	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNrTelefonu() {
		return nrTelefonu;
	}
	public void setNrTelefonu(String nrTelefonu) {
		this.nrTelefonu = nrTelefonu;
	}
	public int getIloscStanowisk() {
		return iloscStanowisk;
	}
	public void setIloscStanowisk(int iloscStanowisk) {
		this.iloscStanowisk = iloscStanowisk;
	}
	public String getGodzinaO() {
		return godzinaO;
	}
	public void setGodzinaO(String godzinaO) {
		this.godzinaO = godzinaO;
	}
	public String getGodzinaZ() {
		return godzinaZ;
	}
	public void setGodzinaZ(String godzinaZ) {
		this.godzinaZ = godzinaZ;
	}
	public ArrayList<Samochod> getSamochody() {
		return samochody;
	}
	public void setSamochody(ArrayList<Samochod> samochody) {
		this.samochody = samochody;
	}
	public ArrayList<Mechanik> getMechanicy() {
		return mechanicy;
	}
	public void setMechanicy(ArrayList<Mechanik> mechanicy) {
		this.mechanicy = mechanicy;
	}
	public ArrayList<Zamowienie> getZamowienia() {
		return zamowienia;
	}
	public void setZamowienia(ArrayList<Zamowienie> zamowienia) {
		this.zamowienia = zamowienia;
	}
	public ArrayList<Czesc> getCzesci() {
		return czesci;
	}
	public void setCzesci(ArrayList<Czesc> czesci) {
		this.czesci = czesci;
	}
	
}
