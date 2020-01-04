package test;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 20:22
 * @Description:
 */
public class categoryTest {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Test
    public void test1(){
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
        System.out.println(ft.format(date));
        String sql = "SELECT coursesName FROM courses";
//        String sql = "SELECT * FROM courses";
        List<String> list = template.queryForList(sql,String.class);
        System.out.println(list);
        System.out.println(list.get(0) +"   "+list.get(2));
        for (int i = 0; i < list.size(); i++) {
            String coursesName = list.get(i);
            System.out.println(coursesName);
        }
    }

}
