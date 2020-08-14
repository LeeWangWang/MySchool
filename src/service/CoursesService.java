package service;


import java.util.Date;
import java.util.List;

/**
 * 用户管理的业务接口
 */
public interface CoursesService {

    /**
     * 查询所有用户信息
     * @return
     */

    public List<String> findCoursesName();

    public Date findCousesTime(String cousesName);
}
