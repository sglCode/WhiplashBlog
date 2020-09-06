<%--
    博客顶部部分
    包括：顶部菜单，主要菜单(包括搜索按钮)，面包屑
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--导航 start--%>
<header id="masthead" class="site-header">
    <%--顶部菜单 start--%>
    <nav id="top-header">
        <div class="top-nav">
            <div class="user-login">
                <c:choose>
                    <c:when test="${sessionScope.user==null}">
                        <a href="/login">登录</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/admin">进入后台</a>
                    </c:otherwise>
                </c:choose>

            </div>
            <div class="menu-topmenu-container">
                <ul id="menu-topmenu" class="top-menu">
                    <c:forEach items="${menuList}" var="m">
                        <li class="menu-item">
                        <c:if test="${m.menuLevel==1}">
                                <a href="${m.menuUrl}" >
                                    <i class="${m.menuIcon}"></i>
                                    <span class="font-text">${m.menuName}&nbsp;</span>&nbsp;
                                </a>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </nav><!-- #top-header -->
    <%--顶部菜单 end--%>

    <%--主要菜单 satrt--%>
    <div id="menu-box">
        <div id="top-menu">
                <span class="nav-search">
                    <i class="fa fa-search"></i>
                </span>
            <div class="logo-site"><h1 class="site-title">
                <a href="/" title="Whiplash博客">Whiplash博客</a>
            </h1>
                <p class="site-description">自学之路</p>
            </div><!-- .logo-site -->
            <div id="site-nav-wrap">
                <div id="sidr-close">
                    <a href="#sidr-close" class="toggle-sidr-close">×</a>
                </div>
                <nav id="site-nav" class="main-nav">
                    <a href="#sidr-main" id="navigation-toggle" class="bars">
                        <i class="fa fa-bars"></i>
                    </a>
                    <div class="menu-pcmenu-container">
                        <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">

                            <li>
                                <a href="/">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text">首页</span>
                                </a>
                            </li>

                            <li>
                                <a href="/blogType/Java">
                                    <i class="fa fa-coffee"></i>
                                    <span class="font-text">Java&nbsp;</span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="/blogType/Java/3" target="_blank">JavaSE</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/Java/4" target="_blank">多线程</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/Java/6" target="_blank">设计模式和反射</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/Java/7" target="_blank">JVM</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/Java/8" target="_blank">JavaWeb</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/Java/9" target="_blank">Java框架</a>
                                    </li>
                                </ul>
                            </li>
                            <li>

                            <li>
                                <a href="/blogType/cs">
                                    <i class="fa fa-cubes"></i>
                                    <span class="font-text">计算机科学&nbsp;</span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="/blogType/cs/18" target="_blank">数据结构和算法</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/cs/19" target="_blank">数据库</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/cs/20" target="_blank">计算机网络</a>
                                    </li>
                                </ul>
                            </li>

                            <li>
                                <a href="/blogType/tools">
                                    <i class="fa-snowflake-o fa"></i>
                                    <span class="font-text">常用技术&nbsp;</span>
                                </a>
                                <ul class="sub-menu">
                                    <li>
                                        <a href="/blogType/tools/21" target="_blank">消息服务</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/tools/22" target="_blank">缓存服务</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/tools/23" target="_blank">微服务</a>
                                    </li>
                                    <li>
                                        <a href="/blogType/tools/24" target="_blank">Docker</a>
                                    </li>

                                </ul>
                            </li>
                            <li>
                                <a href="https://leetcode.com/problemset/all">
                                    <i class="ssss"></i>
                                    <span class="font-text">LeetCode&nbsp;</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div><!-- #menu-box -->
    <%--主要菜单 satrt--%>

</header><!-- #masthead -->
<%--导航 end start--%>

<%--搜索框 start--%>
<div id="search-main">
    <div class="searchbar">
        <form method="get" id="searchform" action="/search" accept-charset="UTF-8">
            <span>
                <input type="text" value="" name="keyword" id="s" placeholder="输入搜索内容"required="">
                <button type="submit" id="searchsubmit">搜索</button>
            </span>
        </form>
    </div>
    <div class="clear"></div>
</div>
<%--搜索框 end--%>

<rapid:block name="breadcrumb"></rapid:block>