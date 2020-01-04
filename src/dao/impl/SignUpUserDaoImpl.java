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
    public List<SignUpUser> findAll() {
        String sql = "select * from signupuser";
        return template.query(sql, new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class));
    }

    @Override
    public int findTotalCount(String cname, String search) {
        String sql = "select count(*) from signupuser where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();
        if (cname != null && cname.length() != 0){
            sb.append(" and coursesName = ?");
        }
        if(search != null && search.length()!=0){
            sb.append(" and concat (name,tele,sex,address,parentName,parentTele) like ? ");
            params.add("%"+search+"%");
        }
        sql = sb.toString();
        System.out.println("findTotalCount:"+sql);
        System.out.println("findTotalCount:"+params);
        return template.queryForObject(sql,Integer.class,params.toArray());
    }

    @Override
    public List<SignUpUser> findByPage(String cname, int start, int pageSize, String search) {
        //1.定义sql模板
        String sql = "select * from tab_route where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        List params = new ArrayList();
        //2.判断参数是否有值
        if(cname != null && cname.length() != 0){
            sb.append( " and coursesName = ? ");
            params.add(cname);
        }
        if(search != null && search.length() != 0){
            sb.append(" and concat(name,tele,sex,address,parentName,parentTele) like ? ");
            params.add("%"+search+"%");
        }
        sb.append(" limit ? , ? ");
        sql = sb.toString();
        params.add(start);
        params.add(pageSize);
        System.out.println("findByPage:"+sql);
        System.out.println("findByPage:"+params);
        return template.query(sql,new BeanPropertyRowMapper<SignUpUser>(SignUpUser.class),params.toArray());
    }
}
