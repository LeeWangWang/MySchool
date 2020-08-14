package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBTool {
	private static Connection conn  = null;
	public static Connection getConnection(){
		try {
			if(conn == null || conn.isClosed()){
				try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/platform?useSSL=false&serverTimezone=UTC","root","123456");
				} catch (ClassNotFoundException e) {
					System.out.println("sha");
					e.printStackTrace();
				} catch (SQLException e) {
					System.out.println("bi");
				}
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return conn;			
	}
	public static void closeConnection(){
		try {
			if(conn != null && !conn.isClosed()){
				conn.close();
				conn = null;
				}
		    }catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
