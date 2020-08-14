package dao.impl;

import dao.CousesVideoDao;
import domain.CousesVideo;
import util.DBTool;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class CousesVideoDaoImpl implements CousesVideoDao {
    @Override
    public Boolean addVideo(CousesVideo cousesVideo) {
        String imgUrl = cousesVideo.getImgPath();
        String videoUrl = cousesVideo.getVideoPath();
        String newImgUrl = imgUrl.replaceAll("\\\\","/");
        String newVideoUrl = videoUrl.replaceAll("\\\\","/");
        boolean flag = false;
        try {
            flag = false;
            Connection conn = DBTool.getConnection();
            Statement state = conn.createStatement();
            String sql = "insert into cousesvideo(cousesVideoName,videoPath,imgPath,teacherName,videoIntroduce) values ('" + cousesVideo.getCousesVideoName() + "','" + newVideoUrl + "','" + newImgUrl + "','" + cousesVideo.getTeacherName() + "','" + cousesVideo.getVideoIntroduce() +"')";
            int result = state.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            if (result == 1) {
                flag = true;
            }
            state.close();
            return flag;
        } catch (SQLException e) {
            e.printStackTrace();
            return flag;
        }
    }
    @Override
    public int findTotalCount() {
        try {
            Connection conn = DBTool.getConnection();
            String sql = "select count(*) from cousesvideo";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            int count = 0;
            while(rs.next()){
                count = rs.getInt(1);
            }
            pst.close();
            rs.close();
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        }

    }

    @Override
    public List<CousesVideo> findByPage(int start, int rows) {
        try {
            List<CousesVideo> cousesVideoList = new ArrayList<CousesVideo>();
            CousesVideo cousesVideo;
            Connection conn = DBTool.getConnection();
            String sql = "select * from cousesvideo limit ?,?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, start);
            pst.setInt(2, rows);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String cousesVideoName = rs.getString(2);
                String videoPath = rs.getString(3);
                String imgPath = rs.getString(4);
                String teacherName = rs.getString(5);
                String videoIntroduce = rs.getString(6);
                cousesVideo = new CousesVideo(id, cousesVideoName, videoPath, imgPath, teacherName, videoIntroduce);
                cousesVideoList.add(cousesVideo);
            }
            rs.close();
            pst.close();
            return cousesVideoList;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
