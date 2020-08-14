package service;

import domain.College;
import domain.PageBean;

import java.util.List;
import java.util.Map;

public interface CollegeService {
    public List<College> selectAllCollege();
    PageBean<College> selectAllCollegePage(String currentPage, String rows, Map<String, String[]> condition);
    PageBean<College> selectCollegeByCriteria(String currentPage, String rows, Map<String, String[]> condition);
    public College selectCollegeById(int collegeId);
    public List<College> selectCollegeByLocation(String location);
    public List<College> selectCollegeByIsDoubleTop();
    public List<College> selectCollegeByIs985();
    public List<College> selectCollegeByIs211();
    public List<College> selectCollegeNormal();
    public List<College> selectCollegeByMainType(String mainType);
    public List<College> selectCollegeByStudyType(String studyType);
    public List<String> selectLocations();
    public List<String> selectMainType();
    public int addCollege(String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction);
    public int updateCollege(int collegeId, String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction);
    public int deleteCollege(int collegeId);
}
