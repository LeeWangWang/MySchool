package service.impl;

import dao.CourseDao;
import dao.impl.CourseDaoImpl;
import service.CourseService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/5 11:52
 * @Description:
 */
public class CourseServiceImpl implements CourseService {

    private CourseDao courseDao = new CourseDaoImpl();

    @Override
    public List<String> findAllClass() {
        return courseDao.findAllClass();
    }


}
