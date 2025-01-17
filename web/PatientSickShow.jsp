<%
    int UserID;
    if (request.getAttribute("UserID")!= null) {
        UserID = (int) (request.getAttribute("UserID"));
    } else {
        UserID = Integer.parseInt(request.getParameter("UserID"));
    }
%><%--
  Created by IntelliJ IDEA.
  User: ZhangYe
  Date: 2023/7/10
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="hospital.service.PatientService" %>
<%@ page import="hospital.user.Patient" %>
<%@ page import="java.util.List" %>
<%@ page import="hospital.dao.impl.HospitalDaoImpl" %>
<%@ page import="hospital.user.Hospital" %>
<%@ page import="hospital.user.Sick" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            /*background-color: white;*/
            margin: 0;
            padding: 20px;
        }
        a {
            text-decoration: none; /* 去掉下划线 */
            color: #000; /* 设置链接的颜色为黑色 */
            transition: color 0.3s; /* 添加过渡效果 */
        }

        h1 {
            color: #333333;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid white;
        }

        tr:nth-child(even) {
            background-color: #ffffff;
        }

        tr:nth-child(odd) {
            background-color: #f1f1f1;
        }

        tr:hover {
            background-color: #e6e6e6;
        }

        .navbar {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #e6e6e6;
        }

        .navbar li {
            float: left;
        }

        .navbar li a {
            display: block;
            color: black;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .navbar li a:hover {
            background-color: white;
        }

        form {
            position: relative; /* 相对定位 */
            top: 8px;
        }
    </style>

    <link rel="stylesheet" href="css/navbar.css">
    <script>
        function showMessage(message) {
            alert(message);
        }
    </script>

</head>
<body>

<h1>桂林市医院统一预约挂号服务平台</h1>
<div>
    <!-- 导航栏 -->
    <ul class="navbar">
        <li><a href="./PatientCenter.jsp?UserID=<%= UserID %>">首页</a></li>
        <li><a href="./PatientShow.jsp?UserID=<%= UserID %>">个人信息</a></li>
        <li><a href="./PatientSelectHospital.jsp?UserID=<%= UserID %>">预约挂号</a></li>
        <li><a href="./PatientSickShow.jsp?UserID=<%= UserID %>">查看挂号信息</a></li>
    </ul>
</div>


<div>
    <h1>挂号信息</h1>
    <%
        PatientService patientService = new PatientService();
        int patientId = Integer.parseInt(request.getParameter("UserID"));
        List<Sick> sickList = patientService.SickShow(patientId);
        assert sickList != null;
    %>
    <div>
        <table>
            <thead>
            <tr>
                <th>主治医生</th>
                <th>预约日期</th>
                <th>预约时间段</th>
                <th>医院名</th>
                <th>科室名</th>
                <th>预约状态</th>
                <th>支付状态</th>
                <th>支付金额</th>
                <th></th>
                <th></th>
                <th></th>

            </tr>
            </thead>
            <tbody>
            <%for (Sick s : sickList) {
            %>
            <tr>
                <td><%= s.getD_name() %></td>
                <td><%= s.getData() %></td>
                <td><%= s.getTime() %></td>
                <td><%= s.getHospitalname() %></td>
                <td><%= s.getDepartmentname() %></td>
                <td><%= s.getAppointmentstatus() %></td>
                <td><%= s.getPaymentstatus() %></td>
                <td><%= s.getPaymentamount() %></td>
                <td>
                    <form action="PatientSickDelete" method="POST">
                        <input type="hidden" name="UserID" value="<%= s.getPatientId() %>">
                        <input type="hidden" name="AppointmentID" value="<%= s.getId() %>">
                        <input type="submit" value="取消">
                    </form>
                </td>
                <td>
                    <form>
                        <a href="PatientSickUpdate.jsp?UserID=<%= s.getPatientId() %>&AppointmentID=<%= s.getId() %>">
                            <input type="button" value="修改" >
                        </a>
                    </form>
                </td>
                <td>
                    <form action="PatientSickPayment" method="POST">
                        <input type="hidden" name="UserID" value="<%= s.getPatientId() %>">
                        <input type="hidden" name="AppointmentID" value="<%= s.getId() %>">
                        <input type="submit" value="缴费" <%= s.getPaymentstatus().equals("已缴费") ? "disabled" : "" %>>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<%--</table>--%>
<%--<a href="PatientSickAdd.jsp?patientId=<%= patientId %>">--%>
<%--    <input type="button" value="新增挂号数据">--%>
<%--</a>--%>
<% if (request.getAttribute("Errormessage") != null) { %>
<script>
    showMessage("<%= request.getAttribute("Errormessage") %>");
</script>
<% } %>
</body>
</html>