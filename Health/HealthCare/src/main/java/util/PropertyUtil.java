package util;

import java.io.InputStream;
import java.util.Properties;

public class PropertyUtil {
    private static final Properties properties = new Properties();
    
    static {
        try (InputStream inputStream = PropertyUtil.class.getClassLoader()
                .getResourceAsStream("config.properties")) {
            if (inputStream == null) {
                throw new RuntimeException("Unable to find config.properties");
            }
            properties.load(inputStream);
        } catch (Exception ex) {
            throw new RuntimeException("Failed to load configuration", ex);
        }
    }
    
    public static String getProperty(String key) {
        String value = properties.getProperty(key);
        if (value == null) {
            throw new RuntimeException("Property " + key + " not found in config");
        }
        return value.trim();
    }
}