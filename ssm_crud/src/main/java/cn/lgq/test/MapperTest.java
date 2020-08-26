package cn.lgq.test;

import cn.lgq.bean.Department;
import cn.lgq.bean.Employee;
import cn.lgq.dao.DepartmentMapper;
import cn.lgq.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.ContextConfiguration;

import java.util.UUID;

/**
 * 测试dao层工作
 * 推荐spring项目可以使用Spring的单元测试，可以自动注入我们需要的组件
 *
 * 1.导入spring的单元测试依赖  spring-test
 * 2. @ContextConfiguration指定spring配置文件的位置
 * 3. 直接使用autowired组件即可
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;
    /**
     * 测试department
     */
    @Test
    public void testCRUD(){
        /*原生的注释掉
        //1.创建Spring IOC 容器
        ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
        //2. 从容器中获取mapper
        DepartmentMapper bean = ac.getBean(DepartmentMapper.class);*/
        System.out.println(departmentMapper);

        //1.插入几个部门
        //ew Department();
        //departmentMapper.insertSelective(new Department(null,"开发部"));
        //departmentMapper.insertSelective(new Department(null,"测试部"));

        //2.生成员工数据
        //employeeMapper.insertSelective(new Employee(null,"Jerry","M","Jerry@163.com",2));

        //3.批量插入多个员工；批量，使用可以执行批量操作的sqlsession
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 100; i++){
            String uid = UUID.randomUUID().toString().substring(0,5) + i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@163.com",1));
        }
    }
}
