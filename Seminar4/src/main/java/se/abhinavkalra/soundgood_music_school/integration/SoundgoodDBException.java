package se.abhinavkalra.soundgood_music_school.integration;

public class SoundgoodDBException extends Exception {

	public SoundgoodDBException(String reason) {
		super(reason);
	}

	public SoundgoodDBException(String reason, Throwable rootCause) {
		super(reason, rootCause);
	}
}
