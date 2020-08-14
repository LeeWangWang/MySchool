package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
    private final static String URL = "jdbc:mysql://localhost:3306/platform?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";
    private static Connection conn = null;
    static{
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        return conn;
    }

    public static void closeConnection() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
                conn = null;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main (String[] args) throws Exception {
        try{
            if(conn!=null) {
                System.out.println("true");
            }else {
                System.out.println("false");
            }
        }catch (Exception e){
            System.out.println(e);
        }
    }
}
