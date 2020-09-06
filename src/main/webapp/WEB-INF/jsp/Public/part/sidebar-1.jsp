<%--
    一般用于正文侧边栏：
    包括 搜索，热评文章，所有标签，随机文章 等小工具
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

        <%--搜索框--%>
        <aside class="widget widget_search">
            <div class="searchbar">
                <form method="get" id="searchform1" action="/search">
                    <span> <input type="text" value="" name="keyword" id="s1" placeholder="输入搜索内容" required="">
                        <button type="submit" id="searchsubmit1">搜索</button>
                    </span>
                </form>
            </div>
            <div class="clear"></div>
        </aside>
        <%--搜索框--%>

        <%--热评文章 start--%>
        <aside class="widget hot_comment" >
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>热评文章
            </h3>
            <div id="hot_comment_widget">
                <ul>
                    <c:forEach items="${mostReplyBlog}" var="m">
                        <li>
                            <a href="/blog/${m.id}" rel="bookmark" title=" (${m.replyHit}条评论)">
                                    ${m.title}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--热评文章 end--%>

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


        <%--博客主体-右侧侧边栏-近期文章 end--%>

</div>
<%--博客主体-右侧侧边栏 end--%>