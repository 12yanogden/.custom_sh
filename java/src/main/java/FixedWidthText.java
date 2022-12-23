import configReader.CSVConfigReader;
import configReader.ConfigReader;

public abstract class FixedWidthText {
    private ConfigReader configReader;
    private String text;
    private int width;

    public FixedWidthText() {
        setDefaultText();
        setDefaultWidth();
    }

    public FixedWidthText(int width) {
        setDefaultText();
        this.width = width;
    }

    public FixedWidthText(String defaultText) {
        this.text = defaultText;
        setDefaultWidth();
    }

    public FixedWidthText(String defaultText, int defaultWidth) {
        this.text = defaultText;
        this.width = defaultWidth;
    }

    protected abstract String getFixedWidthText();

    //-------------------------------------------------------------------------------------//
    //                                                                                     //
    //                                      toString                                       //
    //                                                                                     //
    //-------------------------------------------------------------------------------------//
    public String toString() {
        return toString(getText(), getWidth());
    }

    public String toString(String text) {
        return toString(text, getWidth());
    }

    public String toString(int width) {
        return toString(getText(), width);
    }

    public String toString(String text, int width) {
        if (!text.equals(getText())) {
            setText(text);
        }

        if (width != getWidth()) {
            setWidth(width);
        }

        return getFixedWidthText();
    }

    //-------------------------------------------------------------------------------------//
    //                                                                                     //
    //                                        print                                        //
    //                                                                                     //
    //-------------------------------------------------------------------------------------//
    void print() {
        System.out.println(toString(getText(), getWidth()));
    }

    void print(String text) {
        System.out.println(toString(text, getWidth()));
    }

    void print(int width) {
        System.out.println(toString(getText(), width));
    }

    void print(String text, int width) {
        System.out.println(toString(text, width));
    }

    //-------------------------------------------------------------------------------------//
    //                                                                                     //
    //                                 Getters and Setters                                 //
    //                                                                                     //
    //-------------------------------------------------------------------------------------//
    public ConfigReader getConfigReader() {
        if (configReader == null) {
            configReader = new CSVConfigReader("csv/configs.csv");
        }

        return configReader;
    }

    public void setConfigReader(ConfigReader configReader) {
        this.configReader = configReader;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    //-------------------------------------------------------------------------------------//
    //                                                                                     //
    //                                   Default Setters                                   //
    //                                                                                     //
    //-------------------------------------------------------------------------------------//
    private void setDefaultWidth() {
        this.width = Integer.parseInt(configReader.getConfigValueByName("width"));
    }

    private void setDefaultText() {
        this.text = "";
    }
}
