package dao.impl;

import dao.AdminDao;
import domain.Admin;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;


/**
 * @Author: 李旺旺
 * @Date: 2019/12/30 15:24
 * @Description: 管理员信息Dao层
 */
public class AdminDaoImpl implements AdminDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:01
    * @param:   [account, password]
    * @Return:  domain.Admin
    * @Exception:
    * @Description:根据管理员账号查询管理员信息
    */
    @Override
    public Admin findAdminByAccountAndPassword(String account, String password) {
        Admin admin = null;
        try {
            //1.定义sql语句
            String sql = "select * from admin where account = ? and password = ?";
            //2.执行
            admin = template.queryForObject(sql,new BeanPropertyRowMapper<Admin>(Admin.class),account,password);
        }catch (Exception e){
            System.out.println("根据管理员账号和密码查询管理员信息错误");
            e.printStackTrace();
        }
        return admin;
    }
}
