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

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/6 10:34
    * @param:   [tele, className]
    * @Return:  domain.SignUpUser
    * @Exception:
    * @Description: 查询单个学生信息
    */
    SignUpUser findOneStudent(String tele, String className);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/7 16:02
    * @param:   [signUpUser, userTele, className]
    * @Return:  domain.SignUpUser
    * @Exception:
    * @Description: 更新学生信息
    */
    SignUpUser updateStudent(SignUpUser signUpUser, String userTele, String className);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/7 16:46
    * @param:   [tele, className]
    * @Return:  void
    * @Exception:
    * @Description: 删除学生信息
    */
    void deleteStudent(String tele, String coursesName);
}
