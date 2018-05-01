package com.gaman.services;

import com.gaman.domain.Blogs;
import com.gaman.domain.mappers.BlogsRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Created by Natalka on 22.05.2017.
 */
@Service
public class BlogsService {
    private JdbcTemplate template;
    private BlogsRowMapper blogsRowMapper;

    Map<Long, Blogs> blogsFakeDB = new HashMap<>();
    long fakeBlogsSequance;

    public BlogsService(JdbcTemplate template, BlogsRowMapper blogsRowMapper) {
        this.template = template;
        this.blogsRowMapper = blogsRowMapper;

        Blogs blogs = createFakeBlog("user", "some title", "some content");
        blogsFakeDB.put(blogs.getId(), blogs);
    }

    private Blogs createFakeBlog(String author, String title, String content) {
        return new Blogs(
                  ++fakeBlogsSequance,
                  LocalDateTime.now(),
                  author,
                  title,
                  content
              );
    }

    public List<Blogs> getBlogs() {
            return new ArrayList<>(blogsFakeDB.values());
//        return template.query("select * from blogs order by creation_date desc", blogsRowMapper);
    }

    public Blogs getById(Long itemId) {
        return blogsFakeDB.get(itemId);
//        return template.queryForObject("Select * from blogs where itemId=?", new Object[]{itemId}, blogsRowMapper);

    }

    public Long create(String author, String title, String content) {
        Blogs fakeBlog = createFakeBlog(author, title, content);
        blogsFakeDB.put(fakeBlog.getId(), fakeBlog);
        return fakeBlog.getId();
//        SimpleJdbcInsert insert = new SimpleJdbcInsert(template)
//                .withTableName("blogs")
//                .usingGeneratedKeyColumns("itemid");
//        Map<String, Object> parameters = new HashMap<>();
//        parameters.put("title", title);
//        parameters.put("author", author);
//        parameters.put("content", content);
//        parameters.put("creation_date", LocalDateTime.now());
//        return (Long) insert.executeAndReturnKey(new MapSqlParameterSource(parameters));
    }

    public void remove(Long itemId) {
        blogsFakeDB.remove(itemId);
//        template.update("delete from blogs where itemId = ?", itemId);
    }

    public List<Blogs> getBlogs(String name) {
        return blogsFakeDB.values().stream()
            .filter(blogs -> blogs.getAuthor().equals(name))
            .collect(Collectors.toList());
//        return template.query("select * from blogs " +
//                "where author=? " +
//                "order by creation_date desc", blogsRowMapper, name);
    }
}
