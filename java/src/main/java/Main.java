import configReader.CSVConfigReader;

public class Main {
    public static void main(String[] args) {
        CrossDiv withText = new CrossDiv("test", 57);
        CrossDiv withoutText = new CrossDiv(57);

        withText.print();
        withoutText.print();
    }
}
