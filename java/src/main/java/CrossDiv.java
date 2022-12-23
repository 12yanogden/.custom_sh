import strategy.numberStrategy.HalverWithRemainder;
import strategy.numberStrategy.HalverWithoutRemainder;
import strategy.textStrategy.Repeater;
import strategy.textStrategy.Reverser;

public class CrossDiv extends Divider {
    String edge;

    public CrossDiv() {
        super();
    }

    public CrossDiv(String textLabel) {
        super(textLabel);
    }

    public CrossDiv(int width) {
        super(width);
    }

    public CrossDiv(String textLabel, int width) {
        super(textLabel, width);
        this.edge = "+";
    }

    public String getFixedWidthText() {
        StringBuilder builder = new StringBuilder();
        HalverWithRemainder halverWithRemainder = new HalverWithRemainder();
        HalverWithoutRemainder halverWithoutRemainder = new HalverWithoutRemainder();
        int edgeLength = 2;
        int innerPaddingLength = getText().length() > 0 ? 2 : 0;
        int nonArmLength = getWidth() - edgeLength - getText().length() - innerPaddingLength;
        int leftArmLength = halverWithoutRemainder.execute(nonArmLength);
        int rightArmLength = halverWithRemainder.execute(nonArmLength);
        Repeater leftArmRepeater = new Repeater(leftArmLength);
        Repeater rightArmRepeater = new Repeater(rightArmLength);
        Reverser reverser = new Reverser();

        builder.append(getEdge());
        builder.append(leftArmRepeater.execute("-"));
        if (!getText().isBlank() && !getText().isEmpty()) {
            builder.append(" ");
            builder.append(getText());
            builder.append(" ");
        }
        builder.append(rightArmRepeater.execute("-"));
        builder.append(calcReversedEdge());

        return builder.toString();
    }

    public void print() {
        System.out.println(toString());
    }

    public String getEdge() {
        return edge;
    }

    private String calcReversedEdge() {
        Reverser reverser = new Reverser();

        return reverser.execute(getEdge());
    }
}
