package dao;

import domain.entranceExaminationGrade;
import domain.highSchool;

import java.util.ArrayList;

public interface highSchoolDao {
    public ArrayList<highSchool> queryAllSchoolName() throws Exception;
    public ArrayList<String> querySchoolNameByArea(String area) throws Exception;
    public highSchool querySchoolBySchoolName(String name) throws Exception;
    public ArrayList<entranceExaminationGrade> queryZeXianTu(String name) throws Exception;
    public ArrayList<highSchool> queryAllSchool() throws Exception;
    public boolean updateSchool(String schoolname, String website
            , String address, String area, String phone, String intro) throws Exception;
    public boolean addNewSchool(String schoolname, String website, String address, String area,
                                String phone, String intro) throws Exception;
}
