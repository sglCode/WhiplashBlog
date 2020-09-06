package com.sgl.controller.Public;

import com.sgl.pojo.Blog;
import com.sgl.pojo.Comment;
import com.sgl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class CommentController {
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

    @RequestMapping("/blog/{id}/addComment")
    public String addComment(Comment comment, @PathVariable Integer id){
        Blog blog = new Blog();
        blog.setId(id);
        comment.setBlog(blog);
        commentService.add(comment);
        return "redirect:/blog/"+id;
    }
}
