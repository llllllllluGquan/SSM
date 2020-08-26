package cn.lgq.controller;

import cn.lgq.bean.Employee;
import cn.lgq.bean.Msg;
import cn.lgq.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理员工crud请求
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    /**
     * 单个批量二合一删除
     * 批量删除：1-2-3-。。
     * 单个删除：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    public Msg deleteEmp(@PathVariable("ids") String ids){
        if (ids.contains("-")){
            List<Integer> list = new ArrayList<>();
            String[] id = ids.split("-");
            for (String s : id){
                list.add(Integer.parseInt(s));
            }
            employeeService.deleteBatch(list);
            return Msg.success();
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);
            return Msg.success();
        }
    }

    /**
     * 如果直接发送ajax=PUT形式的请求
     * 封装的数据全是null
     *
     * 问题：请求体中有数据
     * 但是employee封装补上
     * 原因：Tomcat：
     *      1.将请求体中的数据，封装一个map。
     *      2.request.getParameter("empName")就会从这个map中取值
     *      3.springmvc封装pojo对象的时候。会把pojo中每个属性的值，request。getParameter（“”）
     *Ajax发送put请求：
     *      put请求，请求体中的数据，request。getParameter（“”）拿不到
     *      Tomcat一看是put请求就不会封装请求体中的数据为map只有post行使的请求封装请求体
     *
     * 我们要能支持直接发送put之类的请求还要封装请求体中的数据
     * 配置上HttpPutFormContentFilter：将请求体重的数据解析包装成一个map。request被重新包装，request。getParameter（）被重写，就会从自己封装的map中取数据
     * 员工跟新
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){

        employeeService.updateEmp(employee);
        return Msg.success();
    }

    /**
     * 根据id查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){

        Employee employee = employeeService.getEmp(id);
        return Msg.success().add("emp",employee);
    }

    /**
     * 价差用户名是否重复
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkUser(@RequestParam("empName") String empName){
        //先判断用户名是否是合法的表达式；
         String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
         if(!empName.matches(regx)){
             return Msg.fail().add("va_msg","用户名可以是2-5位中文或者6-16位英文和数字的组合");
         }
         //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if (b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg","用户名不可用");
        }
    }

    /**
     * 员工保存
     * 1.支持JSR303校验
     * 2。导入Hibernate-validator
     * @param employee
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasErrors()){
            //校验失败，反悔失败，在模态框中显示失败的错误信息
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors){
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(),fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else{
            employeeService.saveEmp(employee);
            return Msg.success();
        }
    }

    /**
     * 导入jackson包。
     * @param PageNum
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "PageNum",defaultValue = "1") Integer PageNum){
        //这不是一个分页查询
        //引入pagehelper分页插件
        //在查询之前，只需要调用, 传入页码 以及每页的大小
        PageHelper.startPage(PageNum,5);
        //startpage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        //使用pageinfo包装查询后的结果，只需要将PageInfo交给页面就行了。它里面封装了详细的分页信息，包括有查询出来的数据
        PageInfo page = new PageInfo(emps,5);//连续显示5页
        return Msg.success().add("PageInfo",page);
    }

}
