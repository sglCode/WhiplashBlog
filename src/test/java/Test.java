import com.sgl.dao.BlogMapper;
import com.sgl.pojo.*;
import com.sgl.service.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by sgl on 2020/5/11.
 */
public class Test {
    //测试User
    @org.junit.Test
    public void test1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        UserService userService = ac.getBean("userService", UserService.class);
        User admin = userService.findUserByUsername("admin");
        System.out.println(admin);
    }
    //测试BlogType
    @org.junit.Test
    public void test2(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogTypeService blogTypeService = ac.getBean("blogTypeService", BlogTypeService.class);
        long total = blogTypeService.getTotal();
        System.out.println(total);
    }
    @org.junit.Test
    public void test3(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogTypeService blogTypeService = ac.getBean("blogTypeService", BlogTypeService.class);
        List<BlogType> blogTypes = blogTypeService.countList();
        for (BlogType blogType : blogTypes) {
            System.out.println(blogType);
        }

    }
    @org.junit.Test
    public void test4(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogService blogService = ac.getBean("blogService", BlogService.class);
        Blog blog = blogService.findById(22);
        System.out.println(blog);
    }

    @org.junit.Test
    public void test5() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogService blogService = ac.getBean("blogService", BlogService.class);
        BlogTypeService blogTypeService = ac.getBean("blogTypeService", BlogTypeService.class);
        List<Blog> blogs = blogService.getBlogByClickHit();
        for (Blog blog : blogs) {
            System.out.println(blog);
        }

    }

    @org.junit.Test
    public void test6(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        CommentService commentService = ac.getBean("commentService", CommentService.class);
        HashMap<String, Object> map = new HashMap<>();
        map.put("state",0);
        List<Comment> list = commentService.list(map);
        for (Comment comment : list) {
            System.out.println(comment);
        }
    }

    @org.junit.Test
    public void test7(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        CommentService commentService = ac.getBean("commentService", CommentService.class);
        HashMap<String, Object> map = new HashMap<>();
        List<Comment> list = commentService.list(map);
        for (Comment comment : list) {
            System.out.println(comment);
        }
    }

    @org.junit.Test
    public void test8(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        CommentService commentService = ac.getBean("commentService", CommentService.class);
        commentService.deleteByBlogId(9);
        }

    @org.junit.Test
    public void test9(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogService blogService = ac.getBean("blogService", BlogService.class);
        HashMap<String, Object> map = new HashMap<>();
        map.put("title",12345);
        List<Blog> blogs = blogService.find(map);
        for (Blog blog : blogs) {
            System.out.println(blog.getBlogType().getId());
        }
    }

    @org.junit.Test
    public void test10(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        LinkService linkService = ac.getBean("linkService",LinkService.class);
        Link link= linkService.findById(1);
        System.out.println(link);

    }

    @org.junit.Test
    public void test11(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        NoticeService noticeService = ac.getBean("noticeService",NoticeService.class);;
        Notice notice = noticeService.findById(1);
        System.out.println(notice);
    }

    @org.junit.Test
    public void test12(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogService blogService = ac.getBean("blogService", BlogService.class);
        List<Blog> blogByTypeId = blogService.findBlogByTypeId(20,20,3);
        for (Blog blog : blogByTypeId) {
            System.out.println(blog);
        }
    }

    @org.junit.Test
    public void test13(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BlogService blogService = ac.getBean("blogService", BlogService.class);
        List<Blog> blogByTypeId = blogService.getBlogByReply();
        for (Blog blog : blogByTypeId) {
            System.out.println(blog);
        }
    }
}
