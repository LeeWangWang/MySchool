package test;

import dao.SignUpUserDao;
import dao.impl.SignUpUserDaoImpl;
import domain.Admin;
import domain.PageBean;
import domain.SignUpUser;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import service.SignUpUserService;
import service.impl.SignUpUserServiceImpl;
import util.JDBCUtils;

import java.util.List;
import java.util.Map;

/**
 * @Author: 李旺旺
 * @Date: 2019/12/31 10:50
 * @Description:
 */
public class dbTest {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    private SignUpUserService signUpUserService = new SignUpUserServiceImpl();

    private SignUpUserDao signUpUserDao = new SignUpUserDaoImpl();

    @Test
    public void test1(){
        String sql =  "update admin set password = 12345 where account = 12345";
        int count = template.update(sql);
        System.out.println("test1: " + count);
    }

    @Test
    public void test2(){
        String sql =  "insert into admin (account,password) value (?,?)";
        int count = template.update(sql,"66666","66666");
        System.out.println("test2: " + count);
    }

    @Test
    public void test3(){
        String sql =  "delete from admin where account = ?";
        int count = template.update(sql,"66666");
        System.out.println("test3: " + count);
    }

    @Test
    public void test4(){
        String sql =  "select * from admin where account = ?";
        Map<String, Object> map = null;
        map = template.queryForMap(sql,"12345");
        System.out.println("test4: " + map);
    }

    @Test
    public void test5(){
        String sql =  "select * from admin";
        List<Map<String, Object>> list = template.queryForList(sql);
        System.out.println("test5: " + list);
    }

    @Test
    public void test6(){
        String sql =  "select * from admin";
        List<Admin> list = template.query(sql, new BeanPropertyRowMapper<Admin>(Admin.class));
        System.out.println("test6:");
        for (Admin admin : list) {
            System.out.println(admin);
        }
    }

    @Test
    public void test41(){
        String account = "12345";
        String password = "12345";
        Admin admin = null;
        try {
            //1.定义sql语句
            String sql = "select * from admin where account = ? and password = ?";
            //2.执行
            admin = template.queryForObject(sql,new BeanPropertyRowMapper<Admin>(Admin.class),account,password);
        }catch (Exception e){
            System.out.println("根据管理员账号和密码查询管理员信息错误");
            e.printStackTrace();
        }
        System.out.println("account:" + admin.getAccount() + "      password:" + admin.getPassword());
    }

    @Test
    public void test55(){
        String className = "计算机网络";
        List<SignUpUser> list = signUpUserService.findStudentByClassAndSearch(className, null);
        for(SignUpUser student:list){
            System.out.println(student);
        }
    }

    @Test
    public void test56(){
        String className = "所有课程";
        String search = "钱";
        List<SignUpUser> list = signUpUserService.findStudentByClassAndSearch(className, search);
        for(SignUpUser student:list){
            System.out.println(student);
        }
    }

    @Test
    public void test36(){
        String className = "所有课程";
        String search = "钱";
        int num = signUpUserDao.findTotalCount(className, search);
        System.out.println("总数" + num);
    }


    @Test
    public void test31(){
        String className = "所有课程";
        String search = "钱";
        int start = 5;
        int pagesize = 10;
        List<SignUpUser> list = signUpUserDao.findByPage(className, start, pagesize, search);
        for(SignUpUser student:list){
            System.out.println(student);
        }
    }

    @Test
    public void test21(){
        String className = "所有课程";
        String search = "";
        int start = 1;
        int pagesize = 10;
        PageBean<SignUpUser> pageDate =  signUpUserService.pageQuery(className, 1, 10, search);
        List<SignUpUser> list = pageDate.getList();
        for(SignUpUser student:list){
            System.out.println(student);
        }
    }


}
