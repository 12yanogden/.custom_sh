package strategy.textStrategy;

import strategy.Strategy;

public class LeftPadder implements Strategy<String> {
    private Repeater repeater;

    public LeftPadder(int paddingCount) {
        this.repeater = new Repeater(paddingCount);
    }

    @Override
    public String execute(String str) {
        return getRepeater().execute(" ") + str;
    }

    public Repeater getRepeater() {
        return repeater;
    }
}
