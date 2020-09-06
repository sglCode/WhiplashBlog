<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="title">
    - 文章列表
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
        }


    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a href="/admin">首页</a>
          <a><cite>文章列表</cite></a>
        </span>
    </blockquote>

    <div class="layui-tab layui-tab-card">
        <form id="articleForm" method="post">
            <input type="hidden" name="currentUrl" id="currentUrl" value="">
            <table class="layui-table">
                <colgroup>
                    <col width="300">
                    <col width="150">
                    <col width="100">
                    <col width="150">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>所属分类</th>
                    <th>状态</th>
                    <th>发布时间</th>
                    <th>操作</th>
                    <th>序号</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${blogs}" var="a">
                    <tr>
                        <td>
                            <a href="/blog/${a.id}"
                               target="_blank">
                                    ${a.title}

                            </a></td>
                        <td>
                            <%--<c:forEach items="${articleId}" var="c">--%>
                                <c:forEach items="c" var="x" >
                                    <a href="/blogtype/${c.id}">${c.blogtype.typeName}</a>

                                </c:forEach>
                            <%--</c:forEach>--%>
                           ${a.blogType.typeName}
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${a.state == 1}">
                                    <a href="/admin/article?state=1">
                                        <span style="color:#5FB878;">已发布</span>
                                </c:when>
                                <c:otherwise>
                                    <a href="/admin/article?state=0">
                                        <span style="color:#FF5722;">草稿</span>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <fmt:formatDate value="${a.releaseDate}"
                                            pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                        <td>
                            <a href="/admin/article/edit/${a.id}"
                               class="layui-btn layui-btn-mini">编辑</a>
                            <a href="/admin/article/delete/${a.id}"
                               onclick="deleteArticle(${a.id})"
                               class="layui-btn layui-btn-danger layui-btn-mini">删除</a>
                        </td>
                        <td>${a.id}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </form>
            <%@ include file="/WEB-INF/jsp/Admin/Blog/paging.jsp" %>
    </div>

</rapid:override>
<rapid:override name="footer-script">
    <script></script>
</rapid:override>
<%@ include file="/WEB-INF/jsp/Admin/framework.jsp" %>