<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
  - 分类列表
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
              <a href="/WEB-INF/jsp/index.jsp">首页</a>
              <a href="/admin/category">分类列表</a>
              <a><cite>添加分类</cite></a>
        </span>
  </blockquote>
  <div class="layui-row">
    <div class="layui-col-md4">
      <form class="layui-form"  method="post" id="myForm" action="/admin/blogType/update">
        <div class="layui-form-item">
          <div class="layui-input-block">
            <strong>修改名称</strong>
          </div>
          <div class="layui-input-block">
            名称 <span style="color: #FF5722; ">*</span>
            <input type="text" name="typeName" value=${blogType.typeName} class="layui-input" required>
          </div>
          <input type="hidden" name="id" value=${blogType.id}>
          <%--<br>--%>
          <%--<div class="layui-input-block">--%>
            <%--父节点 <span style="color: #FF5722; ">*</span>--%>
            <%--<select name="categoryPid" class="layui-input" required>--%>
              <%--<option value="0">无</option>--%>
              <%--<c:forEach items="${categoryList}" var="c">--%>
                <%--<c:if test="${c.categoryPid==0}">--%>
                  <%--<option value="${c.categoryId}">${c.categoryName}</option>--%>
                <%--</c:if>--%>
              <%--</c:forEach>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<br>--%>
          <%--<div class="layui-input-block">--%>
            <%--分类描述--%>
            <%--<input type="text" name="categoryDescription" placeholder=${请输入} autocomplete="off" class="layui-input" >--%>
          <%--</div>--%>
          <%--<br>--%>
          <%--<div class="layui-input-block">--%>
            <%--图标样式--%>
            <%--<input type="text" name="categoryIcon" placeholder="请输入图标样式,如 fa fa-coffee" autocomplete="off" class="layui-input" >--%>
          <%--</div>--%>
          <%--<br>--%>
          <div class="layui-input-block">
            <button class="layui-btn"  lay-filter="formDemo" type="submit">保存</button>
          </div>
        </div>
      </form>
    </div>
    <div class="layui-col-md8" >
      <table class="layui-table" >
        <colgroup>
          <col width="300">
          <col width="100">
          <col width="100">
          <col width="100">
          <col width="50">
          <col width="50">
        </colgroup>
        <thead>
        <tr>
          <th>博客类型</th>
          <th>相关博客数量</th>
          <th>操作</th>
          <th>序号</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${blogTypes}" var="c">
          <%--<c:if test="${c.categoryPid==0}">--%>
          <tr>
            <td>
              <a href="/blogType/${c.orderNo}" target="_blank">${c.typeName}</a>
            </td>
            <td>
              <a href="/blogTypey/${c.orderNo}" target="_blank">NaN</a>
            </td>
            <td>
              <a href="/admin/blogType/edit/${c.orderNo}" class="layui-btn layui-btn-mini">编辑</a>
              <a href="/admin/blogType/delete/${c.orderNo}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>
            </td>
            <td>${c.orderNo}</td>
          </tr>
          <%--<c:forEach items="${categoryList}" var="c2">--%>
          <%--<c:if test="${c2.categoryPid==c.categoryId}">--%>
          <%--<tr>--%>
          <%--<td>--%>
          <%--<a href="/category/${c2.categoryId}" target="_blank">——${c2.categoryName}</a>--%>
          <%--</td>--%>
          <%--<td>--%>
          <%--<a href="/category/${c2.categoryId}" target="_blank">${c2.articleCount}</a>--%>
          <%--</td>--%>
          <%--<td>--%>
          <%--<a href="/admin/category/edit/${c2.categoryId}" class="layui-btn layui-btn-mini">编辑</a>--%>
          <%--<c:if test="${c2.articleCount==0}">--%>
          <%--<a href="/admin/category/delete/${c2.categoryId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a>--%>
          <%--</c:if>--%>
          <%--</td>--%>
          <%--<td class="cate-parent">${c2.categoryId}</td>--%>
          <%--<td>${c2.categoryPid}</td>--%>
          <%--</tr>--%>
          <%--</c:if>--%>
          <%--</c:forEach>--%>
          <%--</c:if>--%>


        </c:forEach>
        </tbody>
      </table>
      <blockquote class="layui-elem-quote layui-quote-nm">
        温馨提示：
        <ul>
          <li>共有${total}个博客类型</li>
        </ul>
      </blockquote>
    </div>
  </div>






</rapid:override>
<rapid:override name="footer-script">

</rapid:override>

<%@ include file="/WEB-INF/jsp/Admin/BlogType/framework.jsp"%>