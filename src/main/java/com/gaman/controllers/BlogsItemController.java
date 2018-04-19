package com.gaman.controllers;

import com.gaman.domain.Blogs;
import com.gaman.services.BlogsService;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.time.format.DateTimeFormatter;

/**
 * Created by Natalka on 14.05.2017.
 */
@Controller
@RequestMapping("/item")
public class BlogsItemController {
    public static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss");
    private BlogsService blogsService;

    public BlogsItemController(BlogsService blogsService) {
        this.blogsService = blogsService;
    }

    @GetMapping(value = "/{id}")
    public String showItem(Model model, @PathVariable(value = "id") Long itemId){
        Blogs blogs = blogsService.getById(itemId);
        model.addAttribute("id", String.valueOf(blogs.getId()));
        model.addAttribute("title", blogs.getTitle());
        model.addAttribute("date", formatter.format(blogs.getDate()));
        model.addAttribute("author", blogs.getAuthor());
        model.addAttribute("content", blogs.getContent());
        return "blogsExistingItem";
    }

    @GetMapping(value = "/new")
    public String newItem(Model model, Principal principal){
        model.addAttribute("id", "");
        model.addAttribute("title", "");
        model.addAttribute("date", "");
        model.addAttribute("author", principal.getName());
        model.addAttribute("content", "");
        return "blogsItem";
    }


    @PostMapping(value = "/add", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String addItem (@ModelAttribute(value = "author") String author,
                           @ModelAttribute(value = "title") String title,
                          @ModelAttribute(value = "content") String content
    ){
        Long blogsId = blogsService.create(author, title, content);
        return String.format("redirect:/item/%d", blogsId);
    }

    @GetMapping(value = "/remove/{id}")
    public String removeItem(Model model, @PathVariable(value = "id") Long itemId){
        blogsService.remove(itemId);
        return "redirect:/list";
    }

}
