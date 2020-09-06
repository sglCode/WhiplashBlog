package com.sgl.service;

import com.sgl.dao.CommentMapper;
import com.sgl.pojo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by sgl on 2020/5/19.
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    private CommentMapper commentMapper;

    public void setCommentMapper(CommentMapper commentMapper) {

        this.commentMapper = commentMapper;
    }
    @Override
    public int add(Comment comment) {
        return commentMapper.add(comment);
    }

    @Override
    public int update(Comment comment) {
        return commentMapper.update(comment);
    }

    @Override
    public List<Comment> list(Map<String, Object> map) {
        return commentMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return commentMapper.getTotal(map);
    }

    @Override
    public Integer delete(Integer id) {
        return commentMapper.delete(id);
    }

    @Override
    public Integer deleteByBlogId(Integer id) {
        return commentMapper.deleteByBlogId(id);
    }
}
