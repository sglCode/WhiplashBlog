package com.sgl.service;

import com.sgl.pojo.BlogType;

import java.util.List;
import java.util.Map;

/**
 * Created by sgl on 2020/5/12.
 */
public interface BlogTypeService {
    //查询所有博客类型
    List<BlogType> countList();
    //根据id查类型
    BlogType findById(int id);
    //不固定参数查类型
    List<BlogType> list(Map<String,Object> parmMap);
    //不固定参数查数量
    long getTotal();
    //添加博客类型
    int add(BlogType blogType);

    int update(BlogType blogType);

    int delete(int orderNo);
}
