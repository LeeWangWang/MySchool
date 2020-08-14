package dao;

import domain.Teacher;

import java.util.List;

public interface TeacherDao {
    List<Teacher> findTeacher();

    Boolean updateTeacher(int id, String name, String introduce);

    Teacher findOneTeacher(int id);

}
