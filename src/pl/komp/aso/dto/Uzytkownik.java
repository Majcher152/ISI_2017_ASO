package pl.komp.aso.dto;

import java.util.ArrayList;

public class Uzytkownik {
	
	private String imie;
	private String nazwisko;
	private String email;
	private int nrTelefonu;
	private String login;
	private String haslo;
	private ArrayList<Samochod>samochody=new ArrayList<Samochod>();
	private ArrayList<FormularzNaprawy> formularze= new ArrayList<FormularzNaprawy>();
	private String rodzaj;
	
	
	
	public String getRodzaj() {
		return rodzaj;
	}
	public void setRodzaj(String rodzaj) {
		this.rodzaj = rodzaj;
	}
	public String getImie() {
		return imie;
	}
	public void setImie(String imie) {
		this.imie = imie;
	}
	public String getNazwisko() {
		return nazwisko;
	}
	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNrTelefonu() {
		return nrTelefonu;
	}
	public void setNrTelefonu(int numer_telefonu) {
		this.nrTelefonu = numer_telefonu;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getHaslo() {
		return haslo;
	}
	public void setHaslo(String haslo) {
		this.haslo = haslo;
	}

	public ArrayList<Samochod> getSamochody() {
		return samochody;
	}

	public void setSamochody(ArrayList<Samochod> samochody) {
		this.samochody = samochody;
	}

	public ArrayList<FormularzNaprawy> getFormularze() {
		return formularze;
	}

	public void setFormularze(ArrayList<FormularzNaprawy> formularze) {
		this.formularze = formularze;
	}
}
