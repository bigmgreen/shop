package com.shop.service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.shop.model.User;
import com.shop.utils.BaseService;

/**
 * user 业务处理类
 * 
 * @author admin
 * 
 */
@Service
public class UserService extends BaseService {

	/** users列表缓存 */
	public List<User> users;

	/**
	 * 通过userId获取用户
	 * 
	 * @param userId
	 *            用户id
	 * @return
	 */
	public User getUserById(long userId) {
		User user = getUserDao().getUser(userId);
		session.close();
		return user;
	}

	/***
	 * 通过姓名查找用户
	 * 
	 * @param name
	 *            姓名
	 * @return
	 */
	public User getUserByName(String name) {
		User user = getUserDao().getUserByName(name);
		session.close();
		return user;
	}

	/***
	 * 通过邮箱查找用户
	 * 
	 * @param email
	 *            邮箱
	 * @return
	 */
	public User getUserByEmail(String email) {
		User user = getUserDao().getUserByEmail(email);
		session.close();
		return user;
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 *            新注册的用户
	 * @throws Exception
	 */
	public void register(User user) throws Exception {
		getUserDao().addUser(user);
		session.commit();
		session.close();
	}

	/**
	 * 修改用户地址
	 * 
	 * @param addess
	 *            地址信息
	 */
	public void address(User user) throws Exception {
		getUserDao().address(user);
		session.commit();
		session.close();
	}

	/**
	 * 获取所有用户
	 * 
	 * @param user
	 * 
	 * @return
	 */
	public List<User> getAllUser() {
		if (users == null) {
			users = getUserDao().getAllUser();
		}
		session.close();
		return users;
	}

	/**
	 * 用户信息更新
	 * 
	 * @param user
	 */
	public void update(User user) {
		getUserDao().updateUser(user);
		session.commit();
		session.close();
		users = getUserDao().getAllUser();
	}

	/**
	 * 用户删除
	 * 
	 * @param id
	 */
	public void delete(long id) {
		getUserDao().deleteUser(id);
		session.commit();
		session.close();
	}

	/**
	 * 获取管理员
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public User getAdmin(String userName, String password) {
		User user = getUserDao().getAdmin(userName, password);

		session.close();
		return user;
	}

}
