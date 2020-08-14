package service.impl;

import dao.AdminDao;

import dao.impl.AdminDaoImpl;
import domain.Admin;
import service.AdminService;

/**
 * @Author: 李旺旺
 * @Date: 2019/12/30 15:52
 * @Description: 管理员信息Service类
 */
public class AdminServiceImpl implements AdminService {

    private AdminDao adminDao = new AdminDaoImpl();

    /**
    * @Author:  李旺旺
    * @Date:    2019/12/30 17:03
    * @param:   [admin]
    * @Return:  domain.Admin
    * @Exception:
    * @Description: 管理员登录
    */
    @Override
    public Admin login(Admin admin) {
        return adminDao.findAdminByAccountAndPassword(admin.getAccount(), admin.getPassword());
    }
}
