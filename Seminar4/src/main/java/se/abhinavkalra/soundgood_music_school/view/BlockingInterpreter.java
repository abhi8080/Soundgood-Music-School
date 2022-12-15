package se.abhinavkalra.soundgood_music_school.view;

import java.util.ArrayList;
import java.util.Scanner;
import se.abhinavkalra.soundgood_music_school.controller.Controller;
import se.abhinavkalra.soundgood_music_school.model.InstrumentDTO;

public class BlockingInterpreter {
	private static final String PROMPT = "> ";
	private final Scanner console = new Scanner(System.in);
	private Controller ctrl;
	private boolean keepReceivingCmds = false;

	public BlockingInterpreter(Controller ctrl) {
		this.ctrl = ctrl;
	}

	public void stop() {
		keepReceivingCmds = false;
	}

	public void handleCmds() {
		keepReceivingCmds = true;
		while (keepReceivingCmds) {
			try {
				CmdLine cmdLine = new CmdLine(readNextLine());
				switch (cmdLine.getCmd()) {
				case HELP:
					for (Command command : Command.values()) {
						if (command == Command.ILLEGAL_COMMAND) {
							continue;
						}
						System.out.println(command.toString().toLowerCase());
					}
					break;
				case QUIT:
					keepReceivingCmds = false;
					break;
				case RENT:
					ctrl.rentInstrument(Integer.parseInt(cmdLine.getParameter(0)),
							Integer.parseInt(cmdLine.getParameter(1)));
					System.out.println("A rental has been created for student with id " + cmdLine.getParameter(0));
					break;
				case TERMINATE:
					ctrl.terminateRental(Integer.parseInt(cmdLine.getParameter(0)));
					System.out
							.println("A rental has been terminated for instrument with id " + cmdLine.getParameter(0));
					break;
				case LIST:
					ArrayList<? extends InstrumentDTO> instruments = null;
					instruments = ctrl.listInstruments(cmdLine.getParameter(0));

					for (InstrumentDTO instrument : instruments) {
						System.out.println("instrument: " + instrument.getInstrumentName() + ", " + "brand: "
								+ instrument.getInstrumentBrand() + ", " + "price per month:  "
								+ instrument.getPricePerMonth());
					}
					break;
				default:
					System.out.println("illegal command");
				}
			} catch (Exception e) {
				System.out.println("Operation failed");
				System.out.println(e.getMessage());
			}
		}
	}

	private String readNextLine() {
		System.out.print(PROMPT);
		return console.nextLine();
	}
}
