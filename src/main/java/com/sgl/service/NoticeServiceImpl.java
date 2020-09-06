package com.sgl.service;

import com.sgl.dao.LinkMapper;
import com.sgl.dao.NoticeMapper;
import com.sgl.pojo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sgl on 2020/5/23.
 */
@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{
    private NoticeMapper noticeMapper;

    public void setNoticeMapper(NoticeMapper noticeMapper) {

        this.noticeMapper = noticeMapper;
    }


    @Override
    public List<Notice> countList() {
        return noticeMapper.countList();
    }

    @Override
    public Notice findById(int id) {
        return noticeMapper.findById(id);
    }

    @Override
    public long getTotal() {
        return noticeMapper.getTotal();
    }

    @Override
    public int add(Notice notice) {
        return noticeMapper.add(notice);
    }

    @Override
    public int update(Notice notice) {
        return noticeMapper.update(notice);
    }

    @Override
    public int delete(int id) {
        return noticeMapper.delete(id);
    }
}
