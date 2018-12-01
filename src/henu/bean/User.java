package henu.bean;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import henu.utils.DbcpPool;

public class User {
	/**
	 * 依据数据表结构，声明成员变量
	 */
	private String mno;
	private String mname;
	private String mmode;
	private String mefficacy;

	/**
	 * 无参构造方法
	 */
	public User() {
	}

	/**
	 * 用户注册功能
	 * 
	 * @param user
	 * @return 注册成功返回true，否则返回false
	 */
	public boolean regist(User user) {
		String sql = "INSERT INTO tb_users(mname,mno,mmode,mefficacy)VALUES(?,?,?,?)";
		int result = 0;
		// 调用henu.util.DbUtil工具类的方法创建PreparedStatement对象
		PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
		try {
			ps.setString(1, user.getMname());
			ps.setString(2, user.getMno());
			ps.setString(3, user.getMmode());
			ps.setString(4, user.getMefficacy());
			result = ps.executeUpdate();
			DbcpPool.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result > 0)
			return true;
		else
			return false;
	}

	/**
	 * 为属性提供setter和getter方法，public类型
	 */

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMmode() {
		return mmode;
	}

	public void setMmode(String mmode) {
		this.mmode = mmode;
	}

	public String getMefficacy() {
		return mefficacy;
	}

	public void setMefficacy(String mefficacy) {
		this.mefficacy = mefficacy;
	}

	// public String toString() {
	// return "User [fd_username=" + fd_username + ", fd_password=" +
	// fd_password + ", fd_usertype=" + fd_usertype
	// + ", fd_gender=" + fd_gender + ", fd_hobby=" + fd_hobby +
	// ", fd_birthdate=" + fd_birthdate
	// + ", fd_email=" + fd_email + ", fd_introduction=" + fd_introduction +
	// "]";
	// }

}
