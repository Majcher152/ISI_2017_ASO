package pl.komp.aso.dto;

import java.util.ArrayList;

public class Zamowienie {
	private int id;
	private String data;
	private double koszt;
	private ArrayList<Czesc> czesci=new ArrayList<Czesc>();
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public double getKoszt() {
		return koszt;
	}
	public void setKoszt(double koszt) {
		this.koszt = koszt;
	}
	public ArrayList<Czesc> getCzesci() {
		return czesci;
	}
	public void setCzesci(ArrayList<Czesc> czesci) {
		this.czesci = czesci;
	}
}
