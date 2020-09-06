package com.sgl.controller.admin;

import cn.hutool.crypto.SecureUtil;
import com.sgl.pojo.User;
import com.sgl.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by sgl on 2020/5/7.
 */
@Controller

public class UserAdminController {
    @Autowired
    @Qualifier("userService")
    private UserService userService;
    //登录
    @RequestMapping("/login")
    public String login(Model model) {
        return "WEB-INF/jsp/Public/login";
    }
    //判断是否登录成功
    @RequestMapping("/admin")
    public String success(Model model,User user,HttpSession session) {
        String password = user.getPassword();
        String s = SecureUtil.md5(password);
        user.setPassword(s);
        int i = userService.ifUserExist(user);
        if (i==1){
            User userByUsername = userService.findUserByUsername(user.getUsername());
            session.setAttribute("user",userByUsername);

            return "/WEB-INF/jsp/Admin/index";
        }else{
            model.addAttribute("msg","用户名或密码错误");
            return "WEB-INF/jsp/Public/login";
        }
    }

    @RequestMapping(value = "/admin/logout")
    public String logout(HttpSession session,Model model)  {
        session.removeAttribute("user");
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/admin/user/profile")
    public String profile(Model model,HttpSession session) {
        User u = (User)session.getAttribute("user");
        System.out.println(userService.findUserByUsername(u.getUsername()));
        model.addAttribute("user",userService.findUserByUsername(u.getUsername()));
        return "/WEB-INF/jsp/Admin/User/profile";
        }

    @RequestMapping("/admin/user/edit/{id}")
    public String edit(Model model,HttpSession session,@PathVariable("id")Integer id) {
        User user = userService.findUser(id);
        model.addAttribute("user",user);
        return "/WEB-INF/jsp/Admin/User/edit";
    }

    @RequestMapping("/admin/user/editSubmit")
    public String editSubmit(Model model,User user) {
        userService.updateUser(user);
        return "redirect:/admin/user";
    }

    @RequestMapping("/admin/user")
    public String user(Model model) {
        List<User> users = userService.userList();
        model.addAttribute("users",users);
        return "/WEB-INF/jsp/Admin/User/index";
    }

    @RequestMapping("/admin/user/insert")
    public String insert(Model model) {
        return "/WEB-INF/jsp/Admin/User/insert";
    }

    @RequestMapping("/admin/user/insertSubmit")
    public String insertSubmit(Model model,User user) {
        System.out.println(user);
        userService.addUser(user);
        return "redirect:/admin/user";
    }
    }


