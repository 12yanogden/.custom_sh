package strategy.textStrategy;

import strategy.Strategy;

public class Repeater implements Strategy<String> {
    private int count;

    public Repeater(int count) {
        this.count = count;
    }

    @Override
    public String execute(String str) {
        return String.valueOf(str).repeat(Math.max(0, getCount()));
    }

    public int getCount() {
        return count;
    }
}
