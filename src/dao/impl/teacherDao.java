package dao.impl;

import domain.Teacher;
import util.DBTool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//名师的业务逻辑类
public class teacherDao {
    //获得所有的名师信息
    public static ArrayList<Teacher> getAllteacher() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList<Teacher> list = new ArrayList<Teacher>();
        try {
            conn = DBTool.getConnection();
            String sql = "select * from teacher;";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                Teacher tea = new Teacher();
                tea.setId(rs.getInt("id"));
                tea.setIntroduce(rs.getString("introduce"));
                tea.setName(rs.getString("name"));
                tea.setPhoto(rs.getString("photo"));
                list.add(tea);//把一个名师加入集合
            }

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
        return list;
    }
/*
    //根据名师id获得名师资料
    public teacher getteacherById(int id) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            conn = DBTool.getConnection();
            String sql = "select * from teacher where id=?;";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            if (rs.next()) {
                teacher tea = new teacher();
                tea.setId(rs.getInt("id"));
                tea.setIntroduce(rs.getString("introduce"));
                tea.setName(rs.getString("name"));
                tea.setPhoto(rs.getString("photo"));
                return tea;
            } else {
                return null;
            }

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

    }*/

}

