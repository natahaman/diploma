package com.gaman.domain.mappers;

import com.gaman.domain.Blogs;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.ZoneId;

/**
 * Created by Natalka on 22.05.2017.
 */
@Component
public class BlogsRowMapper implements RowMapper<Blogs> {
    @Override
    public Blogs mapRow(ResultSet resultSet, int i) throws SQLException {
        Blogs blogs = new Blogs(
                resultSet.getLong("itemId"),
                LocalDateTime.ofInstant(resultSet.getTimestamp("creation_date").toInstant(), ZoneId.systemDefault()),
                resultSet.getString("author"),
                resultSet.getString("title"),
                resultSet.getString("content")
        );
        return blogs;
    }
}
