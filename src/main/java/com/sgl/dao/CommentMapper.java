package com.sgl.dao;

import com.sgl.pojo.Comment;

import java.util.List;
import java.util.Map;

/**
 * Created by sgl on 2020/5/19.
 */
public interface CommentMapper {

    public int add(Comment comment);

    public int update(Comment comment);

    public List<Comment> list(Map<String,Object> map);

    public Long getTotal(Map<String,Object> map);

    public Integer delete(Integer id);

    public Integer deleteByBlogId(Integer id);
}
