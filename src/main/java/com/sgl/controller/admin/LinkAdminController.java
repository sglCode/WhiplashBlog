package com.sgl.controller.admin;

import com.sgl.pojo.Link;
import com.sgl.service.LinkService;
import com.sgl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by sgl on 2020/5/22.
 */
@Controller
public class LinkAdminController {
    @Autowired
    @Qualifier("linkService")
    private LinkService linkService;

    @RequestMapping("/admin/link")
    public String login(Model model) {
        List<Link> links = linkService.countList();
        model.addAttribute("links",links);
        return "/WEB-INF/jsp/Admin/Link/index";
    }

    @RequestMapping("/admin/link/edit/{id}")
    public String edit(Model model,@PathVariable("id")Integer id) {

        Link link = linkService.findById(id);
        model.addAttribute("link",link);
        linkService.update(link);
        List<Link> links = linkService.countList();
        model.addAttribute("links",links);
        return "/WEB-INF/jsp/Admin/Link/edit";
    }


    @RequestMapping("/admin/link/editSubmit")
     public String editSubmit(Model model,Link link) {
        linkService.update(link);
        return "redirect:/admin/link";
    }

    @RequestMapping("/admin/link/insert")
    public String insert(Model model) {

        List<Link> links = linkService.countList();
        model.addAttribute("links",links);

        return "/WEB-INF/jsp/Admin/Link/insert";
    }

    @RequestMapping("/admin/link/insertSubmit")
    public String insertSubmit(Model model,Link link) {
        System.out.println(link);
        linkService.add(link);
        return "redirect:/admin/link";
    }

    @RequestMapping("/admin/link/delete/{id}")
    public String delete(Model model,@PathVariable("id")Integer id) {
        linkService.delete(id);
        return "redirect:/admin/link";
    }
}
