package dao.impl;

import dao.TeacherDao;
import domain.Teacher;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/9 09:23
 * @Description:
 */
public class TeacherDaoImpl implements TeacherDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Teacher> findTeacher() {
        String sql = "select * from teacher";
        return template.query(sql, new BeanPropertyRowMapper<Teacher>(Teacher.class));
    }

    @Override
    public Boolean updateTeacher(int id, String name, String introduce) {
        String sql = "update teacher set name = ? , introduce = ? where id = ?";
        int num = template.update(sql, name, introduce, id);
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Teacher findOneTeacher(int id) {
        String sql = "select * from teacher where id = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<Teacher>(Teacher.class), id);
    }
}
