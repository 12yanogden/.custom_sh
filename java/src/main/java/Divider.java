public abstract class Divider extends FixedWidthText {
    private String edge;

    protected Divider() {
        super();
    }

    protected Divider(String text) {
        super(text);
    }

    protected Divider(int width) {
        super(width);
    }

    protected Divider(String text, int width) {
        super(text, width);
    }
}
