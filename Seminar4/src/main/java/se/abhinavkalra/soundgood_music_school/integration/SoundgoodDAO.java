
package se.abhinavkalra.soundgood_music_school.integration;

import se.abhinavkalra.soundgood_music_school.model.Instrument;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class SoundgoodDAO {
	private Connection connection;
	private PreparedStatement listInstrumentsStmt;
	private PreparedStatement rentInstrumentStmt;
	private PreparedStatement countInstrumentRentalsStmt;
	private PreparedStatement terminateRentalStmt;
	private PreparedStatement checkInstrumentAvailableStmt;

	private static final String INSTRUMENT_TABLE_NAME = "rental_instrument";
	private static final String BRAND_COLUMN_NAME = "brand";
	private static final String PRICE_PER_MONTH_COLUMN_NAME = "price_per_month";
	private static final String RENTAL_TABLE_NAME = "rental";
	private static final String INSTRUMENT_PK_COLUMN_NAME = "rental_instrument_id";
	private static final String INSTRUMENT_FK_COLUMN_NAME = INSTRUMENT_PK_COLUMN_NAME;
	private static final String INSTRUMENT_NAME_COLUMN_NAME = "name";
	private static final String RENTAL_START_COLUMN_NAME = "rental_start";
	private static final String RENTAL_END_COLUMN_NAME = "rental_end";
	private static final String STUDENT_FK_COLUMN_NAME = "student_id";

	public SoundgoodDAO() throws SoundgoodDBException {
		try {
			connectToDB();
			prepareStatements();
		} catch (ClassNotFoundException | SQLException e) {
			throw new SoundgoodDBException("Could not connect to datasource.", e);
		}
	}

	private void connectToDB() throws ClassNotFoundException, SQLException {
		connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/soundgood_music_school_db",
				"postgres", "postgres");
		connection.setAutoCommit(false);
	}

	public ArrayList<Instrument> readAvailableInstruments(String instrumentName) throws SoundgoodDBException {
		String failureMessage = "Could not search for instruments.";
		ResultSet result = null;
		ArrayList<Instrument> instruments = new ArrayList<>();
		try {
			listInstrumentsStmt.setString(1, instrumentName);
			result = listInstrumentsStmt.executeQuery();
			while (result.next()) {
				instruments.add(
						new Instrument(instrumentName, result.getString("brand"), result.getInt("price_per_month")));
			}
			connection.commit();
		} catch (SQLException sqle) {
			handleException(failureMessage, sqle);
		} finally {
			closeResultSet(failureMessage, result);
		}
		return instruments;
	}

	public Object readInstrumentInOngoingRental(int instrumentId) throws SoundgoodDBException {
		String failureMessage = "Could not read rental data.";
		ResultSet result = null;
		Object object = null;
		try {
			checkInstrumentAvailableStmt.setInt(1, instrumentId);
			result = checkInstrumentAvailableStmt.executeQuery();
			if (result.next())
				object = new Object();
		} catch (SQLException sqle) {
			handleException(failureMessage, sqle);
		} finally {
			closeResultSet(failureMessage, result);
		}
		return object;
	}

	public int readStudentRentals(int studentId) throws SoundgoodDBException {
		String failureMessage = "Could not determine how many active rentals the student has.";
		ResultSet result = null;
		int count = 0;
		try {
			countInstrumentRentalsStmt.setInt(1, studentId);
			result = countInstrumentRentalsStmt.executeQuery();
			if (result.next())
				count = result.getInt("count");
		} catch (SQLException sqle) {
			handleException(failureMessage, sqle);
		} finally {
			closeResultSet(failureMessage, result);
		}
		return count;
	}

	public void createRental(int studentId, int instrumentId) throws SoundgoodDBException {
		String failureMessage = "Could not create a rental. ";
		int updatedRows = 0;
		try {
			rentInstrumentStmt.setInt(1, studentId);
			rentInstrumentStmt.setInt(2, instrumentId);
			updatedRows = rentInstrumentStmt.executeUpdate();
			if (updatedRows != 1) {
				handleException(failureMessage, null);
			}
			connection.commit();
		} catch (SQLException sqle) {
			handleException(failureMessage, sqle);
		}
	}

	public void updateRental(int instrumentId) throws SoundgoodDBException {
		String failureMessage = "Could not terminate rental.";
		try {
			terminateRentalStmt.setInt(1, instrumentId);
			int updatedRows = terminateRentalStmt.executeUpdate();
			if (updatedRows != 1) {
				handleException(failureMessage, null);
			}
			connection.commit();
		} catch (SQLException sqle) {
			handleException(failureMessage, sqle);
		}
	}

	private void prepareStatements() throws SQLException {
		listInstrumentsStmt = connection.prepareStatement("SELECT " + BRAND_COLUMN_NAME + ", "
				+ PRICE_PER_MONTH_COLUMN_NAME + " FROM " + INSTRUMENT_TABLE_NAME + " LEFT JOIN " + RENTAL_TABLE_NAME
				+ " ON " + INSTRUMENT_TABLE_NAME + "." + INSTRUMENT_PK_COLUMN_NAME + " = " + RENTAL_TABLE_NAME + "."
				+ INSTRUMENT_FK_COLUMN_NAME + " WHERE " + RENTAL_TABLE_NAME + "." + INSTRUMENT_FK_COLUMN_NAME
				+ " IS NULL AND " + INSTRUMENT_NAME_COLUMN_NAME + " = ?");
		rentInstrumentStmt = connection.prepareStatement("INSERT into " + RENTAL_TABLE_NAME + "("
				+ RENTAL_START_COLUMN_NAME + ", " + RENTAL_END_COLUMN_NAME + ", " + STUDENT_FK_COLUMN_NAME + ", "
				+ INSTRUMENT_FK_COLUMN_NAME + ") values (CURRENT_DATE, null, ?, ?)");
		checkInstrumentAvailableStmt = connection.prepareStatement("select * from " + RENTAL_TABLE_NAME + " where "
				+ INSTRUMENT_FK_COLUMN_NAME + " = ? AND " + RENTAL_END_COLUMN_NAME + " IS NULL");
		countInstrumentRentalsStmt = connection.prepareStatement("SELECT Count(*) FROM " + RENTAL_TABLE_NAME + " where "
				+ RENTAL_END_COLUMN_NAME + " is NULL AND " + STUDENT_FK_COLUMN_NAME + " = ?");
		terminateRentalStmt = connection.prepareStatement(
				"UPDATE " + RENTAL_TABLE_NAME + " set " + RENTAL_END_COLUMN_NAME + " = CURRENT_DATE where "
						+ INSTRUMENT_FK_COLUMN_NAME + " = ? AND " + RENTAL_END_COLUMN_NAME + " IS NULL");

	}

	private void handleException(String failureMessage, Exception cause) throws SoundgoodDBException {
		String completeFailureMessage = failureMessage;
		try {
			connection.rollback();
		} catch (SQLException rollbackExc) {
			completeFailureMessage = completeFailureMessage + ". Also failed to rollback transaction because of: "
					+ rollbackExc.getMessage();
		}

		if (cause != null) {
			throw new SoundgoodDBException(failureMessage, cause);
		} else {
			throw new SoundgoodDBException(failureMessage);
		}
	}

	private void closeResultSet(String failureMessage, ResultSet res) throws SoundgoodDBException {
		try {
			res.close();
		} catch (Exception e) {
			throw new SoundgoodDBException(failureMessage + " Could not close result set.", e);
		}
	}

}
