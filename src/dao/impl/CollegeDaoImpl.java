package dao.impl;

import dao.CollegeDao;
import domain.College;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import util.JDBCUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class CollegeDaoImpl implements CollegeDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<College> selectAllCollege() throws Exception {
        String sql = "select * from college";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class));
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) throws Exception {
        //1.定义模板初始化sql
        String sql = "select count(*) from college where 1 = 1 ";
        String otherValue;
        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {

            //排除分页条件参数
            if("currentPage".equals(key) || "pageSize".equals(key)||"selectByCriteria".equals(key)||"collegeIsNormal".equals(key)){
                continue;
            }
//            if("funcName".equals(key)||"servletName".equals(key)||"keys".equals(key)||"valuess".equals(key)){
            if("funcName".equals(key)||"servletName".equals(key)){
                System.out.println(key);
                continue;
            }
            if("keys".equals(key)){
                String keyV = condition.get(key)[0];
                if("selectByCriteria".equals(keyV)){
                    for (String key2 : keySet) {
                        if("valuess".equals(key2)){
                            sql = "select count(*) from college where 1 = 0 ";
                            sb = new StringBuilder(sql);
                            otherValue=condition.get(key2)[0];
                            sb.append(" or collegeName like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeLocation like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeMainType like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeStudyType like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            break;
                        }
                    }
                }
                if("collegeIsNormal".equals(keyV)){
                    sb.append(" and collegeIsDoubleTop like ? ");
                    params.add("%N%");//？条件的值
                    sb.append(" and collegeIs985 like ? ");
                    params.add("%N%");//？条件的值
                    sb.append(" and collegeIs211 like ? ");
                    params.add("%N%");//？条件的值
                }
                continue;
            }
            if("valuess".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            System.out.println(key+"**********"+value);
            //判断value是否有值
            if(value != null && !"".equals(value)&&!"collegeIsNormal".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        return jdbcTemplate.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<College> selectAllCollegePage(int start, int pageSize, Map<String, String[]> condition) throws Exception {
        String sql = "select * from college  where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        String otherKey;
        String otherValue;
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key) || "pageSize".equals(key)||"selectByCriteria".equals(key)||"collegeIsNormal".equals(key)){
                continue;
            }
//            if("funcName".equals(key)||"servletName".equals(key)||"keys".equals(key)||"valuess".equals(key)){
            if("funcName".equals(key)||"servletName".equals(key)){
                System.out.println(key);
                continue;
            }
            if("keys".equals(key)){
                String keyV = condition.get(key)[0];
                if("selectByCriteria".equals(keyV)){
                    for (String key2 : keySet) {
                        if("valuess".equals(key2)){
                            sql = "select * from college  where 1 = 0 ";
                            sb = new StringBuilder(sql);
                            otherValue=condition.get(key2)[0];
                            sb.append(" or collegeName like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeLocation like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeMainType like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            sb.append(" or collegeStudyType like ? ");
                            params.add("%"+otherValue+"%");//？条件的值
                            break;
                        }
                    }
                }
                if("collegeIsNormal".equals(keyV)){
                    sb.append(" and collegeIsDoubleTop like ? ");
                    params.add("%N%");//？条件的值
                    sb.append(" and collegeIs985 like ? ");
                    params.add("%N%");//？条件的值
                    sb.append(" and collegeIs211 like ? ");
                    params.add("%N%");//？条件的值
                }
                continue;
            }
            if("valuess".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)&&!"selectByCriteria".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(pageSize);
        sql = sb.toString();
        System.out.println(sql);
        System.out.println(params);
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),params.toArray());
    }

    @Override
    public List<College> selectCollegeByCriteria(int start, int pageSize, Map<String, String[]> condition) throws Exception {
        String sql = "select * from college  where 1 = 0 ";
        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            //排除分页条件参数
            if("currentPage".equals(key) || "pageSize".equals(key)){
                continue;
            }
            if("funcName".equals(key)||"servletName".equals(key)||"keys".equals(key)||"valuess".equals(key)){
                System.out.println(key);
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" or collegeName like ? ");
                params.add("%"+value+"%");//？条件的值
                sb.append(" or collegeLocation like ? ");
                params.add("%"+value+"%");//？条件的值
                sb.append(" or collegeStudyType like ? ");
                params.add("%"+value+"%");//？条件的值
                sb.append(" or collegeMainType like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(pageSize);
        sql = sb.toString();
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),params.toArray());
    }

    @Override
    public College selectCollegeById(int collegeId) throws Exception {
        String sql = "select * from college where collegeId = ?";
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<College>(College.class), collegeId);
    }

    @Override
    public List<College> selectCollegeByLocation(String location) throws Exception {
        String sql = "select * from college where collegeLocation = ?";
        System.out.println("*************这是Dao");
        System.out.println(location);
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),location);
    }

    @Override
    public List<College> selectCollegeByIsDoubleTop() throws Exception {
        String sql = "select * from college where collegeIsDoubleTop = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),"Y");
    }

    @Override
    public List<College> selectCollegeByIs985() throws Exception {
        String sql = "select * from college where collegeIs985 = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),"Y");
    }

    @Override
    public List<College> selectCollegeByIs211() throws Exception {
        String sql = "select * from college where collegeIs211 = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),"Y");
    }

    @Override
    public List<College> selectCollegeNormal() throws Exception {
        String sql = "select * from college where collegeIsDoubleTop = ? and collegeIs985 = ? and collegeIs211 = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),"N","N","N");
    }

    @Override
    public List<College> selectCollegeByMainType(String mainType) throws Exception {
        String sql = "select * from college where collegeMainType = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),mainType);
    }

    @Override
    public List<College> selectCollegeByStudyType(String studyType) throws Exception {
        String sql = "select * from college where collegeStudyType = ?";
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<College>(College.class),studyType);
    }

    @Override
    public List<String> selectLocations() throws Exception {
        String sql = "select DISTINCT collegeLocation from college";
        List<String> collegeLocation =  jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getString(1);
            }
        },null);
        return collegeLocation;
    }

    @Override
    public List<String> selectMainType() throws Exception {
        String sql = "select DISTINCT collegeStudyType from college";
        List<String> collegeMainType =  jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getString(1);
            }
        },null);
        return collegeMainType;
    }

    @Override
    public int addCollege(String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) throws Exception {
        String sql = "INSERT INTO college (collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction) VALUES (?,?,?,?,?,?,?,?,?); ";
        int count = jdbcTemplate.update(sql,collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction);
        return count;
    }

    @Override
    public int updateCollege(int collegeId,String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) throws Exception {
        String sql = "update college set collegeName=?,collegeLocation=?,collegeWebsite=?,collegeIsDoubleTop=?,collegeIs985=?,collegeIs211=?,collegeMainType=?,collegeStudyType=?,collegeIntroduction=? where collegeId=?";
        int count = jdbcTemplate.update(sql,collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction,collegeId);
        return count;
    }

    @Override
    public int deleteCollege(int collegeId) throws Exception {
        String sql = "delete from college where collegeId = ?";
        int count = jdbcTemplate.update(sql,collegeId);
        return count;
    }
}
