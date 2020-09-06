<%--
    一般用于首页侧边栏：
    包括 关于本站，网站概况，热评文章，所有标签，随机文章 等小工具

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">


    <%--网站概况 start--%>
    <aside id="php_text-22" class="widget php_text">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>网站概况
        </h3>
        <div class="textwidget widget-text">
            <ul class="site-profile">
                <li><i class="fa fa-file-o"></i> 文章总数：${arr[0]} 篇</li>
                <%--<li><i class="fa fa-commenting-o"></i> 留言数量：${siteBasicStatistics[1]} 条</li>--%>
                <li><i class="fa fa-folder-o"></i> 分类数量：${arr[1]} 个</li>
                <%--<li><i class="fa fa-tags"></i> 标签总数：${siteBasicStatistics[3]} 个</li>--%>
                <li><i class="fa fa-link"></i> 链接数量：${arr[2]} 个</li>
                <li><i class="fa fa-eye"></i> 浏览总量：${arr[3]} 次</li>
                <li><i class="fa fa-pencil-square-o"></i> 最后更新：
                    <span style="color:#2F889A">
                                        <fmt:formatDate value="${newestTime}" pattern="yyyy年MM月dd日"/>

                                   </span>
                </li>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--网站概况 end--%>

    <%--所有标签 start--%>
    <aside class="widget">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>所有标签
        </h3>
        <div class="tagcloud">
            <c:forEach items="${blogTypes}" var="t">
                <c:if test="${t.typeName=='JavaSE'||t.typeName=='多线程'||t.typeName=='设计模式和反射'
                    ||t.typeName=='JVM'||t.typeName=='JavaWeb'||t.typeName=='Java框架'}">

                    <a href="/blogType/Java/${t.id}"
                       class="tag-link-129 tag-link-position-1"
                       style="font-size: 14px;">
                            ${t.typeName}
                    </a>
                </c:if>
                <c:if test="${t.typeName=='数据结构和算法'||t.typeName=='数据库'||t.typeName=='计算机网络'}">

                    <a href="/blogType/cs/${t.id}"
                       class="tag-link-129 tag-link-position-1"
                       style="font-size: 14px;">
                            ${t.typeName}
                    </a>
                </c:if>
                <c:if test="${t.typeName=='消息服务'||t.typeName=='Docker'||t.typeName=='缓存服务'||t.typeName=='微服务'}">

                    <a href="/blogType/tools/${t.id}"
                       class="tag-link-129 tag-link-position-1"
                       style="font-size: 14px;">
                            ${t.typeName}
                    </a>
                </c:if>
            </c:forEach>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </aside>
    <%--所有标签 end--%>


    <%--最新评论 start--%>
    <aside id="recent_comments-2" class="widget recent_comments wow fadeInUp" data-wow-delay="0.3s"><h3
            class="widget-title"><i class="fa fa-bars"></i>近期评论</h3>
        <div id="message" class="message-widget">
            <ul>
                <c:forEach items="${commentList}" var="r">
                <li style="border: none;">
                    <a href="/blog/${r.blog}/#anchor-comment-${r.id}"  rel="external nofollow">
                        <%--<img alt="" src="${r.commentAuthorAvatar}" class="avatar avatar-64 photo" height="64" width="64">--%>
                        <span class="comment_author">
                            <%--<strong>${r.commentAuthorName}</strong>--%>
                        </span>
                            ${r.content}
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--最新评论 end--%>

</div>



<%--博客主体-右侧侧边栏 end--%>
