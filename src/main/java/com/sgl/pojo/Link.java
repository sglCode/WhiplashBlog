package com.sgl.pojo;

import java.io.Serializable;

/**
 * Created by sgl on 2020/5/22.
 */
public class Link implements Serializable {
    private Integer id;
    private String linkName;

    @Override
    public String toString() {
        return "Link{" +
                "id=" + id +
                ", linkName='" + linkName + '\'' +
                ", linkUrl='" + linkUrl + '\'' +
                '}';
    }

    public String getLinkUrl() {
        return linkUrl;
    }

    public void setLinkUrl(String linkUrl) {
        this.linkUrl = linkUrl;
    }

    public String getLinkName() {
        return linkName;
    }

    public void setLinkName(String linkName) {
        this.linkName = linkName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    private String linkUrl;

}
