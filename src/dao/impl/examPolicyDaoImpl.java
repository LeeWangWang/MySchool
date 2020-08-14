package dao.impl;

import dao.examPolicyDao;
import domain.entranceExaminationGrade;
import domain.examPolicy;
import util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class examPolicyDaoImpl implements examPolicyDao {
    @Override
    public ArrayList<examPolicy> queryAllPolicy() throws Exception {
        Connection conn = JDBCUtil.getConnection();
        ResultSet rs;
        Statement st = conn.createStatement();
        ArrayList<examPolicy> ae = new ArrayList<examPolicy>();
        /*芝罘区*/
        rs = st.executeQuery("select * from exampolicy");
        while(rs.next()){
            Date date = rs.getDate(1);
            String title = rs.getString(2);
            String content = rs.getString(3);
            int id = rs.getInt(4);
            examPolicy e = new examPolicy(date,title,content,id);
            ae.add(e);
        }
        for (int i = 0;i < ae.size();i++){
            System.out.println(ae.get(i).getId());
        }
        return ae;
    }

    @Override
    public boolean addNewPolicy(String title, String content) throws Exception {
        Connection conn = JDBCUtil.getConnection();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date currentTime  = new Date();
        String sql = "insert into exampolicy(time,title,content,id) values(?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        /*System.out.println(formatter.format(currentTime));*/
        ps.setString(1,formatter.format(currentTime));
        ps.setString(2,title);
        ps.setString(3,content);
        ps.setInt(4,0);
        /*System.out.println("到这里了");*/
        if(ps.executeUpdate()>0){
            /*System.out.println("成功");*/
            return true;
        }else{
            /*System.out.println("失败");*/
            return false;
        }
    }

    @Override
    public boolean updatePolicy(int id, String title, String content) throws Exception {
        Connection conn = JDBCUtil.getConnection();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date currentTime  = new Date();
        String sql = "update exampolicy set title=?,content=? where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        /*System.out.println(formatter.format(currentTime));*/
        ps.setString(1,title);
        ps.setString(2,content);
        ps.setInt(3,id);
        if (ps.executeUpdate()>0){
            System.out.println("dui");
            return true;
        }else {
            System.out.println("cuo");
            return false;
        }
    }

    public static void main(String[] args) {
        examPolicyDaoImpl e = new examPolicyDaoImpl();
        try{
            e.queryAllPolicy();
        }catch (Exception e1){
            e1.printStackTrace();
        }
    }
}
