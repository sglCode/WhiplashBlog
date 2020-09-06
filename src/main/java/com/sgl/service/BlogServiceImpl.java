package com.sgl.service;

import com.sgl.dao.BlogMapper;
import com.sgl.dao.CommentMapper;
import com.sgl.pojo.Blog;
import com.sgl.pojo.BlogType;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by sgl on 2020/5/16.
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {
    private BlogMapper blogMapper;

    public void setBlogMapper(BlogMapper blogMapper) {

        this.blogMapper = blogMapper;
    }
    private CommentMapper commentMapper;

    public void setCommentMapper(CommentMapper commentMapper) {

        this.commentMapper = commentMapper;
    }
    @Override
    public List<Blog> countList() {
        return blogMapper.countList();
    }

    @Override
    public Blog findById(int id) {
        return blogMapper.findById(id);
    }

    @Override
    public long getTotal() {
        return blogMapper.getTotal();
    }

    @Override
    public int add(Blog blog) {
        return blogMapper.add(blog);
    }

    @Override
    public int update(Blog blog) {
        return blogMapper.update(blog);
    }

    @Override
    public int delete(int id) {
        commentMapper.deleteByBlogId(id);
        return blogMapper.delete(id);
    }

    @Override
    public Blog findNewestBlog() {
        return blogMapper.findNewestBlog();
    }

    @Override
    public List<Blog> find(HashMap<String, Object> map) {
        return blogMapper.find(map);
    }

    @Override
    public List<Blog> findBlogByTypeId(Integer minTypeId, Integer maxTypeId,Integer limit) {
        return blogMapper.findBlogByTypeId(minTypeId,maxTypeId,limit);
    }

    @Override
    public Long getTotalHit() {
        return blogMapper.getTotalHit();
    }

    @Override
    public List<Blog> getBlogByClickHit() {
        return blogMapper.getBlogByClickHit();
    }

    @Override
    public List<Blog> getBlogByReply() {
        return blogMapper.getBlogByReply();
    }

    @Override
    public List<Blog> getBlogBySearch(String keyword) {
        return blogMapper.getBlogBySearch(keyword);
    }


}
