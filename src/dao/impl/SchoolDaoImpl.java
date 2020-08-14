package dao.impl;

import dao.SchoolDaoInterface;
import domain.School;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/8 20:03
 * @Description:
 */
public class SchoolDaoImpl implements SchoolDaoInterface {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public School findSchool() {
        String sql = "select * from school;";
        return template.queryForObject(sql,new BeanPropertyRowMapper<School>(School.class));
    }

    @Override
    public Boolean updateSchool(School school) {
        String sql = "update signupuser set name = ? , location = ? , introduce = ?";
        int num = template.update(sql, school.getName(), school.getLocation(), school.getIntroduce());
        if (num == 1){
            return true;
        }else {
            return false;
        }
    }
}
