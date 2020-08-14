package dao.impl;

import domain.School;
import util.DBTool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//名师的业务逻辑类
public class schoolDao {
    //获得所有的名师信息
    public static ArrayList<School> getAllschool() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<School> list = new ArrayList<School>();
        try {
            conn = DBTool.getConnection();
            String sql = "select * from school;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                School sch = new School();
                sch.setName(rs.getString("name"));
                sch.setLocation(rs.getString("location"));
                sch.setIntroduce(rs.getString("introduce"));
                list.add(sch);
                System.out.println("++===="+sch);
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