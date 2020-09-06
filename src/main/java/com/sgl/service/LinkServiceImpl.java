package com.sgl.service;

import com.sgl.dao.CommentMapper;
import com.sgl.dao.LinkMapper;
import com.sgl.pojo.Blog;
import com.sgl.pojo.Link;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sgl on 2020/5/22.
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService {
    private LinkMapper linkMapper;

    public void setLinkMapper(LinkMapper linkMapper) {

        this.linkMapper = linkMapper;
    }
    @Override
    public List<Link> countList() {
        return linkMapper.countList();
    }

    @Override
    public Link findById(int id) {
        return linkMapper.findById(id);
    }

    @Override
    public long getTotal() {
        return linkMapper.getTotal();
    }

    @Override
    public int add(Link link) {
        return linkMapper.add(link);
    }

    @Override
    public int update(Link link) {
        return linkMapper.update(link);
    }

    @Override
    public int delete(int id) {
        return linkMapper.delete(id);
    }
}
