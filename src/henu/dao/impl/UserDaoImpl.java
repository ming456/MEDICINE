 package henu.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import henu.bean.PUser;
import henu.bean.User;
import henu.bean.User1;
import henu.bean.User2;
import henu.bean.User3;
import henu.dao.IUserDao;
import henu.utils.DbcpPool;

public class UserDaoImpl implements IUserDao {
	/**
	 * 保存顾客信息
	 */
	@Override
	public int save(User1 user) {
		String sql = "INSERT INTO client (cno,cname," + "csex,cage"
				+ ",caddress,cphone,csymptom,mno,ano,cdate,cremark)"
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1, user.getCno());
			ps.setString(2, user.getCname());
			ps.setString(3, user.getCsex());
			ps.setInt(4, user.getCage());
			ps.setString(5, user.getCaddress());
			ps.setString(6, user.getCphone());
			ps.setString(7, user.getCsymptom());
			ps.setString(8, user.getMno());
			ps.setString(9, user.getAno());
			ps.setString(10, user.getCdate());
			ps.setString(11, user.getCremark());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	/**
	 * 保存药品信息
	 */
	@Override
	public int save(User user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO medicine(mno,mname," + "mmode,mefficacy)"
				+ "VALUES (?,?,?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1, user.getMno());
			ps.setString(2, user.getMname());
			ps.setString(3, user.getMmode());
			ps.setString(4, user.getMefficacy());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}
	/**
	 * 保存经办人信息
	 */
	@Override
	public int save(User2 user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO agency(ano,aname,asex,aphone,aremark)"
				+ "VALUES (?,?,?,?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1, user.getAno());
			ps.setString(2, user.getAname());
			ps.setString(3, user.getAsex());
			ps.setString(4, user.getAphone());
			ps.setString(5, user.getAremark());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	/**
	 * 删除顾客信息 
	 */
	@Override
	public int delete(String cname) {
		String sql = "DELETE FROM client WHERE cname = '" + cname + "'";
		int result = 0;
		result = DbcpPool.executeUpdate(sql);
		DbcpPool.close();
		return result;
	}

	/**
	 * 删除药品信息
	 */
	@Override
	public int delete1(String mname) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM medicine WHERE mname = '" + mname + "'";
		int result = 0;
		result = DbcpPool.executeUpdate(sql);
		DbcpPool.close();
		return result;
	}
	/**
	 * 删除经办人信息
	 */
	@Override
	public int delete2(String aname) {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM agency WHERE mname = '" + aname + "'";
		int result = 0;
		result = DbcpPool.executeUpdate(sql);
		DbcpPool.close();
		return result;
	}

	/**
	 * 更新顾客信息
	 */
	@Override
	public int update(String cname, User1 user) {
		String sql = "UPDATE client SET cno=?, cname=?,"
				+ "csex=?,cage=?,caddress=?,cphone=?,"
				+ "csymptom=?,mno=?,ano=?,cdate=?,cremark=? WHERE cname=?";

		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {

			ps.setString(1, user.getCno());
			ps.setString(2, user.getCname());
			ps.setString(3, user.getCsex());
			ps.setInt(4, user.getCage());
			ps.setString(5, user.getCaddress());
			ps.setString(6, user.getCphone());
			ps.setString(7, user.getCsymptom());
			ps.setString(8, user.getMno());
			ps.setString(9, user.getAno());
			ps.setString(10, user.getCdate());
			ps.setString(11, user.getCremark());
			ps.setString(12, cname);
			result = ps.executeUpdate();
			// System.out.println("result:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	/**
	 * 更新药品信息
	 */
	@Override
	public int update(String mname, User user) {
		// TODO Auto-generated method stub
		String sql = "UPDATE medicine SET mno=?, mname=?,"
				+ "mmode=?,mefficacy=? WHERE cname=?";

		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		System.out.println("111111");
		int result = 0;
		try {
			ps.setString(1, user.getMno());
			ps.setString(2, user.getMname());
			ps.setString(3, user.getMmode());
			ps.setString(4, user.getMefficacy());
			ps.setString(5, mname);
			result = ps.executeUpdate();
			// System.out.println("result:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}
    /**
      * 更新经办人信息
      */
	@Override
	public int update(String aname, User2 user) {
		// TODO Auto-generated method stub
		String sql = "UPDATE agency SET ano=?, aname=?,"
				+ "asex=?,aphone=?,aremark=? WHERE aname=?";

		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {

			ps.setString(1, user.getAno());
			ps.setString(2, user.getAname());
			ps.setString(3, user.getAsex());
			ps.setString(4, user.getAphone());
			ps.setString(5, user.getAremark());
			ps.setString(6, aname);
			result = ps.executeUpdate();
			// System.out.println("result:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	/**
	 * 查询药品信息
	 */
	@Override
	public List<User> findAll(String type, String keyword) {
		String sqlSearch = "SELECT * FROM medicine WHERE " + type + " LIKE '%"
				+ keyword + "%'";
		List<User> list = new ArrayList<User>();
		ResultSet rs = DbcpPool.executeQuery(sqlSearch);
		try {
			while (rs.next()) {
				User user = new User();
				user.setMno(rs.getString("mno"));
				user.setMname(rs.getString("mname"));
				user.setMmode(rs.getString("mmode"));
				user.setMefficacy(rs.getString("mefficacy"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return list;
	}

	/**
	 * 查询顾客信息
	 */
	@Override
	public List<User1> findAll1(String type, String keyword) {
		// TODO Auto-generated method stub
		String sqlSearch = "SELECT * FROM client WHERE " + type + " LIKE '%"
				+ keyword + "%'";
		List<User1> list = new ArrayList<User1>();
		ResultSet rs = DbcpPool.executeQuery(sqlSearch);
		try {
			while (rs.next()) {
				User1 user = new User1();
				user.setCno(rs.getString("cno"));
				user.setCname(rs.getString("cname"));
				user.setCsex(rs.getString("csex"));
				user.setCage(rs.getInt("cage"));
				user.setCaddress(rs.getString("caddress"));
				user.setCphone(rs.getString("cphone"));
				user.setCsymptom(rs.getString("csymptom"));
				user.setMno(rs.getString("mno"));
				user.setAno(rs.getString("ano"));
				user.setCdate(rs.getString("cdate"));
				user.setCremark(rs.getString("cremark"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return list;
	}
	/**
	 * 查询经办人信息
	 */
	@Override
	public List<User2> findAll2(String type,String keyword) {
		// TODO Auto-generated method stub
		String sqlSearch = "SELECT * FROM agency WHERE " + type + " LIKE '%"
				+ keyword + "%'";
		List<User2> list = new ArrayList<User2>();
		ResultSet rs = DbcpPool.executeQuery(sqlSearch);
		try {
			while (rs.next()) {
				User2 user = new User2();
				user.setAno(rs.getString("ano"));
				user.setAname(rs.getString("aname"));
				user.setAsex(rs.getString("asex"));
				user.setAphone(rs.getString("aphone"));
				user.setAremark(rs.getString("aremark"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return list;
	}
	@Override
	public boolean login(String username, String password) {
		boolean flag = false;
		String sql = "SELECT username,password FROM t_user WHERE username='"
				+ username + "' AND password = '" + password + "'";
		ResultSet rs = DbcpPool.executeQuery(sql);
		try {
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return flag;
	}

	@Override
	public List<User3> findAll3(String type, String keyword) {
		// TODO Auto-generated method stub
		String sqlSearch = "SELECT * FROM shopping WHERE " + type + " LIKE '%"
				+ keyword + "%'";
		List<User3> list = new ArrayList<User3>();
		ResultSet rs = DbcpPool.executeQuery(sqlSearch);
		try {
			while (rs.next()) {
				User3 user = new User3();
				user.setSno(rs.getString("sno"));
				user.setMno(rs.getString("mno"));
				user.setCount(rs.getInt("count"));
				user.setMname(rs.getString("mname"));
				user.setUnitprice(rs.getString("unitprice"));
				user.setMoney(rs.getString("money"));
				user.setCno(rs.getString("cno"));
				user.setAno(rs.getString("ano"));
				user.setStime(rs.getString("stime"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return list;
	}

	@Override
	public int save(String username,String password) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO t_user (username,password)"
				+ "VALUES (?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1,username);
			ps.setString(2,password);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	@Override
	public int save(PUser user) {
		// TODO Auto-generated method stub
		String sql = "INSERT INTO t_user(uno,username,password)"
				+ "VALUES (?,?,?)";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1, user.getUno());
			ps.setString(2, user.getUsername());
			ps.setString(3, user.getPassword());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

	@Override
	public int update1(String password, PUser user,String passworded){
		
		String sql = "UPDATE t_user SET password=? WHERE password=?";
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		int result = 0;
		try {
			ps.setString(1, user.getPassword());
			ps.setString(2,passworded);
			result = ps.executeUpdate();
			// System.out.println("result:" + result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DbcpPool.close();
		return result;
	}

}
