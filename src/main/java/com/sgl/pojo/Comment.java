package com.sgl.pojo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by sgl on 2020/5/19.
 */
public class Comment implements Serializable{
    private Integer id;
    private String nickName;
    private Blog blog;
    private String content;
    private Date commentDate;
    private Integer state;

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", nickName='" + nickName + '\'' +
                ", blog=" + blog +
                ", content='" + content + '\'' +
                ", commentDate=" + commentDate +
                ", state=" + state +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
