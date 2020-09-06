package com.sgl.service;



import com.sgl.pojo.Notice;

import java.util.List;

/**
 * Created by sgl on 2020/5/23.
 */
public interface NoticeService {
    List<Notice> countList();

    Notice findById(int id);

    long getTotal();

    int add(Notice notice);

    int update(Notice notice);

    int delete(int id);

}
