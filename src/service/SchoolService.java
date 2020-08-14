package service;

import domain.School;

public interface SchoolService{

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/8 20:11
    * @param:   []
    * @Return:  domain.School
    * @Exception:
    * @Description: 获取学校信息
    */
    School findSchool();

    /**
    * @Author:  李旺旺
    * @Date:    2020/1/8 20:19
    * @param:   []
    * @Return:  java.lang.Boolean
    * @Exception:
    * @Description: 修改学校信息
    */
    Boolean updateSchool(School school);

}
