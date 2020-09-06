package com.sgl.controller.admin;

import com.sgl.pojo.Blog;
import com.sgl.pojo.BlogType;
import com.sgl.pojo.Comment;
import com.sgl.service.BlogService;
import com.sgl.service.BlogTypeService;
import com.sgl.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by sgl on 2020/5/19.
 */
@Controller
public class CommentAdminController {
//    @Autowired
//    @Qualifier("blogService")
//    private BlogService blogService;
//    @Autowired
//    @Qualifier("blogTypeService")
//    private BlogTypeService blogTypeService;
    @Autowired
    @Qualifier("commentService")
    private CommentService commentService;


    @RequestMapping(value = "/admin/comment")
    public String comment(Model model) {
        HashMap<String, Object> map = new HashMap<>();
        List<Comment> list = commentService.list(map);
        model.addAttribute("list",list);
        return "/WEB-INF/jsp/Admin/Comment/index";
    }


    @RequestMapping(value = "/admin/comment/delete/{id}")
    public String delete(Model model,@PathVariable("id")Integer id) {
        commentService.delete(id);
        return "redirect:/admin/comment";
    }

    @RequestMapping(value = "/admin/commentReview")
    public String commentReview(Model model) {
        HashMap<String, Object> map = new HashMap<>();
        map.put("state","0");
        List<Comment> reviewList = commentService.list(map);
        model.addAttribute("reviewList",reviewList);
        return "/WEB-INF/jsp/Admin/Comment/review";
    }

    @RequestMapping(value = "/comment/commentReview/{id}/{state}")
    public String review(Model model,@PathVariable("state")Integer state,@PathVariable("id")Integer id) {
        Comment comment = new Comment();
        comment.setId(id);
        if (state==1){
            comment.setState(1);
            commentService.update(comment);
        }else if (state==0){
            comment.setState(-1);
            commentService.update(comment);
        }
        return "redirect:/admin/commentReview";
//        return "/WEB-INF/jsp/Admin/Comment/review";
    }
}

