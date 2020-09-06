package com.sgl.controller.admin;


import com.sgl.pojo.BlogType;
import com.sgl.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

/**
 * Created by sgl on 2020/5/12.
 */
@Controller
public class BlogTypeAdminController {
    @Autowired
    @Qualifier("blogTypeService")
    private BlogTypeService blogTypeService;

    @RequestMapping(value="/admin/blogType")
    public String list (Model model,BlogType blogType)  {
        List<BlogType> blogTypes = blogTypeService.countList();
        long total = blogTypeService.getTotal();
        model.addAttribute("total",total);
        model.addAttribute("blogTypes",blogTypes);
        return "/WEB-INF/jsp/Admin/BlogType/blogType";
    }
    @RequestMapping(value="/admin/blogType/edit/{id}")
    public String edit (Model model,@PathVariable("id") Integer id)  {
        BlogType blogType = blogTypeService.findById(id);
        model.addAttribute("blogType",blogType);
        List<BlogType> blogTypes = blogTypeService.countList();
        long total = blogTypeService.getTotal();
        model.addAttribute("total",total);
        model.addAttribute("blogTypes",blogTypes);
        return "/WEB-INF/jsp/Admin/BlogType/edit";
   }
    @RequestMapping(value="/admin/blogType/update")
    public String update (Model model,BlogType blogType)  {
        blogTypeService.update(blogType);
        return "redirect:/admin/blogType";
    }
    @RequestMapping(value="/admin/blogType/delete/{id}")
    public String delete(Model model,BlogType blogType,@PathVariable("id") Integer id)  {
        blogTypeService.delete(id);
        return "redirect:/admin/blogType";
    }

    @RequestMapping(value="/admin/category/add")
    public String add(Model model,BlogType blogType)  {
        int orderNo = blogType.getOrderNo();
        orderNo+=1;
        blogType.setOrderNo(orderNo);
        blogTypeService.add(blogType);
        return "redirect:/admin/blogType";
    }
}
