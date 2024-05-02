package com.devfun.settingweb_boot.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StatisticMapper {
    public HashMap<String, Object> selectYearLogin(String year);
}
