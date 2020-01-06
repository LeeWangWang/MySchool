package test;

import domain.SignUpUser;
import org.junit.Test;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import service.SignUpUserService;
import service.impl.SignUpUserServiceImpl;
import util.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 22:37
 * @Description:
 */
public class signupuserTest {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    private SignUpUserService signUpUserService = new SignUpUserServiceImpl();

    @Test
    public void test1(){
        String sql = "select * from signupuser";
        List<SignUpUser> list = template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class));
        for (int i = 0; i < list.size(); i++) {
            SignUpUser sign = list.get(i);
            System.out.println(sign);
        }
        System.out.println(list);
    }

    @Test
    public void test2(){
        List<SignUpUser> list = signUpUserService.findStudentByClassAndSearch(null, null);
        System.out.println(list);
        for (int i = 0; i < list.size(); i++) {
            SignUpUser sign = list.get(i);
            System.out.println(sign);
        }
    }

}
