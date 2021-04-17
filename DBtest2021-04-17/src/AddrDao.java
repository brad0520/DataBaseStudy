import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class AddrDao {
	String url = "jdbc:mysql://localhost:3306/addr?serverTimezone=UTC";
	String id = "sbsst";
	String pw = "sbs123414";

	public Connection getConnection() throws ClassNotFoundException, SQLException {

		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, id, pw); // 연결.

		return conn;
	}

	private void close(Statement stmt, Connection conn) throws SQLException {
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	}

	private void close(ResultSet rs, Statement stmt, Connection conn) throws SQLException {
		if (rs != null) {
			rs.close();
		}
		close(stmt, conn);
	}

	public ArrayList<Addr> getAddrList() throws ClassNotFoundException, SQLException {

		Connection conn = getConnection();

		String sql = "select * from t_addr_info";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<Addr> addrList = new ArrayList<Addr>();

		while (rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String phone = rs.getString("phone");
			String regDate = rs.getString("regDate");

			Addr a = new Addr(idx, name, address, phone, regDate);
			addrList.add(a);

		}

		close(rs, stmt, conn);
		
		return addrList;
	}

	public void insertAddr(String name, String address, String phone) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String sql = "insert into t_addr_info set name = '" + name + "', address = '" + address + "', phone = '" + phone
				+ "', regDate = NOW()";
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		close(stmt, conn);

	}
	
	public void deleteAddr(int idx) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String sql = "DELETE FROM t_addr_info WHERE idx = " + idx;
		
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		close(stmt, conn);
	}
	
	public void updateAddr(String name, String address, String phone, int idx) throws ClassNotFoundException, SQLException {
		Connection conn = getConnection();
		String sql = "update t_addr_info set name = '" + name + "', address = '" + address + "', phone = '" + phone
				+ "' WHERE idx = " + idx;

		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		
		close(stmt, conn);
	}

	public ArrayList<Addr> searchedList(String keyword) throws ClassNotFoundException, SQLException {
		
		Connection conn = getConnection();

		String sql = "SELECT * FROM t_addr_info WHERE `name` LIKE '%" + keyword + "%'";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<Addr> addrList = new ArrayList<Addr>();

		while (rs.next()) {
			int idx = rs.getInt("idx");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String phone = rs.getString("phone");
			String regDate = rs.getString("regDate");

			Addr a = new Addr(idx, name, address, phone, regDate);
			addrList.add(a);

		}

		close(rs, stmt, conn);
		
		return addrList;
	}

}
