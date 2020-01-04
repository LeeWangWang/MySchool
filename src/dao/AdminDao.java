package dao;

import domain.Admin;

/**
 *  @Author: 李旺旺
 *  @Date: 2019/12/30 15:21
 *  @Description:管理员信息Dao层接口类
 */
public interface AdminDao {

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:02
    * @param:   [account, password]
    * @Return:  domain.Admin
    * @Exception:
    * @Description: 根据管理员账号查询管理员信息
    */
    Admin findAdminByAccountAndPassword(String account, String password);

}
