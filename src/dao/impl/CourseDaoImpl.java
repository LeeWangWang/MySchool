package dao.impl;

import dao.CourseDao;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/5 11:51
 * @Description:
 */
public class CourseDaoImpl implements CourseDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<String> findAllClass() {
        String sql = "select coursesName from courses";
        return template.queryForList(sql, String.class);
    }


}
