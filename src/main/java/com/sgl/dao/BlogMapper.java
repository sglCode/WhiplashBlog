package com.sgl.dao;

import com.sgl.pojo.Blog;
import com.sgl.pojo.BlogType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by sgl on 2020/5/11.
 */
public interface BlogMapper {
    //查询所有博客
    List<Blog> countList();
    //根据id查博客
    Blog findById(int id);
    //总博客数量
    long getTotal();
    //添加博客类型
    int add(Blog blog);

    int update(Blog blog);

    int delete(int id);

    Blog findNewestBlog();

    List<Blog> find(HashMap<String,Object> map);

    List<Blog> findBlogByTypeId(Integer minTypeId,Integer maxTypeId,Integer limit);

    Long getTotalHit();

    List<Blog> getBlogByClickHit();

    List<Blog> getBlogByReply();

    List<Blog> getBlogBySearch(String keyword);
}
