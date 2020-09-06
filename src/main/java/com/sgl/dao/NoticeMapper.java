package com.sgl.dao;


import com.sgl.pojo.Link;
import com.sgl.pojo.Notice;

import java.util.List;

/**
 * Created by sgl on 2020/5/23.
 */
public interface NoticeMapper {
    List<Notice> countList();

    Notice findById(int id);

    long getTotal();

    int add(Notice notice);

    int update(Notice notice);

    int delete(int id);

}
