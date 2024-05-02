package com.devfun.settingweb_boot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Service
public class LoginService {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private HolidayService holidayService;

    public List<Map<String, Object>> getLoginsExcludingHolidays() {
        Set<String> holidays = holidayService.getHolidays();
        
        String sql = "SELECT SUBSTR(createDate, 1, 6) AS date, " +
                     "COUNT(DISTINCT userID) AS logins_holidays_excluded " +
                     "FROM statistc.requestInfo " +
                     "WHERE SUBSTR(createDate, 1, 6) NOT IN (" + holidaysQuery(holidays) + ") " +
                     "GROUP BY SUBSTR(createDate, 1, 6) " +
                     "ORDER BY date";
        return jdbcTemplate.queryForList(sql);
    }

    private String holidaysQuery(Set<String> holidays) {
        StringBuilder query = new StringBuilder();
        for (String holiday : holidays) {
            query.append("'");
            query.append(holiday);
            query.append("',");
        }
        if (query.length() > 0) {
            query.deleteCharAt(query.length() - 1);
        }
        return query.toString();
    }
}
