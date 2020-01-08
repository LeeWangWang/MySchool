package dao;

import domain.SignUpUser;
import org.w3c.dom.ls.LSException;

import java.util.List;

public interface SignUpUserDao {

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:28
    * @param:   [cid, rname]
    * @Return:  int
    * @Exception:
    * @Description: 查询总的记录数
    **/
    int findTotalCount(String cname, String search);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:29
    * @param:   [cname, start, pageSize, search]
    * @Return:  java.util.List<domain.SignUpUser>
    * @Exception:
    * @Description: 查询当前页面的数据
    */
    List<SignUpUser> findByPage(String cname, int start , int pageSize, String search);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/5 17:08
    * @param:   [className, search]
    * @Return:  java.util.List<domain.SignUpUser>
    * @Exception:
    * @Description: 根据输入条件查询学生信息
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
    * @Description: 更新用户信息
    */
    SignUpUser updateStudent(SignUpUser signUpUser, String userTele, String className);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/7 16:47
    * @param:   [tele, className]
    * @Return:  void
    * @Exception:
    * @Description: 删除学生信息
    */
    void deleteStudent(String tele, String coursesName);
}
