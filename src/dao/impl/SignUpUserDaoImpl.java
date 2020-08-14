package dao.impl;

import dao.SignUpUserDao;
import domain.SignUpUser;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.DBTool;
import util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    @Override
    public SignUpUser findOneStudent(String tele, String className) {
        String sql = "select * from signupuser where tele = ? and coursesName = ?";
        System.out.println(sql + "  "+ tele +"  " + className);
        return template.queryForObject(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class), tele, className);
    }

    @Override
    public SignUpUser updateStudent(SignUpUser signUpUser, String userTele, String className) {
        String name = signUpUser.getName();
        String tele = signUpUser.getTele();
        int age = signUpUser.getAge();
        String sex = signUpUser.getSex();
        String address = signUpUser.getAddress();
        String parentName = signUpUser.getParentName();
        String parentTele = signUpUser.getParentTele();
        String coursesName = signUpUser.getCoursesName();
        String sql = "update signupuser set name = ? , tele = ? , age = ? , sex = ? , address = ? " +
                    " , parentName = ? , parentTele = ? , coursesName = ? where tele = ? and coursesName = ?";
        int num = template.update(sql, name, tele, age, sex, address, parentName, parentTele, coursesName, userTele,  className);
        if (num == 1){
            SignUpUser student = findOneStudent(tele, coursesName);
            return student;
        }else {
            return null;
        }
    }

    @Override
    public void deleteStudent(String tele, String coursesName) {
        String sql = "delete from signupuser where tele = ? and coursesName = ?";
        System.out.println(sql + " " + tele + " " + coursesName);
        int num = template.update(sql, tele, coursesName);
        if (num == 1){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
    }
    @Override
    public Boolean signUp(SignUpUser signUpUser) {
        boolean flag = false;
        if (!(signUpUser.getCoursesName().equals("<--选择课程-->"))){
            try {
                Connection conn = DBTool.getConnection();
                String sql = "insert into signupuser(name,tele,age,sex,address,parentName,parentTele,coursesName) values ('" + signUpUser.getName() + "','"
                        + signUpUser.getTele() + "','" + signUpUser.getAge() + "','" + signUpUser.getSex() + "','" + signUpUser.getAddress() + "','" + signUpUser.getParentName() + "','" + signUpUser.getParentTele() + "','" + signUpUser.getCoursesName() +"')";
                PreparedStatement pst = conn.prepareStatement(sql);
                int result = pst.executeUpdate(sql);
                if (result == 1) {
                    flag = true;
                }
                pst.close();
                return flag;
            } catch (SQLException e) {
                e.printStackTrace();
                return flag;
            }
        }
        return flag;

    }

    @Override
    public SignUpUser findSignUpCourses(String name, String signUpCourses) {
        try {
            SignUpUser signUpUser = null;
            Connection conn = DBTool.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from signupuser where name=? and coursesName=?");
            pst.setString(1,name);
            pst.setString(2,signUpCourses);
            ResultSet rs;
            rs = pst.executeQuery();
            if(rs.next()) {
                String name1 = rs.getString(1);
                String tele = rs.getString(2);
                int age = rs.getInt(3);
                String sex = rs.getString(4);
                String address = rs.getString(5);
                String parentName = rs.getString(6);
                String parentTele = rs.getString(7);
                String coursesName = rs.getString(8);
                signUpUser = new SignUpUser(name1, tele, age, sex, address, parentName, parentTele, coursesName);
            }
            rs.close();
            pst.close();
            return signUpUser;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public SignUpUser isSignUp(String userName) {
        try {
            SignUpUser signUpUser = null;
            Connection conn = DBTool.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from signupuser where name=?");
            pst.setString(1,userName);
            ResultSet rs;
            rs = pst.executeQuery();
            if(rs.next()) {
                String name = rs.getString(1);
                String tele = rs.getString(2);
                int age = rs.getInt(3);
                String sex = rs.getString(4);
                String address = rs.getString(5);
                String parentName = rs.getString(6);
                String parentTele = rs.getString(7);
                String coursesName = rs.getString(8);
                signUpUser = new SignUpUser(name, tele, age, sex, address, parentName, parentTele, coursesName);
            }
            rs.close();
            pst.close();
            return signUpUser;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
