<%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/12
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增科室</title>
    <style>
        ul.navbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
            overflow: hidden;
        }

        ul.navbar li {
            float: left;
        }

        ul.navbar li a {
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        ul.navbar li a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<h1>桂林市医院统一预约挂号服务平台</h1>
<div>
    <!-- 导航栏 -->
    <ul class="navbar">
        <li><a href="./AdminCenter.jsp">首页</a></li>
        <li><a href="./AdminUsers.jsp">用户管理</a></li>
        <li><a href="./AdminHospitals.jsp">医院管理</a></li>
        <!-- 添加更多功能模块链接 -->
    </ul>
</div>
<div>
    <h1>新增科室</h1>
    <%
        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("hospitalId"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <div>
        <form action="AddDepartment" method="POST"> <!-- 替换 /updateHospital 为你想要处理更新请求的 URL -->
            <input type="hidden" name="hospitalId" value="<%=id%>">
            <label>科室名称:</label>
            <input type="text" name="name"><br><br>

            <label>科室负责人:</label>
            <input type="text" name="head"><br><br>

            <label>简介:</label>
            <textarea name="introduction"></textarea><br><br>

            <label>服务时间:</label>
            <input type="text" name="time"><br><br>

            <input type="submit" value="提交">
            <a href="./AdminDepartment.jsp" class="button">返回</a> <!-- 新增返回按钮 -->
        </form>
    </div>
</div>
</body>
</html>