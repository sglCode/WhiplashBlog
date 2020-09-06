<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 公告列表
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/

        .layui-table {
            margin-top: 0;
        }

        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a href="/admin">首页</a>
          <a><cite>公告列表</cite></a>
        </span>
    </blockquote>


            <table class="layui-table" >
                <colgroup>
                    <col width="100">
                    <col width="400">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>标题</th>
                    <th>内容</th>
                    <th>操作</th>
                    <td>ID</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${notices}" var="c">

                    <tr>
                        <td>
                            <a href="/notice/${c.id}" target="_blank">${c.title}</a>
                        </td>
                        <td>
                                ${c.content}
                        </td>
                        <td>
                            <a href="/admin/notice/edit/${c.id}" class="layui-btn layui-btn-mini">编辑</a>
                            <a href="/admin/notice/delete/${c.id}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>
                        </td>
                        <td >${c.id}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>



</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="/WEB-INF/jsp/Admin/framework.jsp"%>
