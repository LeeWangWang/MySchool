package dao.impl;

import dao.CategoryDao;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 19:33
 * @Description:
 */
public class CategoryDaoImpl implements CategoryDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<String> findAll() {
        String sql = "SELECT coursesName FROM courses";
        return template.queryForList(sql,String.class);
    }
}
