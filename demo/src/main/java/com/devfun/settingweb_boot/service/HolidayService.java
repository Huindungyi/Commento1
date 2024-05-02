package com.devfun.settingweb_boot.service;

import org.springframework.stereotype.Service;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@Service
public class HolidayService {

    private final String HOLIDAY_FILE_PATH = "holidays.txt";

    public Set<String> getHolidays() {
        Set<String> holidays = new HashSet<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(HOLIDAY_FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                holidays.add(line.trim());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return holidays;
    }
}
