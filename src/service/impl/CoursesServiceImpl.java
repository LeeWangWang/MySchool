package service.impl;


import dao.CoursesDao;
import dao.impl.CoursesDaoImpl;
import service.CoursesService;

import java.util.Date;
import java.util.List;

public class CoursesServiceImpl implements CoursesService {
    private CoursesDao dao = new CoursesDaoImpl();


    @Override
    public List<String> findCoursesName() {
        return dao.findCoursesName();
    }

    @Override
    public Date findCousesTime(String cousesName) {
        return dao.findCousesTime(cousesName);
    }
}
