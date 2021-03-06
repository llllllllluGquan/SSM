<%@ page import="com.github.pagehelper.PageInfo" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/8/24
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page pageEncoding="utf-8" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
        System.out.println(request.getContextPath());

    %>
    <%--web路径
        不以/开始的相对路径，找资源，以当前资源的路径为基础，经常容易出问题
        以/开始的相对路径，找资源，以服务器的路径为标准：
                    http://localhost:3306/crud(项目路径)
    --%>
    <%--引入jQuery--%>
    <script type="text/javascript" src="/ssm_crud_war/static/js/jquery-3.5.1.min.js"></script>
    <%--引入样式--%>
    <link href="/ssm_crud_war/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<%--引入js文件--%>
    <script src="/ssm_crud_war/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
    <!-- 员工修改的模态框 -->
    <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static" id="empName_update_static"></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" id="email_update_input" placeholder="email@163.com">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <%--&lt;%&ndash;部门提交部门id即可&ndash;%&gt;--%>
                                <select class="form-control" name="dId" id="dept_update _select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                </div>
            </div>
        </div>
    </div>

     <!-- 员工添加的模态框 -->
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">添加员工</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="empName">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="email" id="email_add_input" placeholder="email@163.com">
                                <span  class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <%--&lt;%&ndash;部门提交部门id即可&ndash;%&gt;--%>
                                <select class="form-control" name="dId" id="dept_add_select">
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>

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
                <button id="emp_add_modal_btn" class="btn btn-primary " >新增</button>
                <button class="btn btn-danger btn-sm" id="emp_delete_modal_btn">删除</button>
            </div>
        </div>
        <%--显示表格数据--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>
                                <input type="checkbox" id="check_all"/>
                            </th>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>

                </table>
            </div>
        </div>
        <%--显示分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6" id="page_info">

            </div>
            <%--分页条--%>
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
    <script type="text/javascript">

        var totalRecord,currentPage;
        //1. 页面加载完成以后，直接去发送一个ajax请求,要到分页数据
        $(function () {
            //去首页
            to_page(1);
        });

        function to_page(PageNum){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"PageNum="+PageNum,
                type:"get",
                success:function (result) {
                    //console.log(result)
                    //1.解析并显示员工数据
                    build_emps_table(result);
                    //2.解析并显示分页信息
                    build_page_info(result);
                    //3.显示分页条信息
                    build_page_nav(result);
                }
            });
        }

        function build_emps_table(result){
            //清空table表格#emps_table tbody
            $("#emps_table tbody").empty();
            var emps = result.extend.PageInfo.list;
            $.each(emps,function (index,item) {
                //alert(item.empName);
                var checkBoxTd = $("<td><input type='checkbox' class='check_item'></input></td>");
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd = $("<td></td>").append(item.empName);
                var genderTd = $("<td></td>").append(item.gender == 'M'?"男":"女");
                var emailTd = $("<td></td>").append(item.email);
                var deptNameTd = $("<td></td>").append(item.department.deptName);
                var editBtn = $("<button>编辑</button>").addClass("btn btn-primary btn-sm edit_btn")
                                .append("<span></span>").addClass("glyphicon glyphicon-pencil btn-xs");
                //为编辑按钮添加一个自定义的属性，表示当前员工id
                editBtn.attr("edit-id",item.empId);
                var delBtn = $("<button>删除</button>").addClass("btn btn-danger btn-sm delete_btn")
                                .append("<span></span>").addClass("glyphicon glyphicon-trash btn-xs");
                //为删除按钮添加一个自定义的属性，表示当前员工id
                delBtn.attr("del-id",item.empId);
                var btnTd = $("<td></td>").append(editBtn).append("  ").append(delBtn);
                //append方法执行完成以后还是返回原来的元素
                $("<tr></tr>").append(checkBoxTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }
        //解析显示分页条,点击分页要能去下一页
        function build_page_nav(result){
            //page_nav_area
            $("#page_nav_area").empty();
            var ul = $("<ul></ul>").addClass("pagination");
            //构建元素
            var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if(result.extend.PageInfo.hasPreviousPage == false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                //为元素添加点击翻页的事件
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.extend.PageInfo.pageNum - 1);
                });
            }
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            if(result.extend.PageInfo.hasNextPage == false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else {
                //为元素添加点击翻页的事件
                nextPageLi.click(function () {
                    to_page(result.extend.PageInfo.pageNum + 1);
                });
                lastPageLi.click(function () {
                    to_page(result.extend.PageInfo.pages);
                });
            }
            //添加首页和前一页的提示
            ul.append(firstPageLi).append(prePageLi);
            //1 2, 345
            $.each(result.extend.PageInfo.navigatepageNums,function (index,item){

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                if(result.extend.PageInfo.pageNum == item){
                    numLi.addClass("active");
                }
                numLi.click(function () {
                   to_page(item);
                });
                ul.append(numLi);
            });
            //添加下一页何尾页的提示
            ul.append(nextPageLi).append(lastPageLi);
            //把ul加入到nav中
            var navEle = $("<nav></nav>").append(ul).appendTo("#page_nav_area");
        }
        //解析显示分页信息
        function build_page_info(result){
            $("#page_info").empty();

            $("#page_info").append("当前"+result.extend.PageInfo.pageNum+"页，总"+
                result.extend.PageInfo.pages+"页,总"+
                result.extend.PageInfo.total+"条记录");
            totalRecord = result.extend.PageInfo.total;
            currentPage = result.extend.PageInfo.pageNum;
        }

        //清空表单样式内容
        function  reset_form(ele){
            $(ele)[0].reset();
            //清空表单样式
            $(ele).find("*").removeClass("has-error has-success");
            $(ele).find(".help-block").text("");

        }
        //点击新增按钮弹出模态框。
        $("#emp_add_modal_btn").click(function () {
            //清除表单数据
            reset_form("#empAddModal form");
            $("#empAddModal form")[0].reset();
            //发送ajax请求，查处部门信息，显示在下拉列表中
            getDepts("#empAddModal select")
            //alert("hahah")
            //弹出模态框
            $("#empAddModal").modal({
                backdrop:"static"
            });
        });

        //获取部门信息并显示在下拉列表
        function getDepts(ele){
            //清空之前下拉列表的值
            $(ele).empty();
            $.ajax({
               url:"${APP_PATH}/depts",
               type: "get",
               success:function (result) {
                   //console.log(result)
                   //显示部门信息
                   $.each(result.extend.depts,function (){
                      var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                      optionEle.appendTo(ele)
                   });
               }
            });
        }

        //校验表单
        function validate_add_form(){
            //1.拿到要校验的数据，使用正则表达式
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if(!regName.test(empName)){
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合")
                show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else{
                show_validate_msg("#empName_add_input","success","");
            }
            //2.校验邮箱信息email_add_input、
            var email = $("#email_add_input").val();
            var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                show_validate_msg("#email_add_input","error","邮箱格式不正确")
                return false;
            }else {
                show_validate_msg("#email_add_input","success","")
            }
            return true;
        }

        //显示校验结果的提示
        function show_validate_msg(ele,status,msg){
            //应该清空这个元素之前的样式
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success" == status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else {
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        //校验用户名是否可用
        $("#empName_add_input").change(function () {

            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+this.value,
                type:"POST",
                success:function (result){
                    if(result.code == 100){
                        show_validate_msg("#empName_add_input","success","用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success")
                    }else{
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error")

                    }
                }

            });
        });

        //点击保存，保存员工
        $("#emp_save_btn").click(function () {
           //1.将模态框中填写的表单数据提交到服务器保存
            //1.先校验
            if(!validate_add_form()){
                return false;
            }
            //2.判断之前的ajax用户名校验是否成功。如果成功
            if($(this).arrt("ajax-va") == "error"){
                return false;
            }
            //2.发送ajax请求保存员工
            $.ajax({
               url:"${APP_PATH}/emp",
               type:"POST",
               data:$("#empAddModal form").serialize(),
               success:function (result){
                   //alert(result.msg);
                   if (result.code == 100){
                       //员工保存成功：1.关闭模态框 2.到最后一页显示刚才保存的数据(发送ajax请求)
                       $("#empAddModal").modal('hide');
                       to_page(totalRecord)
                   }else {
                      //显示失败信息，有哪个字段的错误信息就显示哪个字段
                      if(undefined != result.extend.errorFields.email){
                          //显示邮箱错误信息
                          show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                      }
                      if(undefined != result.extend.errorFields.empName){
                          //显示员工名字的错误信息
                          show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                      }
                   }
               }
            });
        });


        //1.我们是按钮创建之前就绑定了click，所以绑定不上。
        //解决方案：1）可以在创建按钮的时候绑定。 2）绑定点击.live()
        //jquery新版没有live，使用on进行替代
        $(document).on("click",".edit_btn",function () {
            //1.查处部门信息，并显示部门列表
            getDepts("#empUpdateModal select");
            //2查处员工信息，显示员工信息
            getEmp($(this).attr("edit-id"));
            //3.把员工id传递给模态框的更新按钮
            $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#empUpdateModal").modal({
                backdrop:"static"
            });
        });
        function getEmp(id){
            $.ajax({
               url:"${APP_PATH}/emp/"+id,
                type:"get",
                success:function (result) {
                   var empData = result.extend.emp;
                   $("#empName_update_static").text(empData.empName);
                   $("#email_update_input").val(empData.email);
                   $("#empUpdateModal input[name = gender]").val([empData.gender]);
                   $("#empUpdateModal select").val([empData.dId]);
                }
            });
        }

        //更新按钮绑定事件,点击更新，更新员工。
        $("#emp_update_btn").click(function () {
            //验证邮箱是否合法
            var email = $("#email_update_input").val();
            var regEmail =/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if(!regEmail.test(email)){
                //alert("邮箱格式不正确");
                show_validate_msg("#email_update_input","error","邮箱格式不正确")
                return false;
            }else {
                show_validate_msg("#email_update_input","success","")
            }
            //2.发送ajax请求保存更新员工数据
            $.ajax({
               url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
               type:"POST",
                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                success:function (result) {
                   //1.关闭对话框
                    $("#empUpdateModal").modal("hide");
                    //2.回到本页面
                    to_page(currentPage);
                }
            });
        });

        //单个删除
        $(document).on("click",".delete_btn",function () {
            //1.弹出是否确认删除对话框
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            if (confirm("确认删除【"+empName+"】吗？")){
                //确认删除，发送ajax请求删除
                $.ajax({
                   url:"${APP_PATH}/emp/"+$(this).attr("del-id"),
                   type:"DELETE",
                    success:function (result) {
                        alert(result.msg);
                        //回到本业
                        to_page(currentPage);
                    }
                });
            }
        });

        //完成全选、全不选功能
        $("#check_all").click(function () {
            //attr获取checked是undefined
            //我们这些dom原生的属性、attr获取自定义属性的值；
            //prop修改和读取dom原生属性的值
            $(".check_item").prop("checked", $(this).prop("checked"));
        });

        //check_item
        $(document).on("click",".check_item",function () {
            //判断当前选中的元素是否5个
            var flag = $(".check_item:checked").length == $(".check_item").length;
            $("#check_all").prop("checked",flag);
        });

        //点击全部删除，就批量删除
        $("#emp_delete_modal_btn").click(function () {
            var empName = "";
            var del_idstr = "";
            $.each($(".check_item:checked"),function () {
                //this
                empName += $(this).parents("tr").find("td:eq(2)").text()+"，";
                //组装员工id字符串
                del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
            });
            //去除最后一个逗号
            empName.substring(0,empName.length-1);
            del_idstr.substring(0,empName.length-1);
            if(confirm("确认删除【"+empName+"】吗？")){
                //发送ajax请求删除
                $.ajax({
                   url:"${APP_PATH}/emp/"+del_idstr,
                   type:"DELETE",
                   success:function (result) {
                       alert(result.msg);

                       //回到当前页面
                       to_page(currentPage);
                   }
                });

            }
        });
    </script>
</body>
</html>
