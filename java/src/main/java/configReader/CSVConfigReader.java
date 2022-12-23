package configReader;

import com.opencsv.CSVReader;
import exception.InvalidArgumentException;
import java.io.FileReader;

public class CSVConfigReader implements ConfigReader {
    private CSVReader csvReader;

    public CSVConfigReader(String csvPath) {
        csvReader = makeCSVReader(csvPath);
    }

    @Override
    public String getConfigValueByName(String name) {
        String configValue = null;

        try {
            String[] nextRecord;

            while ((nextRecord = getCsvReader().readNext()) != null) {
                String configName = nextRecord[0];

                if (configName.equals(name)) {
                    configValue = nextRecord[1];
                }
            }

            if (configValue == null) {
                throw new InvalidArgumentException(configValue + " not found");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return configValue;
    }

    private CSVReader makeCSVReader(String csvPath) {
        CSVReader csvReader = null;

        try {
            csvReader = new CSVReader(new FileReader(csvPath));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }

        return csvReader;
    }

    public CSVReader getCsvReader() {
        return csvReader;
    }
}
