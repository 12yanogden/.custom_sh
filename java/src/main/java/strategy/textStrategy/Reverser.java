package strategy.textStrategy;

import strategy.Strategy;

public class Reverser implements Strategy<String> {
    @Override
    public String execute(String str) {
        char[] characters = str.toCharArray();
        char[] reversed = new char[str.length()];

        for (int i = 0; i < characters.length; i++) {
            reversed[i] = characters[characters.length - 1 - i];
        }

        return new String(reversed);
    }
}
