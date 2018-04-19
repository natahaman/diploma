package com.gaman.controllers;

import com.gaman.domain.Blogs;
import com.gaman.services.BlogsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

/**
 * Created by Natalka on 14.05.2017.
 */
@Controller
@RequestMapping("/list")
public class BlogsListController {
    private BlogsService blogsService;

    public BlogsListController(BlogsService blogsService) {
        this.blogsService = blogsService;
    }

    @GetMapping
    public String homePage(Model model, Principal principal){
        List<Blogs> blogsList;
        if(principal == null){
            blogsList = blogsService.getBlogs();
        }else {
            blogsList = blogsService.getBlogs(principal.getName());
        }

        model.addAttribute("blogsList", blogsList);
        model.addAttribute("isAuthorized", principal != null);
        return "blogsList";
    }




}
