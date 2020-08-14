package dao.impl;


import dao.UserDao;
import domain.User;
import util.DBTool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDaoImpl implements UserDao {

    @Override
    public User findUserByUsernameAndPassword(String account, String password) {
        try {
            User result = null;
            Connection conn = DBTool.getConnection();
            PreparedStatement pst = conn.prepareStatement("select * from user where account = ? and password = ?");
            pst.setString(1, account);
            pst.setString(2, password);
            ResultSet rs;
            rs = pst.executeQuery();
            if (rs.next()) {
                String account1 = rs.getString(1);
                String password1 = rs.getString(2);
                String name = rs.getString(3);
                result = new User(account1, password1, name);
            }
            rs.close();
            pst.close();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }


}
