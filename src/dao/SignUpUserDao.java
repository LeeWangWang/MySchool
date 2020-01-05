package dao;

import domain.SignUpUser;
import org.w3c.dom.ls.LSException;

import java.util.List;

public interface SignUpUserDao {

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/4 15:27
    * @param:   []
    * @Return:  java.util.List<domain.SignUpUser>
    * @Exception:
    * @Description: 查询所有的学生
    */
    List<SignUpUser> findAllStudents();

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

}
