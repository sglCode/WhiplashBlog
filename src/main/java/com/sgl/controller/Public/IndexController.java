package com.sgl.controller.Public;

import com.sgl.pojo.*;
import com.sgl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by sgl on 2020/5/23.
 */
@Controller
public class IndexController {
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

    @RequestMapping(value ={"", "/blog"})
    public String list(Model model) {
        List<Notice> notices = noticeService.countList();
        model.addAttribute("notices",notices);

        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);

        List<Blog> blogs = blogService.countList();
        model.addAttribute("blogs",blogs);

        List<Link> links = linkService.countList();
        model.addAttribute("links",links);

        List<Comment> commentList=commentService.list(new HashMap<>());
        model.addAttribute("commentList",commentList);

        Date newestTime = blogService.findNewestBlog().getReleaseDate();
        model.addAttribute("newestTime",newestTime);

        long[] arr= new long[4];
        arr[0] = (int) blogService.getTotal();
        arr[1] = blogTypeService.getTotal();
        arr[2] = linkService.getTotal();
        arr[3]=blogService.getTotalHit();
        model.addAttribute("arr",arr);
        return "/WEB-INF/jsp/index";
    }

    @RequestMapping(value ="/blogType/{father}")
    public String java(Model model, @PathVariable("father")String father) {
        model.addAttribute("father",father);
        Integer limit=10;
        if (father.equals("Java")){
        List<Blog> blogs = blogService.findBlogByTypeId(3,10,limit);
        model.addAttribute("blogs",blogs);
        }if (father.equals("cs")){
            List<Blog> blogs = blogService.findBlogByTypeId(18,20,limit);
            model.addAttribute("blogs",blogs);
        }if (father.equals("tools")){
            List<Blog> blogs = blogService.findBlogByTypeId(21,24,limit);
            model.addAttribute("blogs",blogs);
        }
        //热评文章
        List<Blog> mostReplyBlog = blogService.getBlogByReply();
        model.addAttribute("mostReplyBlog",mostReplyBlog);
        //所有分类
        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);

        return "/WEB-INF/jsp/Public/articleListByCategory";
    }

    @RequestMapping(value ="/blogType/{father}/{id}")
    public String java(Model model, @PathVariable("id")Integer id,@PathVariable("father")String father) {
        BlogType son = blogTypeService.findById(id);
        model.addAttribute("son",son);
        model.addAttribute("father",father);
        //所有博客
        List<Blog> blogs = blogService.findBlogByTypeId(id, id,10);
        model.addAttribute("blogs",blogs);
        //热评文章
        List<Blog> mostReplyBlog = blogService.getBlogByReply();
        model.addAttribute("mostReplyBlog",mostReplyBlog);
        //所有分类
        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);

        return "/WEB-INF/jsp/Public/articleListByCategory";
    }

    @RequestMapping(value = "/search")
    public String search(Model model,String keyword){
        List<Blog> blogBySearch = blogService.getBlogBySearch(keyword);

        model.addAttribute("blogBySearch", blogBySearch);
        model.addAttribute("total",blogBySearch.size());
        model.addAttribute("keyword",keyword);
        //热评文章
        List<Blog> mostReplyBlog = blogService.getBlogByReply();
        model.addAttribute("mostReplyBlog",mostReplyBlog);
        //所有分类
        List<BlogType> blogTypes = blogTypeService.countList();
        model.addAttribute("blogTypes",blogTypes);
        return "/WEB-INF/jsp/Public/search";
    }
}
