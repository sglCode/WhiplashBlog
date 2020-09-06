package com.sgl.dao;

import com.sgl.pojo.Blog;
import com.sgl.pojo.Link;

import java.util.HashMap;
import java.util.List;

/**
 * Created by sgl on 2020/5/22.
 */
public interface LinkMapper {

    List<Link> countList();

    Link findById(int id);

    long getTotal();

    int add(Link link);

    int update(Link link);

    int delete(int id);

}
