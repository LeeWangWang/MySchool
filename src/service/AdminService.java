package service;

import domain.Admin;

/**
 *  @Author: 李旺旺
 *  @Date: 2019/12/30 15:50
 *  @Description: 管理员信息Service接口类
 */
public interface AdminService {

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:04
    * @param:   [admin]
    * @Return:  domain.Admin
    * @Exception:
    * @Description: 管理员登录
    */
    Admin login(Admin admin);

}
