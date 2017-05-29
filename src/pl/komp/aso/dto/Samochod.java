package pl.komp.aso.dto;

public class Samochod {
	private String model;
	private int rocznik;
	private String typ;
	private String silnik;
	private String vin;
	private boolean warsztat;
	
	public void setWarsztat(boolean warsztat) {
		this.warsztat=warsztat;
	}
	
	public boolean isWarsztat() {
		return warsztat;
	}
	
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public int getRocznik() {
		return rocznik;
	}
	public void setRocznik(int rocznik) {
		this.rocznik = rocznik;
	}
	public String getTyp() {
		return typ;
	}
	public void setTyp(String typ) {
		this.typ = typ;
	}
	public String getSilnik() {
		return silnik;
	}
	public void setSilnik(String silnik) {
		this.silnik = silnik;
	}
	
}
