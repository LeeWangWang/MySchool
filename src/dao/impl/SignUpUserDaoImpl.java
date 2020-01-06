package dao.impl;

import dao.SignUpUserDao;
import domain.SignUpUser;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 22:17
 * @Description:
 */
public class SignUpUserDaoImpl implements SignUpUserDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int findTotalCount(String className, String search) {
        String sql = "select count(*) from signupuser where 1 = 1 and concat (name,tele,sex,address,parentName,parentTele) like ? ";
        search = "%"+search+"%";
        if ("所有课程".equals(className)){
            System.out.println(sql + " " + className + " " + search);
            return template.queryForObject(sql, Integer.class, search);
        }else {
            sql += " and coursesName = ? ";
            System.out.println(sql + " " + className + " " + search);
            return template.queryForObject(sql, Integer.class, search, className);
        }
    }

    @Override
    public List<SignUpUser> findByPage(String className, int start, int pageSize, String search) {
        //1.定义sql模板
        String sql = "select * from signupuser where 1 = 1 ";
        search = "%"+search+"%";
        if ("所有课程".equals(className)){
            sql += " and concat(name,tele,sex,address,parentName,parentTele) like ?  limit ? , ? ";
            System.out.println(sql + " " +search + " " + start + " " + pageSize);
            return template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class), search, start, pageSize);
        }else {
            sql += " and coursesName = ?  and concat(name,tele,sex,address,parentName,parentTele) like ?  limit ? , ? ";
            System.out.println(sql + className + " " + search + " " + start + " " + pageSize);
            return template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class), className, search, start, pageSize);
        }
    }

    @Override
    public List<SignUpUser> findStudentByClassAndSearch(String className, String search) {
        String sql = "select * from signupuser where 1 = 1 and concat(name,tele,age,sex,address,parentName,parentTele) like ? ";
        search = "%"+search+"%";
        if ("所有课程".equals(className)){
            return template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class), search);
        }
        sql += " and coursesName = ? ";
        return template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class), search, className);
    }
}
