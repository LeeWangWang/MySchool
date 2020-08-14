package service.impl;

import dao.impl.highSchoolDaoImpl;
import domain.entranceExaminationGrade;
import domain.highSchool;
import service.highSchoolService;

import java.util.ArrayList;
import java.util.List;

public class highSchoolServiceImpl implements highSchoolService {

    @Override
    public ArrayList<highSchool> queryAllSchoolName() {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        ArrayList<highSchool> list = new ArrayList<highSchool>();
        try{
            list = impl1.queryAllSchoolName();
            /*for (int i = 0;i < list.size();i++){
                System.out.println(list.get(i).getSchoolName());
            }*/
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<String> querySchoolNameByArea(String area) {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        ArrayList<String> list = new ArrayList<String>();
        try{
            list = impl1.querySchoolNameByArea(area);
            return list;
        }catch(Exception e){
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public highSchool querySchoolBySchoolName(String name) {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        highSchool h = new highSchool();
        try{
            h = impl1.querySchoolBySchoolName(name);
            return h;
        }catch(Exception e){
            e.printStackTrace();
        }
        return h;
    }

    @Override
    public ArrayList<entranceExaminationGrade> queryZeXianTu(String name) {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        ArrayList<entranceExaminationGrade> f = new ArrayList<entranceExaminationGrade>();
        try{
            f = impl1.queryZeXianTu(name);
            return f;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<highSchool> queryAllSchool() {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        ArrayList<highSchool> f = new ArrayList<highSchool>();
        try{
            f = impl1.queryAllSchool();
            return f;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean updateSchool(String schoolname, String website, String address, String area, String phone, String intro) {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        Boolean flag = false;
        try{
            flag = impl1.updateSchool(schoolname,website,address,area,phone,intro);
            return flag;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean addNewSchool(String schoolname, String website, String address, String area, String phone, String intro) {
        highSchoolDaoImpl impl1 = new highSchoolDaoImpl();
        Boolean flag = false;
        try{
            flag = impl1.addNewSchool(schoolname,website, address,area,phone,intro);
            return flag;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        highSchoolServiceImpl fl = new highSchoolServiceImpl();
        fl.queryAllSchoolName();
    }
}
