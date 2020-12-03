package com.weikang.utils;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.util.Date;

/**
 * 日期转换工具类
 */
public class DateConverter implements Converter<String, Date> {

    private String[] patterns;

    public void setPatterns(String[] patterns) {
        this.patterns = patterns;
    }

    @Override
    public Date convert(String s) {
        try {
            if (StringUtils.isEmpty(s)) return null;
            return DateUtils.parseDate(s, patterns);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }

}
