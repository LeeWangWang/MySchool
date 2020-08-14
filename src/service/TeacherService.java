package service;

import domain.Teacher;

import java.util.List;

public interface TeacherService {
    /**
    * @Author:  李旺旺
    * @Date:    2020/1/9 9:29
    * @param:   []
    * @Return:  java.util.List<domain.Teacher>
    * @Exception:
    * @Description: 查询教师信息
    */
    List<Teacher> findTeacher();

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/9 9:29
    * @param:   [teacher]
    * @Return:  java.lang.Boolean
    * @Exception:
    * @Description: 更改教师信息
    */
    Boolean updateTeacher(int id, String name, String introduce);

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/9 10:00
    * @param:   [id]
    * @Return:  domain.Teacher
    * @Exception:
    * @Description: 查询教师信息
    */
    Teacher findOneTeacher(int id);

}
