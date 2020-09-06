package com.sgl.service;

import com.sgl.dao.BlogTypeMapper;
import com.sgl.dao.UserMapper;
import com.sgl.pojo.BlogType;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by sgl on 2020/5/12.
 */
@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {
    private BlogTypeMapper blogTypeMapper;

    public void setBlogTypeMapper(BlogTypeMapper blogTypeMapper) {

        this.blogTypeMapper = blogTypeMapper;
    }
    @Override
    public List<BlogType> countList() {
        return blogTypeMapper.countList();
    }

    @Override
    public BlogType findById(int id) {
        return blogTypeMapper.findById(id);
    }

    @Override
    public List<BlogType> list(Map<String, Object> parmMap) {
        return blogTypeMapper.list(parmMap);
    }

    @Override
    public long getTotal() {
        return blogTypeMapper.getTotal();
    }

    @Override
    public int add(BlogType blogType) {
        return blogTypeMapper.add(blogType);
    }

    @Override
    public int update(BlogType blogType) {
        return blogTypeMapper.update(blogType);
    }

    @Override
    public int delete(int orderNo) {
        return blogTypeMapper.delete(orderNo);
    }
}
