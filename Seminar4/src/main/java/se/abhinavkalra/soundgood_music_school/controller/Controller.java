package se.abhinavkalra.soundgood_music_school.controller;

import java.util.ArrayList;
import se.abhinavkalra.soundgood_music_school.integration.SoundgoodDAO;
import se.abhinavkalra.soundgood_music_school.integration.SoundgoodDBException;
import se.abhinavkalra.soundgood_music_school.model.InstrumentDTO;
import se.abhinavkalra.soundgood_music_school.model.InstrumentException;

public class Controller {

	private final SoundgoodDAO soundgoodDb;

	public Controller() throws SoundgoodDBException {
		soundgoodDb = new SoundgoodDAO();
	}

	public ArrayList<? extends InstrumentDTO> listInstruments(String instrumentName) throws InstrumentException {
		if (instrumentName == null) {
			return new ArrayList<>();
		}
		try {
			return soundgoodDb.readAvailableInstruments(instrumentName);
		} catch (Exception e) {
			throw new InstrumentException("Unable to search for instruments", e);
		}
	}

	public void rentInstrument(int studentId, int instrumentID) throws InstrumentException {
		try {
			if (soundgoodDb.readInstrumentInOngoingRental(instrumentID) != null)
				throw new InstrumentException("Instrument is not available for rental.");
			if (soundgoodDb.readStudentRentals(studentId) == 2)
				throw new InstrumentException("Student already has two active rentals.");
			soundgoodDb.createRental(studentId, instrumentID);
		} catch (SoundgoodDBException e) {
			throw new InstrumentException("Could not create a rental", e);
		}
	}

	public void terminateRental(int instrumentId) throws InstrumentException {
		try {
			soundgoodDb.updateRental(instrumentId);
		} catch (Exception e) {
			throw new InstrumentException("Could not terminate rental for instrument " + instrumentId, e);
		}
	}
}
