package com.sgl.controller.Public;

import com.sgl.pojo.*;
import com.sgl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

@Controller
public class BlogController {
    @Autowired
    @Qualifier("blogService")
    private BlogService blogService;
    @Autowired
    @Qualifier("blogTypeService")
    private BlogTypeService blogTypeService;
    @Autowired
    @Qualifier("commentService")
    private CommentService commentService;
    @Autowired
    @Qualifier("linkService")
    private LinkService linkService;
    @Autowired
    @Qualifier("noticeService")
    private NoticeService noticeService;
    @Autowired
    @Qualifier("userService")
    private UserService userService;

    @RequestMapping("/blog/{id}")
    public String blogDetail(Model model,@PathVariable Integer id) {
        List<Notice> notices = noticeService.countList();
        model.addAttribute("notices",notices);

        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);

        Blog blog = blogService.findById(id);
        model.addAttribute("blog",blog);

        List<Link> links = linkService.countList();
        model.addAttribute("links",links);

        HashMap<String, Object> map = new HashMap<>();
        map.put("blogId",id);
        List<Comment> commentList=commentService.list(map);
        model.addAttribute("commentList",commentList);

        List<Blog> similarBlogList = blogService.findBlogByTypeId(blog.getBlogType().getId(), blog.getBlogType().getId(),3);
        model.addAttribute("similarBlogList",similarBlogList);

        List<Blog> mostClickHitBlog = blogService.getBlogByClickHit();
        model.addAttribute("mostClickHitBlog",mostClickHitBlog);

        List<Blog> mostReplyBlog = blogService.getBlogByReply();
        model.addAttribute("mostReplyBlog",mostReplyBlog);



        return "/WEB-INF/jsp/Public/articleDetail";
    }
}
