package dao.impl;
import dao.*;
import domain.entranceExaminationGrade;
import domain.highSchool;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

public class highSchoolDaoImpl implements highSchoolDao{
    public String schoolName;
    public String website;
    public String intro;
    public String address;
    public String area;
    public String phone;

    @Override
    public ArrayList<highSchool> queryAllSchoolName() throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        ArrayList<highSchool> list = new ArrayList<highSchool>();

        rs = st.executeQuery("select schoolName,area from highschool");
        while(rs.next()){
            schoolName = rs.getString(1);
            area = rs.getString(2);
            highSchool h = new highSchool(schoolName,area);
            list.add(h);
        }
        return list;
    }

    @Override
    public ArrayList<String> querySchoolNameByArea(String area) throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        ArrayList<String> list = new ArrayList<String>();
        rs = st.executeQuery("select schoolName from highschool where area = '"+area+"'");

        while(rs.next()){
            schoolName = rs.getString(1);
            list.add(schoolName);
            //System.out.println(rs.getString(1));
        }
        return list;
    }

    @Override
    public highSchool querySchoolBySchoolName(String name) throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        rs = st.executeQuery("select * from highschool where schoolName = '"+name+"'");

        while(rs.next()){
            schoolName = rs.getString(1);
            website = rs.getString(2);
            intro = rs.getString(3);
            address = rs.getString(4);
            area = rs.getString(5);
            phone = rs.getString(6);
        }
        highSchool h = new highSchool(schoolName,website,intro,address,area,phone);
        return h;

    }

    @Override
    public ArrayList<entranceExaminationGrade> queryZeXianTu(String name) throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        ArrayList<entranceExaminationGrade> f = new ArrayList<entranceExaminationGrade>();
        //System.out.println("到此一游");
        /*芝罘区*/
        rs = st.executeQuery("select * from entranceexaminationgrade where schoolName = '"+name+"'");
        while(rs.next()){
            String schoolName = rs.getString(1);
            int year = rs.getInt(2);
            float grade = rs.getFloat(3);
            String area = rs.getString(4);
            entranceExaminationGrade e = new entranceExaminationGrade(schoolName,year,grade,area);
            f.add(e);
        }

        return f;
    }

    @Override
    public ArrayList<highSchool> queryAllSchool() throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        ArrayList<highSchool> f = new ArrayList<highSchool>();
        //System.out.println("到此一游");
        /*芝罘区*/
        rs = st.executeQuery("select * from highschool");
        while(rs.next()){
            String schoolName = rs.getString(1);
            String website = rs.getString(2);
            String intro = rs.getString(3);
            String address = rs.getString(4);
            String area = rs.getString(5);
            String phone = rs.getString(6);
            highSchool e = new highSchool(schoolName,website,intro,address,area,phone);
            f.add(e);
        }
        return f;
    }

    @Override
    public boolean updateSchool(String schoolname,String website
            ,String address,String area,String phone,String intro) throws Exception {
        Connection conn = JDBCUtil.getConnection();

        String sql = "update highschool set schoolName=?,website=?,intro=?," +
                "address=?,area=?,phone=? where schoolName=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        /*System.out.println(formatter.format(currentTime));*/
        ps.setString(1,schoolname);
        ps.setString(2,website);
        ps.setString(3,intro);
        ps.setString(4,address);
        ps.setString(5,area);
        ps.setString(6,phone);
        ps.setString(7,schoolname);
        if (ps.executeUpdate()>0){
            System.out.println("dui");
            return true;
        }else {
            System.out.println("cuo");
            return false;
        }
    }

    @Override
    public boolean addNewSchool(String schoolname,
      String website, String address, String area, String phone, String intro) throws Exception {

        Connection conn = JDBCUtil.getConnection();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date currentTime  = new Date();
        String sql = "insert into highschool(schoolName, website, intro,address,area,phone) values(?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        /*System.out.println(formatter.format(currentTime));*/
        ps.setString(1,schoolname);
        ps.setString(2,website);
        ps.setString(3,intro);
        ps.setString(4,address);
        ps.setString(5,area);
        ps.setString(6,phone);
        /*System.out.println("到这里了");*/
        if(ps.executeUpdate()>0){
            /*System.out.println("成功");*/
            return true;
        }else{
            /*System.out.println("失败");*/
            return false;
        }
    }

    public static void main(String[] args){
        highSchoolDaoImpl test1 = new highSchoolDaoImpl();
        try{
            test1.updateSchool("中国烟台赫尔曼·格迈纳尔中学","https://gezhong.30edu.com.cn/",
                    "烟台市福山区崇文街201号","福山区","2136789","1991年，为方便中国烟台SOS儿童村孩子就近上学，国际SOS儿童村总部与山东省烟台市福山区政府共同投资兴建了中国烟台赫尔曼·格迈纳尔中学，性质是普通公办中学，由初中部和高中部组成。学校以国际SOS儿童村创始人赫尔曼·格迈纳尔先生的名字命名。中文校名：中国烟台赫尔曼·格迈纳尔中学英文校名：HERMANN GMEINER SCHOOL YANTAI CHINA学校充分依托一流的教学设施和优越的教学资源，追求师生的精品形象，凸显办学的个性和特色，积极拓展办学空间，大力加强与国内外校际间的教学合作与学术交流。在国际上，与韩国井邑培英中高等学校建立了姊妹学校关系，和英国剑桥学院建立了友好合作关系；在国内，成为鲁东大学教学实习基地。我校通过采取成立教学实习基地领导小组、制定切实可行的教学实习指导方案、加大教学实习基地建设资金投入和选派优秀骨干教师为实习指导教师等一系列有效措施，保证了实习质量，提高了实习大学生们的教学实践水平，两校在共同培养高素质和实用性人才方面积累了宝贵的经验，实现了双赢。                       ");
        }catch (Exception e){

        }
    }
}
