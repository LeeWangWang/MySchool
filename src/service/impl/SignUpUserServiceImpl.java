package service.impl;

import dao.impl.SignUpUserDaoImpl;
import dao.SignUpUserDao;

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
    private SignUpUserDao dao = new SignUpUserDaoImpl();

    @Override
    public PageBean<SignUpUser> pageQuery(String className, int currentPage, int pageSize, String search) {
        //1.封装PageBean对象
        PageBean<SignUpUser> pageBean = new PageBean<SignUpUser>();
        //2.设置当前页码
        pageBean.setCurrentPage(currentPage);
        //3.设置每页显示条数
        pageBean.setPageSize(pageSize);
        //4.设置总记录数
        int totalCount = signUpUserDao.findTotalCount(className,search);
        pageBean.setTotalCount(totalCount);
        //5.设置当前页显示的数据集合
        int start = (currentPage-1)*pageSize;
        List<SignUpUser> list = signUpUserDao.findByPage(className, start, pageSize, search);
        pageBean.setList(list);
        //6.设置总页数 = 总记录数/每页显示条数
        int totalPage = totalCount%pageSize==0 ? (totalCount/pageSize) : (totalCount/pageSize)+1;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    @Override
    public List<SignUpUser> findStudentByClassAndSearch(String className, String search) {
        return signUpUserDao.findStudentByClassAndSearch(className, search);
    }

    @Override
    public SignUpUser findOneStudent(String tele, String className) {
        return signUpUserDao.findOneStudent(tele, className);
    }

    @Override
    public SignUpUser updateStudent(SignUpUser signUpUser, String userTele, String className) {
        return signUpUserDao.updateStudent(signUpUser, userTele, className);
    }

    @Override
    public void deleteStudent(String tele, String coursesName) {
        signUpUserDao.deleteStudent(tele, coursesName);
    }

    @Override
    public Boolean signUp(SignUpUser signUpUser,String name,String coursesName) {
        SignUpUser result = dao.findSignUpCourses(name,coursesName);
        if (result == null){
            return dao.signUp(signUpUser);
        }else {
            return false;
        }
    }

    @Override
    public Boolean isSignUp(String userName) {
        Boolean flag = false;
        SignUpUser user = dao.isSignUp(userName);
        if (user != null){
            flag = true;
        }
        return flag;
    }

}
