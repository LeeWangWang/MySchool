package dao;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/5 11:50
 * @Description:
 */
public interface CourseDao {

    /**
     * @Author:  李旺旺
     * @Date:    2020/1/5 11:45
     * @param:   []
     * @Return:  java.util.List<java.lang.String>
     * @Exception:
     * @Description: 查询所有班级
     */
    List<String> findAllClass();

}
