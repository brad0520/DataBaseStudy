import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Dao {

	String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
	String id = "sbsst"; 
	String pw = "sbs123414";

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, id, pw); // 연결.
		
		return conn;
	}
	
	public void insertArticle() throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		
		String sql = "insert into article set title = 'aaa', `body`='bbb'";
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		close(stmt, conn);
		
	}
	
	public ArrayList<Article> selectArticles() throws ClassNotFoundException, SQLException {
	
		Connection conn = getConnection();
		
		String sql = "SELECT * FROM article";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql); 
		
		ArrayList<Article> articles = new ArrayList<>();
		
		while (rs.next()) {
			String title = rs.getString("title"); 
			String body = rs.getString("body");  
			
			Article a = new Article(title, body);
			articles.add(a);
			
		}

		close(rs, stmt, conn);
		
		return articles;
	}
	
	private void close(Statement stmt, Connection conn) throws SQLException {
		if(stmt != null) {
			stmt.close();
		}
		if(conn != null) {
			conn.close();
		}
	}
	
	private void close(ResultSet rs, Statement stmt, Connection conn) throws SQLException {
		if(rs != null) {
			rs.close();
		}
		close(stmt, conn);
	}
}

