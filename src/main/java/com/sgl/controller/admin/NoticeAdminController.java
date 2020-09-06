package com.sgl.controller.admin;

import com.sgl.pojo.Link;
import com.sgl.pojo.Notice;
import com.sgl.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by sgl on 2020/5/23.
 */
@Controller
public class NoticeAdminController {
    @Autowired
    @Qualifier("noticeService")
    private NoticeService noticeService;

    @RequestMapping("/admin/notice")
    public String login(Model model) {
        List<Notice> notices = noticeService.countList();
        model.addAttribute("notices",notices);
        return "/WEB-INF/jsp/Admin/Notice/index";
    }

    @RequestMapping("/admin/notice/edit/{id}")
    public String edit(Model model,@PathVariable("id")Integer id) {
        Notice notice = noticeService.findById(id);
        model.addAttribute("notice",notice);
        return "/WEB-INF/jsp/Admin/Notice/edit";
    }

    @RequestMapping("/admin/notice/editSubmit")
    public String editSubmit(Model model,Notice notice) {
        System.out.println(notice);
        noticeService.update(notice);
        return "redirect:/admin/notice";
    }

    @RequestMapping("/admin/notice/insert")
    public String insert(Model model) {
        return "/WEB-INF/jsp/Admin/Notice/insert";
    }

    @RequestMapping("/admin/notice/insertSubmit")
    public String insertSubmit(Model model,Notice notice) {
        noticeService.add(notice);
        return "redirect:/admin/notice";
    }

    @RequestMapping("/admin/notice/delete/{id}")
    public String delete(Model model,@PathVariable("id")Integer id) {
        noticeService.delete(id);
        return "redirect:/admin/notice";
    }
}
