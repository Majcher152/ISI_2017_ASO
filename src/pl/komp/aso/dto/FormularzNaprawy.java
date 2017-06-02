package pl.komp.aso.dto;

public class FormularzNaprawy {
	private String opis;
	private double koszt;
	private String dataOddania;
	private String dataOdebrania;
	private Warsztat warsztat;
	private Samochod samochod;
	public String getOpis() {
		return opis;
	}
	public void setOpis(String opis) {
		this.opis = opis;
	}
	public double getKoszt() {
		return koszt;
	}
	public void setKoszt(double koszt) {
		this.koszt = koszt;
	}
	public String getDataOddania() {
		return dataOddania;
	}
	public void setDataOddania(String dataOddania) {
		this.dataOddania = dataOddania;
	}
	public String getDataOdebrania() {
		return dataOdebrania;
	}
	public void setDataOdebrania(String dataOdebrania) {
		this.dataOdebrania = dataOdebrania;
	}
	public Warsztat getWarsztat() {
		return warsztat;
	}
	public void setWarsztat(Warsztat warsztat) {
		this.warsztat = warsztat;
	}
	public Samochod getSamochod() {
		return samochod;
	}
	public void setSamochod(Samochod samochod) {
		this.samochod = samochod;
	}
	
}
