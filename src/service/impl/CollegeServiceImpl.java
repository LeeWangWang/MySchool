package service.impl;

import dao.CollegeDao;
import domain.College;
import domain.PageBean;
import service.CollegeService;

import java.util.List;
import java.util.Map;

public class CollegeServiceImpl implements CollegeService {
    private CollegeDao collegeDao;
    public CollegeServiceImpl(CollegeDao collegeDao){
        this.collegeDao = collegeDao;
    }
    @Override
    public List<College> selectAllCollege() {
        try {
            return collegeDao.selectAllCollege();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public PageBean<College> selectAllCollegePage(String _currentPage, String _pageSize, Map<String, String[]> condition) {

        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);

        if(currentPage <=0) {
            currentPage = 1;
        }
        //1.创建空的PageBean对象
        PageBean<College> pb = new PageBean<College>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setPageSize(pageSize);

        //3.调用dao查询总记录数
        int totalCount = 0;
        try {
            totalCount = collegeDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //4.调用dao查询List集合
            //计算开始的记录索引
            int start = (currentPage - 1) * pageSize;
            List<College> list = collegeDao.selectAllCollegePage(start,pageSize,condition);
            pb.setList(list);
            //5.计算总页码
            int totalPage = (totalCount % pageSize)  == 0 ? totalCount/pageSize : (totalCount/pageSize) + 1;
            pb.setTotalPage(totalPage);
            return pb;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public PageBean<College> selectCollegeByCriteria(String _currentPage, String _pageSize, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);
        if(currentPage <=0) {
            currentPage = 1;
        }

        PageBean<College> pb = new PageBean<College>();
        //2.设置参数
        pb.setCurrentPage(currentPage);
        pb.setPageSize(pageSize);

        //3.调用dao查询总记录数
        int totalCount = 0;
        try {
            totalCount = collegeDao.findTotalCount(condition);
            pb.setTotalCount(totalCount);
            //4.调用dao查询List集合
            //计算开始的记录索引
            int start = (currentPage - 1) * pageSize;
            List<College> list = collegeDao.selectCollegeByCriteria(start,pageSize,condition);
            pb.setList(list);
            //5.计算总页码
            int totalPage = (totalCount % pageSize)  == 0 ? totalCount/pageSize : (totalCount/pageSize) + 1;
            pb.setTotalPage(totalPage);
            return pb;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public College selectCollegeById(int collegeId) {
        try {
            return collegeDao.selectCollegeById(collegeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByLocation(String location) {
        try {
            return collegeDao.selectCollegeByLocation(location);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByIsDoubleTop() {
        try {
            return collegeDao.selectCollegeByIsDoubleTop();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByIs985() {
        try {
            return collegeDao.selectCollegeByIs985();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByIs211() {
        try {
            return collegeDao.selectCollegeByIs211();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeNormal() {
        try {
            return collegeDao.selectCollegeNormal();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByMainType(String mainType) {
        try {
            return collegeDao.selectCollegeByMainType(mainType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<College> selectCollegeByStudyType(String studyType) {
        try {
            return collegeDao.selectCollegeByStudyType(studyType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<String> selectLocations() {
        try {
            return collegeDao.selectLocations();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<String> selectMainType() {
        try {
            return collegeDao.selectMainType();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int addCollege(String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) {
        try {
            return collegeDao.addCollege(collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int updateCollege(int collegeId, String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) {
        try {
            return collegeDao.updateCollege(collegeId,collegeName,collegeLocation,collegeWebsite,collegeIsDoubleTop,collegeIs985,collegeIs211,collegeMainType,collegeStudyType,collegeIntroduction);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int deleteCollege(int collegeId) {
        try {
            return collegeDao.deleteCollege(collegeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

}
