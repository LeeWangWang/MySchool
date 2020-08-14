package service;

import domain.entranceExaminationGrade;
import domain.highSchool;

import java.util.ArrayList;

public interface highSchoolService {
    public ArrayList<highSchool> queryAllSchoolName();
    public ArrayList<String> querySchoolNameByArea(String area);
    public highSchool querySchoolBySchoolName(String name);
    public ArrayList<entranceExaminationGrade> queryZeXianTu(String name);
    public ArrayList<highSchool> queryAllSchool();
    public boolean updateSchool(String schoolname, String website
            , String address, String area, String phone, String intro);
    public boolean addNewSchool(String schoolname, String website, String address
            , String area, String phone, String intro);
}
