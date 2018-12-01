package henu.bean;

import henu.utils.DbcpPool;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class User1 {
		private String cno;
		private String cname;
		private String csex;
		private int cage;
		private String caddress;
		private String cphone;
		private String csymptom;
		private String mno;
		private String ano;
		private String cremark;
		private String cdate;
		public String getMno() {
			return mno;
		}
		public void setMno(String mno) {
			this.mno = mno;
		}
		public String getAno() {
			return ano;
		}
		public void setAno(String ano) {
			this.ano = ano;
		}
		public String getCremark() {
			return cremark;
		}
		public void setCremark(String cremark) {
			this.cremark = cremark;
		}
		public String getCdate() {
			return cdate;
		}
		public void setCdate(String cdate) {
			this.cdate = cdate;
		}
		public String getCno() {
			return cno;
		}
		public void setCno(String cno) {
			this.cno = cno;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public String getCsex() {
			return csex;
		}
		public void setCsex(String csex) {
			this.csex = csex;
		}
		public int getCage() {
			return cage;
		}
		public void setCage(int cage) {
			this.cage = cage;
		}
		public String getCaddress() {
			return caddress;
		}
		public void setCaddress(String caddress) {
			this.caddress = caddress;
		}
		public String getCphone() {
			return cphone;
		}
		public void setCphone(String cphone) {
			this.cphone = cphone;
		}
		public String getCsymptom() {
			return csymptom;
		}
		public void setCsymptom(String csymptom) {
			this.csymptom = csymptom;
		}
		public boolean regist(User1 user1) {
String sql = "INSERT INTO tb_user1s(cno,cname,csex,cage,caddress,cphone,csymptom,mno,ano,cdate,cremark)VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			int result = 0;
			// 调用henu.util.DbUtil工具类的方法创建PreparedStatement对象
			PreparedStatement ps = DbcpPool.executePreparedStatement(sql);
			try {
				ps.setString(1, user1.getCno());
				ps.setString(2, user1.getCname());
				ps.setString(3, user1.getCsex());
				ps.setInt(4, user1.getCage());
				ps.setString(5, user1.getCaddress());
				ps.setString(6, user1.getCphone());
				ps.setString(7, user1.getCsymptom());
				ps.setString(8, user1.getMno());
				ps.setString(9, user1.getAno());
				ps.setString(10, user1.getCdate());
				ps.setString(11, user1.getCremark());
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
}
