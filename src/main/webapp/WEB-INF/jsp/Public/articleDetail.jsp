<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    <title>${blog.title}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/css/highlight.css">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <%--面包屑导航 start--%>
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>首页
        </a>
        <c:choose>
            <c:when test="${blog.blogType != null}">
                <%--<c:forEach items="${blog}" var="c">--%>
                    <i class="fa fa-angle-right"></i>
                    <a href="/blogType/${blog.blogType.id}">
                            ${blog.blogType.typeName}
                    </a>
                <%--</c:forEach>--%>
            </c:when>

        </c:choose>
        <i class="fa fa-angle-right"></i>
        正文
    </nav>
    <%--面包屑导航 end--%>
</rapid:override>


<rapid:override name="left">
    <%--博客主体-左侧文章正文 start--%>
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post" id="articleDetail" data-id="${blog.id}">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${blog.title}
                    </h1>
                </header><!-- .entry-header -->
                <div class="entry-content">
                    <div class="single-content">
                            ${blog.content}
                    </div>

                    <div class="clear"></div>
                    <div id="social">
                        <div class="social-main">
                            <span class="like">
                                <a href="javascript:;" data-action="ding" data-id="1" title="点赞"
                                   class="favorite" onclick="increaseLikeCount()">
                                    <i class="fa fa-thumbs-up"></i>赞
                                    <i class="count"
                                       id="count-${blog.id}">${article.clickHit}</i>
                                </a>
                            </span>
                            <%--<div class="shang-p">--%>
                                <%--<div class="shang-empty"><span></span></div>--%>

                            <%--</div>--%>
                            <div class="share-sd">
                                        <span class="share-s" style="margin-top: 25px!important;">
                                            <a href="javascript:void(0)" id="share-s" title="分享">
                                                <i class="fa fa-share-alt"></i>分享
                                            </a>
                                        </span>
                                <div id="share">
                                    <ul class="bdsharebuttonbox bdshare-button-style1-16" data-bd-bind="1503997585792">
                                        <li><a title="  更多" class="bds_more fa fa-plus-square" data-cmd="more"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到QQ空间" class="fa fa-qq" data-cmd="qzone" onclick="return false;"
                                               href="#"></a></li>
                                        <li><a title="分享到新浪微博" class="fa fa-weibo" data-cmd="tsina"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到腾讯微博" class="fa fa-pinterest-square" data-cmd="tqq"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到人人网" class="fa fa-renren" data-cmd="renren"
                                               onclick="return false;" href="#"></a></li>
                                        <li><a title="分享到微信" class="fa fa-weixin" data-cmd="weixin"
                                               onclick="return false;" href="#"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <c:if test="${sessionScope.user!=null}">
                                <li class="edit-link">
                                    <a target="_blank" class="post-edit-link"
                                       href="/admin/article/edit/${blog.id}">编辑</a>
                                </li>
                            </c:if>
                            <li class="comment">
                                <a href="/article/${blog.id}#comments"
                                   rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <i class="comment-count">${commentList.size()}</i>
                                </a>
                            </li>
                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${blog.clickHit}</span>
                                views
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="侧边栏">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">所属分类：

                                    <a href="/blogType/${blog.blogType.id}">
                                            ${blog.blogType.typeName}
                                    </a>

                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article><!-- #post -->


                <%--版权声明 start--%>
            <div class="authorbio wow fadeInUp">

                <ul class="postinfo">
                    <li></li>
                    <li><strong>版权声明：</strong>本站原创文章，于<fmt:formatDate
                            value="${blog.releaseDate}"
                            pattern="yyyy-MM-dd"/>
                        <%--<strong>--%>
                                <%--${article.user.userNickname}--%>
                        <%--</strong>--%>
                        发表。
                    </li>
                    <li class="reprinted"><strong>转载请注明。</strong>

                    </li>
                </ul>
                <div class="clear"></div>
            </div>
                <%--版权声明 end--%>

                <%--相关文章 start--%>
            <div id="single-widget">
                <div class="wow fadeInUp" data-wow-delay="0.3s">
                    <aside id="related_post-2" class="widget">
                        <h3 class="widget-title">
                            <span class="s-icon"></span>相关文章
                        </h3>
                        <div id="related_post_widget">
                            <ul>
                                <c:forEach items="${similarBlogList}" var="s">
                                    <li>
                                        <a href="/blog/${s.id}">${s.title}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 start--%>
                    <aside id="hot_post-8" class="widget hot_post">
                        <h3 class="widget-title"><span class="s-icon"></span>猜你喜欢</h3>
                        <div id="hot_post_widget">
                            <ul>
                                <c:forEach items="${mostClickHitBlog}" var="m">
                                    <li>
                                        <a href="/blog/${m.id}">
                                                ${m.title}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="clear"></div>
                    </aside>
                        <%--猜你喜欢 end--%>
                </div>
                <div class="clear"></div>
            </div>
                <%--相关文章 end--%>


                <%--评论区域 start--%>
            <div class="scroll-comments"></div>
            <div id="comments" class="comments-area">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title"><span id="reply-title-word">发表评论</span>
                        <a rel="nofollow" id="cancel-comment-reply-link"
                           href="/blog/${blog.id}#respond"
                           style="">取消回复</a>
                    </h3>
                    <form id="comment_form" method="post" action="/blog/${blog.id}/addComment">
                        <c:if test="${sessionScope.user!=null}">
                            <div class="user_avatar">

                                登录者：${sessionScope.user.username}

                                <input type="hidden" name="blogId" value="${blog.id}">
                                <input type="hidden" name="username"
                                       value="${sessionScope.user.getUsername()}">

                            </div>
                        </c:if>
                        <p class="comment-form-comment">
                            <textarea id="comment" name="content" rows="4" tabindex="1" required></textarea>
                        </p>
                        <div id="comment-author-info">
                            <input type="hidden" name="commentPid" value="0">
                            <input type="hidden" name="commentPname" value="">
                            <c:if test="${sessionScope.user == null}">

                                <p class="comment-form-author">
                                    <label for="nickName1">
                                        昵称<span class="required">*</span>
                                    </label>
                                    <input type="text" name="nickName" id="nickName1" class="" value=""
                                           tabindex="2" required>
                                </p>

                            </c:if>
                            <c:if test="${sessionScope.user != null}">

                                <p class="comment-form-author">
                                    <%--<label for="nickName2">--%>
                                        <%--昵称<span class="required">*</span>--%>
                                    <%--</label>--%>
                                    <input type="hidden" name="nickName" id="nickName2" class="" value="${sessionScope.user.username}"
                                           tabindex="2" required>
                                </p>

                            </c:if>
                        </div>
                        <div class="clear"></div>
                        <p class="form-submit">
                            <input id="submit" name="submit" type="submit" tabindex="5" value="提交评论">
                            <input type="hidden" name="id"
                                   value="${blog.id}" id="id">
                            <input type="hidden" name="commentPid" id="comment_pid" value="0">
                        </p>
                    </form>
                </div>

                <ol class="comment-list">
                    <c:set var="floor" value="0"/>
                    <c:forEach items="${commentList}" var="c">
                        <%--<c:if test="${c.commentPid == 0}">--%>
                            <c:set var="floor" value="${floor + 1}"/>
                            <li class="comments-anchor">
                                <ul id="anchor-comment-${c.id}"></ul>
                            </li>
                            <li class="comment">
                                <div id="div-comment-${c.id}" class="comment-body">
                                    <div class="comment-author vcard">

                                        <strong>${c.nickName} </strong>

                                        <span class="comment-meta commentmetadata">
                                            <span class="ua-info" style="display: inline;">
                                                <br>
                                                <span class="comment-aux">

                                                    <fmt:formatDate value="${c.commentDate}"
                                                                    pattern="yyyy年MM月dd日 HH:mm:ss"/>&nbsp;
                                                    <c:if test="${sessionScope.user != null}">
                                                        <a href="javascript:void(0)"
                                                           onclick="deleteComment(${c.id})">删除</a>
                                                        <a class="comment-edit-link"
                                                           href="/admin/comment/edit/${c.id}"
                                                           target="_blank">编辑</a>
                                                    </c:if>
                                                    <span class="floor"> &nbsp;${floor}楼 </span>
                                                </span>
                                            </span>
                                        </span>
                                        <p>

                                                ${c.content}
                                        </p>
                                    </div>
                                </div>

                            </li>
                        <%--</c:if>--%>
                    </c:forEach>
                </ol>
            </div>
                <%--评论框 end--%>

        </main>
        <!-- .site-main -->
    </div>
    <%--博客主体-左侧文章正文end--%>
</rapid:override>


<%--侧边栏 start--%>
<rapid:override name="right">
    <%@include file="part/sidebar-1.jsp" %>
</rapid:override>
<%--侧边栏 end--%>

<rapid:override name="footer-script">
    <script src="/js/jquery.cookie.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            if ($('#author_name').val() == '') {
                var author = localStorage.getItem("author");
                $("#author_name").val(author == 'undefined' ? '' : author);
            }
            if ($('#author_email').val() == '') {
                var email = localStorage.getItem("email");
                $("#author_email").val(email == 'undefined' ? '' : email);
            }
            if ($('#author_url').val() == '') {
                var url = localStorage.getItem("url");
                $("#author_url").val(url == 'undefined' ? '' : url);
            }
        });

        var articleId = $("#articleDetail").attr("data-id");
        increaseViewCount(articleId);
        layui.code({
            elem: 'pre',//默认值为.layui-code
            // skin: 'notepad', //如果要默认风格，不用设定该key。
            about: false
        });

    </script>

</rapid:override>


<%@ include file="/WEB-INF/jsp/Public/part/framework.jsp" %>