<%@ page import="com.github.pagehelper.PageInfo" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/24
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page pageEncoding="utf-8" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
        System.out.println(request.getContextPath());

    %>
    <%--web路径
        不以/开始的相对路径，找资源，以当前资源的路径为基础，经常容易出问题
        以/开始的相对路径，找资源，以服务器的路径为标准：
                    http://localhost:3306/crud(项目路径)
    --%>
    <%--引入样式--%>
    <link href="/ssm_crud_war/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <%--引入js文件--%>
    <script src="/ssm_crud_war/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <%--引入jQuery--%>
    <script type="text/javascript" src="${APP_PATH}/ssm_crud_war/static/js/jquery-3.5.1.min.js"></script>
</head>
<body>

    <%--搭建显示页面--%>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>后台管理页面</h1>
            </div>
        </div>
            <%--按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary ">新增</button>
                <button class="btn btn-danger btn-sm">删除</button>
            </div>
        </div>
            <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${PageInfo.list}" var="emp">
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender=="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil btn-xs" aria-hidden="true"></span> 编辑
                                </button>
                                <button class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash btn-xs" aria-hidden="true"></span>删除
                                </button>
                            </th>
                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>
            <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前${PageInfo.pageNum}页，总${PageInfo.pages}页,总${PageInfo.total}条记录
            </div>
            <%--分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/emps?PageNum=1">首页</a></li>
                        <c:if test="${PageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?PageNum=${PageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${PageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == PageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != PageInfo.pageNum}">
                                <li><a href="${APP_PATH}/emps?PageNum=${page_Num}">${page_Num}</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${PageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?PageNum=${PageInfo.pageNum +1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${APP_PATH}/emps?PageNum=${PageInfo.pages}">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
