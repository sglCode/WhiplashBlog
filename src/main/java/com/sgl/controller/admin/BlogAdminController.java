package com.sgl.controller.admin;

import com.sgl.pojo.Blog;
import com.sgl.pojo.BlogType;
import com.sgl.service.BlogService;
import com.sgl.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by sgl on 2020/5/16.
 */
@Controller
public class BlogAdminController {
    @Autowired
    @Qualifier("blogService")
    private BlogService blogService;
    @Autowired
    @Qualifier("blogTypeService")
    private BlogTypeService blogTypeService;

    @RequestMapping(value = "/admin/article")
    public String list (Model model) {
        List<Blog> blogs = blogService.countList();
        model.addAttribute("blogs",blogs);
        return "/WEB-INF/jsp/Admin/Blog/index";
    }

    @RequestMapping(value = "/admin/article/insert")
    public String insert (Model model) {

        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);
        int articleId=blogService.findNewestBlog().getId();
        model.addAttribute("articleId",articleId);
        return "/WEB-INF/jsp/Admin/Blog/insert";
    }

    @RequestMapping(value = "/admin/article/insertSubmit")
    public String insertSubmit (Model model,Blog blog,Integer blogType1) {
        System.out.println(blogType1);
        blogService.add(blog);

        List<Blog> blogs = blogService.countList();
        model.addAttribute("blogs", blogs);

        return "redirect:/admin/article";
    }

    @RequestMapping(value = "/admin/article/delete/{id}")
    public String delete (Model model,@PathVariable("id")Integer id) {
        blogService.delete(id);
        return "redirect:/admin/article";
    }

    @RequestMapping(value = "/admin/article/edit/{id}")
    public String edit (Model model,@PathVariable("id")Integer id) {
        Blog blog= blogService.findById(id);
        model.addAttribute("blog",blog);
        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);
        int articleId=blogService.findNewestBlog().getId();
        model.addAttribute("articleId",articleId);
        return "/WEB-INF/jsp/Admin/Blog/edit";
    }

    @RequestMapping(value = "/admin/article/updateSubmit")
    public String updateSubmit(Model model,Blog blog) {
        blogService.update(blog);
        return "redirect:/admin/article";
    }
}
