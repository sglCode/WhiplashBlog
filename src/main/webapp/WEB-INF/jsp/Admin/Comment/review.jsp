<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%--<%@ page import="com.liuyanzhao.ssm.blog.util.MyUtils" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="title">
  - 评论列表
</rapid:override>
<rapid:override name="header-style">
  <style>
    /*覆盖 layui*/
    .layui-table {
      margin-top: 0;
    }
  </style>
</rapid:override>

<rapid:override name="content">
  <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">首页</a>
              <a><cite>评论列表</cite></a>
        </span>
  </blockquote>
  <div class="layui-tab layui-tab-card">
    <table class="layui-table" lay-even lay-skin="nob">
      <colgroup>
        <col width="150">
        <col width="200">
        <col width=250">
        <col width="220">
        <col width="200">
        <col width="50">
      </colgroup>
      <thead>
      <tr>
        <th>作者</th>
        <th>评论内容</th>
        <th>回复博客</th>
        <th>提交于</th>
        <th>审核操作</th>
        <th>ID</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${reviewList}" var="c">
        <tr>
          <td>
              <%--<strong>${c.commentAuthorName}</strong>--%>
            <br>
              ${c.userIp}
          </td>
          <td class="dashboard-comment-wrap">
              <%--<c:if test="${c.commentPid!=0}">--%>
              <%--<span class="at">@ </span><a href="${c.commentAuthorUrl}">${c.commentPname}</a>--%>
              <%--</c:if>--%>
              ${c.content}
            <div class="row-actions">

                            <span class="">
                                        <a href="/admin/comment/delete/${c.id}" onclick="deleteComment(${c.id})">删除</a>
                                     </span>
            </div>
          </td>
          <td>
            <a href="/article/${c.blog.title}"
               target="_blank">${c.blog.title}</a>
          </td>
          <td>
            <fmt:formatDate value="${c.commentDate}" pattern="yyyy年MM月dd日 HH:dd:ss"/>
          </td>

          <td>
            <a href="/comment/commentReview/${c.id}/1">通过</a>
            |
            <a href="/comment/commentReview/${c.id}/0">不通过</a>
          </td>

          <td>${c.id}</td>

        </tr>
      </c:forEach>
      </tbody>

    </table>

    <div id="nav" style="">
      <%@ include file="/WEB-INF/jsp/Public/part/paging.jsp" %>
    </div>
  </div>


</rapid:override>

<%@ include file="/WEB-INF/jsp/Admin/framework.jsp" %>
