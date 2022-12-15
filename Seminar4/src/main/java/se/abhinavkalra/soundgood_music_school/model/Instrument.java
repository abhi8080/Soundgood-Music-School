package se.abhinavkalra.soundgood_music_school.model;

public class Instrument implements InstrumentDTO {
	private String name;
	private String brand;
	private int pricePerMonth;

	public Instrument(String name, String brand, int pricePerMonth) {
		this.name = name;
		this.brand = brand;
		this.pricePerMonth = pricePerMonth;
	}

	public String getInstrumentName() {
		return name;
	}

	public String getInstrumentBrand() {
		return brand;
	}

	public int getPricePerMonth() {
		return pricePerMonth;
	}

}
