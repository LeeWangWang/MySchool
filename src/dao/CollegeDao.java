package dao;

import domain.College;

import java.util.List;
import java.util.Map;

public interface CollegeDao {
    List<College> selectAllCollege() throws Exception;
    public int findTotalCount(Map<String, String[]> condition) throws Exception;
    List<College> selectAllCollegePage(int start, int rows, Map<String, String[]> condition) throws Exception;
    List<College> selectCollegeByCriteria(int start, int rows, Map<String, String[]> condition) throws Exception;
    College selectCollegeById(int collegeId) throws Exception;
    List<College> selectCollegeByLocation(String location) throws Exception;
    List<College> selectCollegeByIsDoubleTop() throws Exception;
    List<College> selectCollegeByIs985() throws Exception;
    List<College> selectCollegeByIs211() throws Exception;
    List<College> selectCollegeNormal() throws Exception;
    List<College> selectCollegeByMainType(String mainType) throws Exception;
    List<College> selectCollegeByStudyType(String studyType) throws Exception;
    List<String> selectLocations() throws Exception;
    List<String> selectMainType() throws Exception;
    int addCollege(String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) throws Exception;
    int updateCollege(int collegeId, String collegeName, String collegeLocation, String collegeWebsite, String collegeIsDoubleTop, String collegeIs985, String collegeIs211, String collegeMainType, String collegeStudyType, String collegeIntroduction) throws Exception;
    int deleteCollege(int collegeId) throws Exception;

}
