package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.User;

/**
 * 用户操作
 * 
 * @author admin
 * 
 */
public interface UserDao {
	/**
	 * 增加用户
	 * 
	 * @param user
	 *            新增加的用户
	 * @throws Exception
	 */
	public void addUser(User user) throws Exception;

	/**
	 * 通过id获取用户数据
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	public User getUser(long userId);

	/**
	 * 管理员获取所有用户
	 * 
	 * @return
	 */
	public List<User> getAllUser();
	
	/**
	 * 获取所有用户
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAll(@Param("start") int start, @Param("end") int end);

	/**
	 * 更新用户数据
	 * 
	 * @param user
	 *            更新的数据
	 * @throws Exception
	 */
	public void updateUser(User user);

	/**
	 * 删除用户数据
	 * 
	 * @param userId
	 *            用户id
	 * @throws Exception
	 */
	public void deleteUser(long userId);

	/**
	 * 通过Email过得用户
	 * 
	 * @param email
	 *            邮箱
	 * @return
	 */
	public User getUserByEmail(String email);

	/**
	 * 通过姓名获得用户
	 * 
	 * @param name
	 *            姓名
	 * @return
	 */
	public User getUserByName(String name);

	/**
	 * 修改用户地址
	 * 
	 * @param addess
	 *            地址信息
	 */
	public void address(User user) throws Exception;

	/**
	 * 获取管理员
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public User getAdmin(@Param("username") String username, @Param("password") String password);
}
