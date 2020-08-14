package service.impl;

import dao.TeacherDao;
import dao.impl.TeacherDaoImpl;
import domain.Teacher;
import service.TeacherService;

import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/9 09:30
 * @Description:
 */
public class TeacherServiceImpl implements TeacherService {

    private TeacherDao teacherDao = new TeacherDaoImpl();

    @Override
    public List<Teacher> findTeacher() {
        return teacherDao.findTeacher();
    }

    @Override
    public Boolean updateTeacher(int id, String name, String introduce) {
        return teacherDao.updateTeacher(id, name, introduce);
    }

    @Override
    public Teacher findOneTeacher(int id) {
        return teacherDao.findOneTeacher(id);
    }
}
