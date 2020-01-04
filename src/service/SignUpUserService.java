package service;

import domain.PageBean;
import domain.SignUpUser;

import java.util.List;

public interface SignUpUserService {

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:54
    * @param:   []
    * @Return:  java.util.List<domain.SignUpUser>
    * @Exception:
    * @Description: 查询所有学生
    */
    List<SignUpUser> findAll();

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:55
    * @param:   [cname, currentPage, pageSize, search]
    * @Return:  domain.PageBean<domain.SignUpUser>
    * @Exception:
    * @Description: 根据班级分页查询学生
    */
    PageBean<SignUpUser> pageQuery(String cname, int currentPage, int pageSize, String search);

}
