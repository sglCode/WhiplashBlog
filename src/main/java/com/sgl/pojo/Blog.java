package com.sgl.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created by sgl on 2020/5/15.
 */
public class Blog implements Serializable {
    private Integer id;
    private String title;
    private Date releaseDate;
    private int clickHit;
    private int replyHit;
    private String content;
    private BlogType blogType;
    private String state;
    private String pureContent;
    private String releaseDateStr;

    @Override
    public String toString() {
        return "Blog{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", releaseDate=" + releaseDate +
                ", clickHit=" + clickHit +
                ", replyHit=" + replyHit +
                ", content='" + content + '\'' +
                ", blogType=" + blogType +
                ", state='" + state + '\'' +
                ", pureContent='" + pureContent + '\'' +
                ", releaseDateStr='" + releaseDateStr + '\'' +
                '}';
    }

    public BlogType getBlogType() {
        return blogType;
    }

    public void setBlogType(BlogType blogType) {
        this.blogType = blogType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public int getClickHit() {
        return clickHit;
    }

    public void setClickHit(int clickHit) {
        this.clickHit = clickHit;
    }

    public int getReplyHit() {
        return replyHit;
    }

    public void setReplyHit(int replyHit) {
        this.replyHit = replyHit;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPureContent() {
        return pureContent;
    }

    public void setPureContent(String pureContent) {
        this.pureContent = pureContent;
    }

    public String getReleaseDateStr() {
        return releaseDateStr;
    }

    public void setReleaseDateStr(String releaseDateStr) {
        this.releaseDateStr = releaseDateStr;
    }
}
