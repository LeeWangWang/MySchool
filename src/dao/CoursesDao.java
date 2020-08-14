package dao;

import java.util.Date;
import java.util.List;

/**
 * 用户操作的DAO
 */
public interface CoursesDao {
    public List<String> findCoursesName();
    public Date findCousesTime(String cousesName);
}
