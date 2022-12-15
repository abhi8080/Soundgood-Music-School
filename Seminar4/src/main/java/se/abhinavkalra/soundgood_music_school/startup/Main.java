package se.abhinavkalra.soundgood_music_school.startup;

import se.abhinavkalra.soundgood_music_school.controller.Controller;
import se.abhinavkalra.soundgood_music_school.view.BlockingInterpreter;

public class Main {

	public static void main(String[] args) {
		try {
			new BlockingInterpreter(new Controller()).handleCmds();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
