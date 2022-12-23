package strategy.numberStrategy;

public abstract class Halver extends Divider {
    public Halver(boolean includeRemainder) {
        super(2, includeRemainder);
    }
}
