package dao.impl;

import dao.CoursesDao;
import util.DBTool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CoursesDaoImpl implements CoursesDao {

    @Override
    public List<String> findCoursesName() {
        try {
            List<String> result = new ArrayList<String>();
            Connection conn = DBTool.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from courses");
            ResultSet rs;
            rs = pst.executeQuery();
            while(rs.next()) {
                String coursesName = rs.getString(1);
                result.add(coursesName);
            }
            rs.close();
            pst.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Date findCousesTime(String cousesName) {
        try {
            Date date = null;
            Connection conn = DBTool.getConnection();
            PreparedStatement pst = conn.prepareStatement("select coursesTime from courses where coursesName=?");
            pst.setString(1,cousesName);
            ResultSet rs;
            rs = pst.executeQuery();
            if(rs.next()) {
                Date coursesTime = rs.getDate(1);
                date = coursesTime;
            }
            rs.close();
            pst.close();
            return date;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
