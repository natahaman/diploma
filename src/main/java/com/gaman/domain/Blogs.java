package com.gaman.domain;

import java.time.LocalDateTime;

/**
 * Created by Natalka on 14.05.2017.
 */
public class Blogs {
    private final Long id;
    private final LocalDateTime date;
    private final String author;
    private final String title;
    private final String content;

    public Blogs(Long id, LocalDateTime date, String author, String title, String content) {
        this.id = id;
        this.date = date;
        this.author = author;
        this.title = title;
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public String getAuthor() {
        return author;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }
}
