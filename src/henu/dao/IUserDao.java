package henu.dao;

import henu.bean.PUser;
import henu.bean.User1;
import henu.bean.User;
import henu.bean.User2;
import henu.bean.User3;

import java.util.List;

public interface IUserDao {
	/**
	 * �û���¼
	 * 
	 * @param username
	 *            �û���
	 * @param password
	 *            ����
	 * @return ����¼�ɹ�����true������false
	 */
	public boolean login(String username, String password);
	/**
	 * 保存用户人信息
	 * 
	 * @param user
	 *            
	 * @return 
	 */
	public int save(String username,String password);
	/**
	 * 保存经办人信息
	 * 
	 * @param user
	 *            
	 * @return 
	 */
	public int save(User2 user);
	/**
	 * 保存用户
	 * @param user
	 * @return
	 */
	public int save(PUser user);
	/**
	 * 保存顾客信息
	 * 
	 * @param user
	 *            
	 * @return 
	 */
	public int save(User1 user);
	/**
	 * 保存药品信息
	 * 
	 * @param mname
	 *            
	 * @return result
	 */
	public int save(User user);
	/**
	 * 删除经办人信息
	 * 
	 * @param cname
	 *            
	 * @return result
	 */
	public int delete2(String aname);
	/**
	 * 删除顾客信息
	 * 
	 * @param cname
	 *            
	 * @return result
	 */
	public int delete(String cname);
	/**
	 *删除药品信息
	 * 
	 * @param mname
	 *         
	 * @return result
	 */
	public int delete1(String mname);
	/**
	 * 更新用户密码
	 * @param mname
	 * @param user
	 * @return
	 */
	public int update1(String password, PUser user,String passworded);
	/**
	 * 更新药品信息
	 * 
	 * @param mname
	 *           
	 * @param user
	 *            
	 * @return result
	 */
	public int update(String mname, User user);
	/**
	 *
	 * 更新顾客信息
	 * @param mname
	 *            顾客名
	 * @param user
	 *           
	 * @return result
	 */
	public int update(String cname, User1 user);
	/**
	 * 更新经办人信息
	 * @param aname
	 * @param user2
	 */
	public int update(String aname, User2 user);
	/**
	 * 查询药品信息
	 * 
	 * @return List
	 */
	public List<User> findAll(String type,String keyword);
	/**
	 * 查询顾客信息
	 * 
	 * @return List
	 */
	public List<User1> findAll1(String type,String keyword);
	/**
	 * 查询经办人信息
	 * 
	 * @param aname
	 *            经办人
	 * @return User2 
	 */
	public List<User2> findAll2(String type,String keyword);
	/**
	 * 查询购物清单
	 */
	public List<User3> findAll3(String type,String keyword);
}
