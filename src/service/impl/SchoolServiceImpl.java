package service.impl;

import dao.impl.SchoolDaoImpl;
import dao.SchoolDaoInterface;
import domain.School;
import service.SchoolService;

/**
 * @Author: 李旺旺
 * @Date: 2020/1/8 20:03
 * @Description:
 */
public class SchoolServiceImpl implements SchoolService {

    private SchoolDaoInterface schoolDao = new SchoolDaoImpl();

    @Override
    public School findSchool() {
        return schoolDao.findSchool();
    }

    @Override
    public Boolean updateSchool(School school) {
        return schoolDao.updateSchool(school);
    }
}
