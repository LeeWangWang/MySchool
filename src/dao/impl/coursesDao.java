package dao.impl;

import domain.Courses;
import util.DBTool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//名师的业务逻辑类
public class coursesDao {
    //获得所有的课程信息
    public static ArrayList<Courses> getAllcourses() {
        System.out.println(1111);
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Courses> list = new ArrayList<Courses>();
        try {
            conn = DBTool.getConnection();
            String sql = "select * from courses;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Courses cou = new Courses();
                cou.setCoursesName(rs.getString("coursesName"));
                cou.setCoursesIntroduce(rs.getString("coursesIntroduce"));
               cou.setCoursesStage(rs.getString("coursesStage"));
                cou.setCoursesTime(rs.getDate("coursesTime"));
               cou.setTeacherId(rs.getInt("teacherId"));

                list.add(cou);//把一个课程加入集合

            }

            return list;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            //释放数据集对象
            if (rs != null) {
                try {
                    rs.close();
                    rs = null;
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                if (stmt != null) {
                    try {
                        stmt.close();
                        stmt = null;
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }

    }

}
