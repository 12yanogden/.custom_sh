package strategy.numberStrategy;

import strategy.Strategy;

public abstract class Divider implements Strategy<Integer> {
    private final int divisor;
    private final boolean includeRemainder;

    public Divider(int divisor, boolean includeRemainder) {
        this.divisor = divisor;
        this.includeRemainder = includeRemainder;
    }

    @Override
    public Integer execute(Integer dividend) {
        int quotient = dividend / getDivisor();

        if (includeRemainder()) {
            quotient += dividend % getDivisor();
        }

        return quotient;
    }

    public int getDivisor() {
        return divisor;
    }

    public boolean includeRemainder() {
        return includeRemainder;
    }
}
