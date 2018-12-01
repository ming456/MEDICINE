package henu.servlet;

import henu.bean.PUser;
import henu.bean.User;
import henu.bean.User1;
import henu.bean.User2;
import henu.bean.User3;
import henu.dao.IUserDao;
import henu.factory.DaoFactory;
import henu.utils.DbcpPool;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class U
 */
@WebServlet("/U")
public class U extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public U() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		action(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		action(request, response);
	}

	public void action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("stype");
		if ("login".equals(action)) {
			login(request, response);
		} else if ("add".equals(action)) {// 顾客信息的添加

			add(request, response);

		} else if ("add1".equals(action)) {// 药品信息的添加

			add1(request, response);

		} else if ("add2".equals(action)) {// 经办人的添加

			add2(request, response);

		} else if ("update".equals(action)) {// 更新药品信息

			update(request, response);

		} else if ("update1".equals(action)) {// 更新顾客信息

			update1(request, response);

		} else if ("update2".equals(action)) {// 更新经办人信息

			update2(request, response);

		} else if ("find".equals(action)) {// 查查修改药品

			find(request, response);

		} else if ("find3".equals(action)) {// 浏览药品

			find3(request, response);

		} else if ("find1".equals(action)) {// 查查修改经办人
			find1(request, response);

		} else if ("find2".equals(action)) {// 查查修改药品（入库员）
			find2(request, response);

		} else if ("find4".equals(action)) {// 浏览顾客
			find4(request, response);

		} else if ("find5".equals(action)) {// 浏览经办人

			find5(request, response);

		} else if ("find6".equals(action)) {// 浏览经办人

			find6(request, response);

		} else if ("delete".equals(action)) {// 药品的查修改

			delete(request, response);

		} else if ("delete1".equals(action)) {// 顾客的查修改

			delete1(request, response);

		}

		else if ("delete2".equals(action)) {// 经办人的查修改

			delete2(request, response);

		} else if ("Print".equals(action)) {

			response.sendRedirect("printing/Print.jsp");

		} else if ("Print1".equals(action)) {

			response.sendRedirect("printing/Print1.jsp");

		} else if ("Print2".equals(action)) {

			response.sendRedirect("printing/Print2.jsp");

		} else if ("Print3".equals(action)) {

			response.sendRedirect("printing/Print3.jsp");

		} else if ("add3".equals(action)) {// 添加用户
			add3(request, response);

		} else if ("add4".equals(action)) {// 添加用户
			add4(request, response);

		}

	}

	private void add4(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String passworded = request.getParameter("passworded");
		String password = request.getParameter("password");
		PUser user = new PUser();
		user.setPassword(password);
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		int result=userDao.update1(password, user, passworded);
		if(result!=0){
		response.sendRedirect("input.jsp");}
		else{
			response.sendRedirect("Error/error3.jsp");
		}
	}

	private void add3(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		String uno =request.getParameter("uno");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PUser user = new PUser();
		user.setUno(uno);
		user.setUsername(username);
		user.setPassword(password);
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		int result = userDao.save(user);
		if(result!=0)
		response.sendRedirect("input.jsp");
		else
			response.sendRedirect("Error/error2.jsp");
	}

	private void find6(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
//		String type = request.getParameter("column");
//		String keyword = request.getParameter("value");
//		String sqlSearch = "SELECT * FROM shopping";
//		HttpSession session = request.getSession();
//		StringBuffer sb = new StringBuffer();
//		if (keyword != null) {
//			IUserDao userDao = DaoFactory.getUserDaoInstance();
//			List<User3> list = userDao.findAll3(type, keyword);
//			sb = DbcpPool.sqlsb6(list);
//			// System.out.println(sb.toString());
//			session.setAttribute("search", sb);
//			response.sendRedirect("user/userAdmin3.jsp");
//		} else {
//			String sql = "SELECT * FROM shopping";
//			session.setAttribute("search", DbcpPool.sqlsb6(sql));
//			try {
//				response.sendRedirect("user/userAdmin3.jsp");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		response.sendRedirect("display/display3.jsp");
	}

	/**
	 * 浏览经办人
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find5(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
//		String type = request.getParameter("column");
//		String keyword = request.getParameter("value");
//		String sqlSearch = "SELECT * FROM agency";
//		HttpSession session = request.getSession();
//		StringBuffer sb = new StringBuffer();
//		if (keyword != null) {
//			IUserDao userDao = DaoFactory.getUserDaoInstance();
//			List<User2> list = userDao.findAll2(type, keyword);
//			sb = DbcpPool.sqlsb5(list);
//			// System.out.println(sb.toString());
//			session.setAttribute("search", sb);
//			response.sendRedirect("user/userAdmin2_1.jsp");
//		} else {
//			String sql = "SELECT * FROM agency";
//			session.setAttribute("search", DbcpPool.sqlsb5(sql));
//			try {
//				response.sendRedirect("user/userAdmin2_1.jsp");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		response.sendRedirect("display/display2.jsp");
	}

	/**
	 * 经办人信息添加
	 * 
	 * @param request
	 * @param response
	 */
	private void add2(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		User2 user = new User2();
		String aname = request.getParameter("aname");
		String ano = request.getParameter("ano");
		String asex = request.getParameter("asex");
		String aphone = request.getParameter("aphone");
		String aremark = request.getParameter("aremark");
		user.setAno(ano);
		user.setAname(aname);
		user.setAsex(asex);
		user.setAphone(aphone);
		user.setAremark(aremark);
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		int result = userDao.save(user);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM agency";
			StringBuffer sb = DbcpPool.sqlsb2(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin3.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 药品的添加
	 * 
	 * @param request
	 * @param response
	 */
	private void add(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		User user = new User();
		String mname = request.getParameter("mname");
		String mno = request.getParameter("mno");
		String mmode = request.getParameter("mmode");
		String mefficacy = request.getParameter("mefficacy");
		user.setMno(mno);
		user.setMname(mname);
		user.setMmode(mmode);
		user.setMefficacy(mefficacy);
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		int result = userDao.save(user);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM medicine";
			StringBuffer sb = DbcpPool.sqlsb(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin2.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 录入顾客信息
	 * 
	 * @param request
	 * @param response
	 */
	private void add1(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		User1 user = new User1();
		String cname = request.getParameter("cname");
		String cno = request.getParameter("cno");
		String csex = request.getParameter("csex");
		String cage = request.getParameter("cage");
		String caddress = request.getParameter("caddress");
		String cphone = request.getParameter("cphone");
		String csymptom = request.getParameter("csymptom");
		String mno = request.getParameter("mno");
		String ano = request.getParameter("ano");
		String cdate = request.getParameter("cdate");
		String cremark = request.getParameter("cremark");
		user.setCno(cno);
		user.setCname(cname);
		user.setCsex(csex);
		user.setCage(Integer.parseInt(cage));
		user.setCaddress(caddress);
		user.setCphone(cphone);
		user.setCsymptom(csymptom);
		user.setMno(mno);
		user.setAno(ano);
		user.setCdate(cdate);
		user.setCremark(cremark);
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		int result = userDao.save(user);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM client";
			StringBuffer sb = DbcpPool.sqlsb1(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin1.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 更新药品信息
	 * 
	 * @param request
	 * @param response
	 */
	private void update(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		User user = new User();
		String mname = request.getParameter("mname");
		user.setMno(request.getParameter("mno"));
		user.setMmode(request.getParameter("mmode"));
		user.setMefficacy(request.getParameter("mefficacy"));
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		if (userDao.update(mname, user) > 0) {
			HttpSession session = request.getSession();
			String sql = "SELECT * FROM medicine";
			session.setAttribute("search", DbcpPool.sqlsb(sql));

			try {
				response.sendRedirect("user/userAdmin2.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * 更新经办人信息
	 * 
	 * @param request
	 * @param response
	 */
	private void update2(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		User2 user = new User2();
		String aname = request.getParameter("aname");
		user.setAno(request.getParameter("ano"));
		user.setAsex(request.getParameter("asex"));
		user.setAphone(request.getParameter("aphone"));
		user.setAremark(request.getParameter("aremark"));
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		if (userDao.update(aname, user) > 0) {
			HttpSession session = request.getSession();
			String sql = "SELECT * FROM agency";
			session.setAttribute("search", DbcpPool.sqlsb3(sql));

			try {
				response.sendRedirect("user/userAdmin3.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 更新顾客信息
	 * 
	 * @param request
	 * @param response
	 */
	private void update1(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		User1 user = new User1();
		String cname = request.getParameter("cname");
		user.setCno(request.getParameter("cno"));
		user.setCsex(request.getParameter("csex"));
		user.setCage(Integer.parseInt(request.getParameter("cage")));
		user.setCaddress(request.getParameter("caddress"));
		user.setCphone(request.getParameter("cphone"));
		user.setCsymptom(request.getParameter("csymptom"));
		user.setMno(request.getParameter("mno"));
		user.setAno(request.getParameter("ano"));
		user.setCdate(request.getParameter("cdate"));
		user.setCremark(request.getParameter("cdate"));
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		if (userDao.update(cname, user) > 0) {
			HttpSession session = request.getSession();
			String sql = "SELECT * FROM client";
			session.setAttribute("search", DbcpPool.sqlsb2(sql));

			try {
				response.sendRedirect("user/userAdmin1.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 查修改经办人
	 * 
	 * @param request
	 * @param response
	 */
	private void delete2(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String username = request.getParameter("name");
		int result = DaoFactory.getUserDaoInstance().delete(username);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM agency";
			StringBuffer sb = DbcpPool.sqlsb3(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin3.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 浏览药品 权限:销售员
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find3(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
//		String type = request.getParameter("column");
//		String keyword = request.getParameter("value");
//		String sqlSearch = "SELECT * FROM 'medicine'";
//		HttpSession session = request.getSession();
//		StringBuffer sb = new StringBuffer();
//		if (keyword != null) {
//			IUserDao userDao = DaoFactory.getUserDaoInstance();
//			List<User> list = userDao.findAll(type, keyword);
//			sb = DbcpPool.sqlsb3(list);
//			// System.out.println(sb.toString());
//			session.setAttribute("search", sb);
//			response.sendRedirect("user/userAdmin_1.jsp");
//		} else {
//			String sql = "SELECT * FROM medicine";
//			session.setAttribute("search", DbcpPool.sqlsb3(sql));
//			try {
//				response.sendRedirect("user/userAdmin_1.jsp");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		response.sendRedirect("display/display.jsp");
//		response.sendRedirect("display/index.jsp");
	
	}

	/**
	 * 查看经办人 权限：
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find2(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("column");
		String keyword = request.getParameter("value");
		String sqlSearch = "SELECT * FROM agency";
		HttpSession session = request.getSession();
		StringBuffer sb = new StringBuffer();
		if (keyword != null) {
			IUserDao userDao = DaoFactory.getUserDaoInstance();
			List<User2> list = userDao.findAll2(type, keyword);
			sb = DbcpPool.sqlsb2(list);
			// System.out.println(sb.toString());
			session.setAttribute("search", sb);
			response.sendRedirect("user/userAdmin2.jsp");
		} else {
			String sql = "SELECT * FROM agency";
			session.setAttribute("search", DbcpPool.sqlsb2(sql));
			try {
				response.sendRedirect("user/userAdmin2.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 浏览顾客 权限:销售员
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find4(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
//		String type = request.getParameter("column");
//		String keyword = request.getParameter("value");
//		String sqlSearch = "SELECT * FROM client";
//		HttpSession session = request.getSession();
//		StringBuffer sb = new StringBuffer();
//		if (keyword != null) {
//			IUserDao userDao = DaoFactory.getUserDaoInstance();
//			List<User1> list = userDao.findAll1(type, keyword);
//			sb = DbcpPool.sqlsb4(list);
//			System.out.println(sb.toString());
//			session.setAttribute("search", sb);
//			response.sendRedirect("user/userAdmin1_1.jsp");
//		} else {
//			String sql = "SELECT * FROM client";
//			session.setAttribute("search", DbcpPool.sqlsb4(sql));
//			try {
//				response.sendRedirect("user/userAdmin1_1.jsp");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		response.sendRedirect("display/display1.jsp");
	}

	/**
	 * 查查修改顾客 权限：销售员
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find1(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("column");
		String keyword = request.getParameter("value");
		String sqlSearch = "SELECT * FROM client";
		HttpSession session = request.getSession();
		StringBuffer sb = new StringBuffer();
		if (keyword != null) {
			IUserDao userDao = DaoFactory.getUserDaoInstance();
			List<User1> list = userDao.findAll1(type, keyword);
			sb = DbcpPool.sqlsb1(list);
			System.out.println(sb.toString());
			session.setAttribute("search", sb);
			response.sendRedirect("user/userAdmin1.jsp");
		} else {
			String sql = "SELECT * FROM client";
			session.setAttribute("search", DbcpPool.sqlsb1(sql));
			try {
				response.sendRedirect("user/userAdmin1.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 查查修改药品 权限:销售员
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	private void find(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// TODO Auto-generated method stub
		String type = request.getParameter("column");
		String keyword = request.getParameter("value");
		String sqlSearch = "SELECT * FROM medicine";
		HttpSession session = request.getSession();
		StringBuffer sb = new StringBuffer();
		if (keyword != null) {
			IUserDao userDao = DaoFactory.getUserDaoInstance();
			List<User> list = userDao.findAll(type, keyword);
			sb = DbcpPool.sqlsb(list);
			// System.out.println(sb.toString());
			session.setAttribute("search", sb);
			response.sendRedirect("user/userAdmin.jsp");
		} else {
			String sql = "SELECT * FROM medicine";
			session.setAttribute("search", DbcpPool.sqlsb(sql));
			try {
				response.sendRedirect("user/userAdmin.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 药品的查修改 权限:销售员
	 * 
	 * @param request
	 * @param response
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String username = request.getParameter("name");
		int result = DaoFactory.getUserDaoInstance().delete1(username);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM medicine";
			StringBuffer sb = DbcpPool.sqlsb(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin2.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * 顾客信息的查修改 权限:销售员
	 * 
	 * @param request
	 * @param response
	 */
	private void delete1(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String username = request.getParameter("name");
		int result = DaoFactory.getUserDaoInstance().delete(username);
		if (result > 0) {
			HttpSession session = request.getSession();
			String sqlSearch = "SELECT * FROM client";
			StringBuffer sb = DbcpPool.sqlsb2(sqlSearch);
			session.setAttribute("search", sb);
			try {
				response.sendRedirect("user/userAdmin1.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("error.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		IUserDao userDao = DaoFactory.getUserDaoInstance();
		boolean flag = userDao.login(username, password);

		if (flag) {
			try {
				// response.sendRedirect("index.html");
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				response.sendRedirect("input.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
