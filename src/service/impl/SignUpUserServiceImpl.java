package service.impl;

import dao.SignUpUserDao;
import dao.impl.SignUpUserDaoImpl;
import domain.PageBean;
import domain.SignUpUser;
import service.SignUpUserService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/3 22:20
 * @Description:
 */
public class SignUpUserServiceImpl implements SignUpUserService {

    private SignUpUserDao signUpUserDao = new SignUpUserDaoImpl();

    @Override
    public List<SignUpUser> findAll() {
        return signUpUserDao.findAll();
    }

    @Override
    public PageBean<SignUpUser> pageQuery(String cname, int currentPage, int pageSize, String search) {
        //1.封装PageBean对象
        PageBean<SignUpUser> pageBean = new PageBean<SignUpUser>();
        //2.设置当前页码
        pageBean.setCurrentPage(currentPage);
        //3.设置每页显示条数
        pageBean.setPageSize(pageSize);
        //4.设置总记录数
        int totalCount = signUpUserDao.findTotalCount(cname,search);
        pageBean.setTotalCount(totalCount);
        //5.设置当前页显示的数据集合
        int start = (currentPage-1)*pageSize;
        List<SignUpUser> list = signUpUserDao.findByPage(cname, start, pageSize, search);
        pageBean.setList(list);
        //6.设置总页数 = 总记录数/每页显示条数
        int totalPage = totalCount%pageSize==0 ? (totalCount/pageSize) : (totalCount/pageSize)+1;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
