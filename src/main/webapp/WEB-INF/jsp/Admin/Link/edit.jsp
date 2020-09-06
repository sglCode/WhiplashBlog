<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - 编辑链接
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
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
              <a href="/admin/link">链接列表</a>
              <a><cite>编辑链接</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form" method="post" id="myForm" action="/admin/link/editSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>编辑标签</strong>
                    </div>
                    <input type="hidden" name="id" value="${link.id}">
                    <div class="layui-input-block">
                        名称 <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkName" value="${link.linkName}" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        URL  <span style="color: #FF5722; ">*</span>
                        <input type="text" name="linkUrl" value="${link.linkUrl}" autocomplete="off" class="layui-input" required>
                    </div>

                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>

        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="50">
                    <col width="150">
                    <col width="200">
                    <col width="150">
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>
                    <th>名称</th>
                    <th>URL</th>

                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${links}" var="l">

                    <tr>
                        <td>${l.id}</td>
                        <td>
                            ${l.linkName}
                        </td>

                        <td>
                            ${l.linkUrl}
                        </td>
                        <td>
                            <a href="/admin/link/edit/${l.id}" class="layui-btn layui-btn-mini">编辑</a>
                            <a href="/admin/link/delete/${l.id}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="/WEB-INF/jsp/Admin/framework.jsp"%>