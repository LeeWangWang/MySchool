package service;

import domain.PageBean;
import domain.SignUpUser;

import java.util.List;

public interface SignUpUserService {

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:55
    * @param:   [cname, currentPage, pageSize, search]
    * @Return:  domain.PageBean<domain.SignUpUser>
    * @Exception:
    * @Description: 根据班级分页查询学生
    */
    PageBean<SignUpUser> pageQuery(String cname, int currentPage, int pageSize, String search);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/5 17:06
    * @param:   [className, search]
    * @Return:  java.util.List<domain.SignUpUser>
    * @Exception:
    * @Description: 根据输入条件查询学生
    */
    List<SignUpUser> findStudentByClassAndSearch(String className, String search);
}
