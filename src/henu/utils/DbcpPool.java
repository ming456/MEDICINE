package henu.utils;

import henu.bean.User;
import henu.bean.User1;
import henu.bean.User2;
import henu.bean.User3;
import henu.dao.IUserDao;
import henu.factory.DaoFactory;
import henu.utils.DbcpPool;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.BasicDataSourceFactory;

public class DbcpPool {
	private static final int PAGE_SIZE = 5;
	/**
	 * 
	 */
	protected static Statement s = null;
	protected static ResultSet rs = null;
	protected static Connection conn = null;
	private static BasicDataSource dataSource = null;

	
	public static void init() {
		if (dataSource != null) {
			try {
				dataSource.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			dataSource = null;
		}
		
		try {
			Properties p = new Properties();
			p.setProperty("driverClassName", "com.mysql.jdbc.Driver");
			p.setProperty("url", "jdbc:mysql://localhost:3306/medidb");
			p.setProperty("username", "root");
			p.setProperty("password", "0823112013");
			p.setProperty("maxActive", "100");
			p.setProperty("maxIdle", "100");
			p.setProperty("maxWait", "1000");
			p.setProperty("removeAbandoned", "false");
			p.setProperty("removeAbandonedTimeout", "120");
			p.setProperty("testOnBorrow", "true");
			p.setProperty("logAbandoned", "true");
			
			dataSource = (BasicDataSource) BasicDataSourceFactory
					.createDataSource(p);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public static synchronized Connection getConnection() throws SQLException {
		if (dataSource == null) {
			init();
		}
		Connection conn = null;
		if (dataSource != null) {
			conn = dataSource.getConnection();
		}
		return conn;
	}

	/**
	 * 执锟斤拷INSERT/UPDATE/DELETE SQL锟斤拷锟�
	 * 
	 * @param sql
	 *            SQL锟斤拷洌拷址锟斤拷锟斤拷锟斤拷锟�
	 * @return 执锟叫斤拷锟斤拷锟絠nt锟斤拷锟斤拷
	 */
	public static int executeUpdate(String sql) {
		int result = 0;
		try {
			s = getConnection().createStatement();
			result = s.executeUpdate(sql);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 
	 * 
	 * @param sql
	 *            SQL
	 * @return ResultSet
	 */
	public static ResultSet executeQuery(String sql) {

		try {
			s = getConnection().createStatement();
			rs = s.executeQuery(sql);
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 执锟叫讹拷态SQL锟斤拷锟�
	 * 
	 * @param sql
	 *            锟斤拷锟叫诧拷锟斤拷锟侥讹拷态SQL锟斤拷洹�
	 * @return 锟斤拷锟斤拷PreparedStatement锟斤拷锟斤拷
	 */
	public static PreparedStatement executePreparedStatement(String sql) {
		PreparedStatement ps = null;
		try {
			ps = getConnection().prepareStatement(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ps;
	}

	/**
	 * 锟斤拷锟斤拷毓锟�
	 */
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	/**
	 * 
	 */
	public static void close() {
		try {
			if (rs != null)
				rs.close();
			if (s != null)
				s.close();
			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 浏览药品
	 * 权限:
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb3(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("mname");
				sb.append("<tr><td>");
				sb.append(rs.getString("mno"));
				sb.append("</td><td>");
				sb.append(rs.getString("mname"));
				sb.append("</td><td>");
				sb.append(rs.getString("mmode"));
				sb.append("</td><td>");
				sb.append(rs.getString("mefficacy"));
				sb.append("</td><td>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 查询药品
	 * 权限:入库员
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("mname");
				sb.append("<tr><td>");
				sb.append(rs.getString("mno"));
				sb.append("</td><td>");
				sb.append(rs.getString("mname"));
				sb.append("</td><td>");
				sb.append(rs.getString("mmode"));
				sb.append("</td><td>");
				sb.append(rs.getString("mefficacy"));
				sb.append("</td><td>");
				sb.append("<a href='/Test7.2/U?stype=delete&name=" + username
						+ "'>删除</a>");
				sb.append("&nbsp;");
				sb.append("<a href='userUpdate.jsp?name=" + username
						+ "'>修改</a>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 浏览顾客
	 * 权限:销售员
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb4(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("cname");
				sb.append("<tr><td>");
				sb.append(rs.getString("cno"));
				sb.append("</td><td>");
				sb.append(rs.getString("cname"));
				sb.append("</td><td>");
				sb.append(rs.getString("csex"));
				sb.append("</td><td>");
				sb.append(rs.getInt("cage"));
				sb.append("</td><td>");
				sb.append(rs.getString("caddress"));
				sb.append("</td><td>");
				sb.append(rs.getString("cphone"));
				sb.append("</td><td>");
				sb.append(rs.getString("csymptom"));
				sb.append("</td><td>");
				sb.append(rs.getString("mno"));
				sb.append("</td><td>");
				sb.append(rs.getString("ano"));
				sb.append("</td><td>");
				sb.append(rs.getString("cdate"));
				sb.append("</td><td>");
				sb.append(rs.getString("cremark"));
				sb.append("</td><td>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 查询顾客
	 * 权限:入库员
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb1(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("cname");
				sb.append("<tr><td>");
				sb.append(rs.getString("cno"));
				sb.append("</td><td>");
				sb.append(rs.getString("cname"));
				sb.append("</td><td>");
				sb.append(rs.getString("csex"));
				sb.append("</td><td>");
				sb.append(rs.getInt("cage"));
				sb.append("</td><td>");
				sb.append(rs.getString("caddress"));
				sb.append("</td><td>");
				sb.append(rs.getString("cphone"));
				sb.append("</td><td>");
				sb.append(rs.getString("csymptom"));
				sb.append("</td><td>");
				sb.append(rs.getString("mno"));
				sb.append("</td><td>");
				sb.append(rs.getString("ano"));
				sb.append("</td><td>");
				sb.append(rs.getString("cdate"));
				sb.append("</td><td>");
				sb.append(rs.getString("cremark"));
				sb.append("</td><td>");
				sb.append("<a href='/Test7.2/U?stype=delete1&name=" + username
						+ "'>删除</a>");
				sb.append("&nbsp;");
				sb.append("<a href='userUpdate1.jsp?name=" + username
						+ "'>修改</a>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 浏览经办人
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb5(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("aname");
				sb.append("<tr><td>");
				sb.append(rs.getString("ano"));
				sb.append("</td><td>");
				sb.append(rs.getString("asex"));
				sb.append("</td><td>");
				sb.append(rs.getString("aphone"));
				sb.append("</td><td>");
				sb.append(rs.getString("aremark"));
				sb.append("</td><td>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 查询经办人
	 * 权限:销售员
	 * @param sql
	 * @return
	 */
	public static StringBuffer sqlsb2(String sql) {

		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				String username = rs.getString("aname");
				sb.append("<tr><td>");
				sb.append(rs.getString("ano"));
				sb.append("</td><td>");
				sb.append(rs.getString("aname"));
				sb.append("</td><td>");
				sb.append(rs.getString("asex"));
				sb.append("</td><td>");
				sb.append(rs.getString("aphone"));
				sb.append("</td><td>");
				sb.append(rs.getString("aremark"));
				sb.append("</td><td>");
				sb.append("<a href='/Test7.2/U?stype=delete2&name=" + username
						+ "'>删除</a>");
				sb.append("&nbsp;");
				sb.append("<a href='userUpdate2.jsp?name=" + username
						+ "'>修改</a>");
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	
	/**
	 * 查询经办人
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb2(List<User2> list) {
		StringBuffer sb = new StringBuffer();
		for (User2 user : list) {
			String username = user.getAname();
			sb.append("<tr><td>");
			sb.append(user.getAno());
			sb.append("</td><td>");
			sb.append(user.getAname());
			sb.append("</td><td>");
			sb.append(user.getAsex());
			sb.append("</td><td>");
			sb.append(user.getAphone());
			sb.append("</td><td>");
			sb.append(user.getAremark());
			sb.append("</td><td>");
			sb.append("<a href='/Test7.2/U?stype=delete2&name=" + username
					+ "'>删除</a>");
			sb.append("&nbsp;");
			sb.append("<a href='userUpdate2.jsp?name=" + username +"'>修改</a>");
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 浏览经办人
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb5(List<User2> list) {
		StringBuffer sb = new StringBuffer();
		for (User2 user : list) {
			String username = user.getAname();
			sb.append("<tr><td>");
			sb.append(user.getAname());
			sb.append("</td><td>");
			sb.append(user.getAno());
			sb.append("</td><td>");
			sb.append(user.getAsex());
			sb.append("</td><td>");
			sb.append(user.getAphone());
			sb.append("</td><td>");
			sb.append(user.getAremark());
			sb.append("</td><td>");
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 查询顾客
	 * 权限：销售员
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb1(List<User1> list) {
		StringBuffer sb = new StringBuffer();
		for (User1 user : list) {
			String username = user.getCname();
			sb.append("<tr><td>");
			sb.append(user.getCno());
			sb.append("</td><td>");
			sb.append(user.getCname());
			sb.append("</td><td>");
			sb.append(user.getCsex());
			sb.append("</td><td>");
			sb.append(user.getCage());
			sb.append("</td><td>");
			sb.append(user.getCaddress());
			sb.append("</td><td>");
			sb.append(user.getCphone());
			sb.append("</td><td>");
			sb.append(user.getCsymptom());
			sb.append("</td><td>");
			sb.append(user.getMno());
			sb.append("</td><td>");
			sb.append(user.getAno());
			sb.append("</td><td>");
			sb.append(user.getCdate());
			sb.append("</td><td>");
			sb.append(user.getCremark());
			sb.append("</td><td>");
			sb.append("<a href='/Test7.2/U?stype=delete1&name=" + username
					+ "'>删除</a>");
			sb.append("&nbsp;");
			sb.append("<a href='userUpdate1.jsp?name=" + username +"'>修改</a>");
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 浏览顾客
	 * 权限：销售员
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb4(List<User1> list) {
		StringBuffer sb = new StringBuffer();
		for (User1 user : list) {
			String username = user.getCname();
			sb.append("<tr><td>");
			sb.append(user.getCno());
			sb.append("</td><td>");
			sb.append(user.getCname());
			sb.append("</td><td>");
			sb.append(user.getCsex());
			sb.append("</td><td>");
			sb.append(user.getCage());
			sb.append("</td><td>");
			sb.append(user.getCaddress());
			sb.append("</td><td>");
			sb.append(user.getCphone());
			sb.append("</td><td>");
			sb.append(user.getCsymptom());
			sb.append("</td><td>");
			sb.append(user.getMno());
			sb.append("</td><td>");
			sb.append(user.getAno());
			sb.append("</td><td>");
			sb.append(user.getCdate());
			sb.append("</td><td>");
			sb.append(user.getCremark());
			sb.append("</td><td>");
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 浏览药品
	 * 权限：销售员
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb3(List<User> list) {
		StringBuffer sb = new StringBuffer();
		for (User user : list) {
			String username = user.getMname();
			sb.append("<tr><td>");
			sb.append(user.getMno());
			sb.append("</td><td>");
			sb.append(user.getMname());
			sb.append("</td><td>");
			sb.append(user.getMmode());
			sb.append("</td><td>");
			sb.append(user.getMefficacy());
			sb.append("</td><td>");
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 查询药品
	 * 权限：销售员
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb(List<User> list) {
		StringBuffer sb = new StringBuffer();
		for (User user : list) {
			String username = user.getMname();
			sb.append("<tr><td>");
			sb.append(user.getMname());
			sb.append("</td><td>");
			sb.append(user.getMno());
			sb.append("</td><td>");
			sb.append(user.getMmode());
			sb.append("</td><td>");
			sb.append(user.getMefficacy());
			sb.append("<a href='/Test7.2/U?stype=delete&name=" + username
					+ "'>删除</a>");
			sb.append("&nbsp;");
			sb.append("<a href='userUpdate.jsp?name=" + username +"'>修改</a>");;
		}
		return sb;
	}
/**
 * 浏览购物清单
 * 查找
 * @param list
 * @return
 */
	public static StringBuffer sqlsb6(List<User3> list) {
		// TODO Auto-generated method stub
		StringBuffer sb = new StringBuffer();
		for (User3 user : list) {
			String username = user.getMname();
			sb.append("<tr><td>");
			sb.append(user.getSno());
			sb.append("</td><td>");
			sb.append(user.getMno());
			sb.append("</td><td>");
			sb.append(user.getCount());
			sb.append("</td><td>");
			sb.append(user.getMname());
			sb.append("</td><td>");
			sb.append(user.getUnitprice());
			sb.append("</td><td>");
			sb.append(user.getMoney());
			sb.append("</td><td>");
			sb.append(user.getCno());
			sb.append("</td><td>");
			sb.append(user.getAno());
			sb.append("</td><td>");
			sb.append(user.getStime());
			sb.append("</td></tr>");
		}
		return sb;
	}
	/**
	 * 浏览购物清单
	 * @param list
	 * @return
	 */
	public static StringBuffer sqlsb6(String sql) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		rs = DbcpPool.executeQuery(sql);
		StringBuffer sb = new StringBuffer();
		try {
			while (rs.next()) {
				sb.append("<tr><td>");
				sb.append(rs.getString("sno"));
				sb.append("</td><td>");
				sb.append(rs.getString("mno"));
				sb.append("</td><td>");
				sb.append(rs.getInt("count"));
				sb.append("</td><td>");
				sb.append(rs.getString("mname"));
				sb.append("</td><td>");
				sb.append(rs.getString("unitprice"));
				sb.append("</td><td>");
				sb.append(rs.getString("money"));
				sb.append("</td><td>");
				sb.append(rs.getString("cno"));
				sb.append("</td><td>");
				sb.append(rs.getString("ano"));
				sb.append("</td><td>");
				sb.append(rs.getString("stime"));
				sb.append("</td></tr>");
			}
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sb;
	}
	/**
	 * 分页显示
	 * @param sql
	 * @param page
	 * @return
	 * @throws SQLException
	 */
	 public static ResultSet selectStatic1(String sql,int page) throws SQLException {
	    	//String sql = "select* from tb_product order by id desc limit ?,?";
	         ResultSet rs=null;
	        if (conn == null) {
	           conn=getConnection();
	           //System.out.println("1111111");
	        }
	               try {
	            	   PreparedStatement ps = conn.prepareStatement(sql);
	                   ps.setInt(1, (page-1)*PAGE_SIZE);
	                   ps.setInt(2, PAGE_SIZE);
	                   rs = ps.executeQuery();
	         } catch (SQLException e) {
	                     e.printStackTrace();
	                    }
	        return rs;
	    }
	 public static boolean Flag()
	 {
			if (conn == null)
               return true;
		return false;

	 }
}
