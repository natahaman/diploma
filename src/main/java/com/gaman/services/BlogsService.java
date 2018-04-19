package com.gaman.services;

import com.gaman.domain.Blogs;
import com.gaman.domain.mappers.BlogsRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Natalka on 22.05.2017.
 */
@Service
public class BlogsService {
    private JdbcTemplate template;
    private BlogsRowMapper blogsRowMapper;

    public BlogsService(JdbcTemplate template, BlogsRowMapper blogsRowMapper) {
        this.template = template;
        this.blogsRowMapper = blogsRowMapper;
    }

    public List<Blogs> getBlogs() {
        return template.query("select * from blogs order by creation_date desc", blogsRowMapper);
    }

    public Blogs getById(Long itemId) {
        return template.queryForObject("Select * from blogs where itemId=?", new Object[]{itemId}, blogsRowMapper);

    }

    public Long create(String author, String title, String content) {
        SimpleJdbcInsert insert = new SimpleJdbcInsert(template)
                .withTableName("blogs")
                .usingGeneratedKeyColumns("itemid");
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("title", title);
        parameters.put("author", author);
        parameters.put("content", content);
        parameters.put("creation_date", LocalDateTime.now());
        return (Long) insert.executeAndReturnKey(new MapSqlParameterSource(parameters));
    }

    public void remove(Long itemId) {
        template.update("delete from blogs where itemId = ?", itemId);
    }

    public List<Blogs> getBlogs(String name) {
        return template.query("select * from blogs " +
                "where author=? " +
                "order by creation_date desc", blogsRowMapper, name);
    }
}
