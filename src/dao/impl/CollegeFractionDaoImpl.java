package dao.impl;

import dao.CollegeFractionDao;
import domain.CollegeFraction;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.List;

public class CollegeFractionDaoImpl implements CollegeFractionDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<CollegeFraction> selectCollegeFractionByCollegeId(int collegeId) throws Exception {
        String sql = "select collegefraction.collegeId,\n" +
                "collegefraction.year,\n" +
                "collegefraction.collegeWen,\n" +
                "collegefraction.collegeLi,\n" +
                "fractionalline.wen,\n" +
                "fractionalline.li from collegefraction,fractionalline \n" +
                "where (collegeId = \""+collegeId+"\" and fractionalline.`year`=collegefraction.`year`);";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<CollegeFraction>(CollegeFraction.class));
    }
}
