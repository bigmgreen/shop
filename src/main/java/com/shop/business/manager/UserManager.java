package com.shop.business.manager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.business.model.User;
import com.shop.utils.Utils;

@Component
public class UserManager {
	@Autowired
	private com.shop.business.service.UserService userService;

	/**
	 * 获取所有用户
	 * 
	 * @param user
	 *            管理员
	 * @return
	 */
	public List<User> getAllUser() {
		return userService.getAllUser();
	}
	
	/**
	 * 获取所有用户
	 * 
	 * @param user
	 *            管理员
	 * @return
	 */
	public List<User> getUserByPage(int curr) {
		List<User> users = userService.getAllUser();
		List<User> tempUsers = new ArrayList<User>();
		int length = users.size();
		int pageSize = 10;
		for (int i = (curr - 1) * pageSize; i < curr * pageSize && i < length; i++) {
			tempUsers.add(users.get(i));
		}
		return tempUsers;
	}

	/**
	 * 获取登录用户
	 * 
	 * @param name
	 *            用户名
	 * @param email
	 *            邮箱
	 * @return
	 */
	public User getUser(HttpServletRequest request) {
		User user = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			String cookieName = null;
			for (Cookie c : cookies) {
				if ("userId".equals(c.getName())) {
					cookieName = (String) request.getSession().getAttribute(
							c.getValue());
					break;
				}
			}
			if (cookieName != null) {
				user = userService.getUserByName(cookieName);
			}
		}
		return user;
	}

	/**
	 * 注册操作
	 * 
	 * @param user
	 *            注册用户
	 * 
	 * @return 1 成功 2 后台报错 3 用户重名 4 邮箱重复
	 */
	public int register(User user, HttpServletRequest request,
			HttpServletResponse response) {
		int flag = 1;
		flag = validate_name(user.getName(), flag);
		flag = validate_name(user.getEmail(), flag);
		try {
			userService.register(user);
			user = userService.getUserByName(user.getName());
			request.getSession()
					.setAttribute(user.getId() + "", user.getName());
			Cookie cookie = new Cookie("userId", user.getId() + "");
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch (Exception e) {
			flag = 2;
		}
		return flag;
	}

	/**
	 * 姓名的重复验证
	 * 
	 * @param user
	 *            被验证的用户
	 * @param flag
	 * @return
	 */
	public int validate_name(String name, int flag) {
		User user_name = userService.getUserByName(name);
		if (user_name != null) {
			return flag = 3;
		}
		return flag;
	}

	/**
	 * 邮箱的重复验证
	 * 
	 * @param user
	 *            被验证的用户
	 * @param flag
	 * @return
	 */
	public int validate_email(String email, int flag) {
		User user_email = userService.getUserByEmail(email);
		if (user_email != null) {
			return flag = 4;
		}
		return flag;
	}
	
	/**
	 * 姓名的重复验证
	 * 
	 * @param user
	 *            被验证的用户
	 * @param flag
	 * @return
	 */
	public int validate_name(long id, String name, int flag) {
		User user_name = userService.getUserByName(name);
		if (user_name != null && user_name.getId() != id) {
			return flag = 3;
		}
		return flag;
	}

	/**
	 * 邮箱的重复验证
	 * 
	 * @param user
	 *            被验证的用户
	 * @param flag
	 * @return
	 */
	public int validate_email(long id, String email, int flag) {
		User user_email = userService.getUserByEmail(email);
		if (user_email != null && user_email.getId() != id) {
			return flag = 4;
		}
		return flag;
	}

	/**
	 * 用户的登陆验证
	 * 
	 * @param user
	 *            被验证的用户
	 * @return
	 */
	public int validateLogin(User user) {
		if (user != null) {
			User user_validate = getUserByNameOrEmail(user);
			if (user_validate != null) {
				if (user_validate.getPassword().equals(user.getPassword())) {
					return 0;
				}
			}
		}
		return 1;
	}

	/**
	 * 通过邮箱或者姓名获得用户
	 * 
	 * @param user
	 *            验证用户
	 * @return
	 */
	private User getUserByNameOrEmail(User user) {
		User user_validate = userService.getUserByName(user.getName());
		if (user_validate == null) {
			user_validate = userService.getUserByEmail(user.getEmail());
		}
		return user_validate;
	}

	/**
	 * 登陆操作
	 * 
	 * @param user
	 *            登陆用户
	 * 
	 * @return 3 成功 2 后台报错
	 */
	public int login(User user, HttpServletRequest request,
			HttpServletResponse response) {
		User user_validate = getUserByNameOrEmail(user);
		if (user_validate != null) {
			if (user.getPassword().equals(user_validate.getPassword())) {
				request.getSession().setAttribute("name", user_validate.getName());
				request.getSession().setAttribute("id", user_validate.getName());
				
				request.getSession().setAttribute(user_validate.getId() + "", user_validate.getName());
				Cookie cookie = new Cookie("userId", user_validate.getId() + "");
				cookie.setPath("/");
				response.addCookie(cookie);
				return 3;
			}
		}
		return 2;
	}

	/**
	 * 用户退出系统
	 * 
	 * @param request
	 *            清理session
	 * @param response
	 *            清理cookie
	 * @return
	 */
	public int userEixt(HttpServletRequest request, HttpServletResponse response) {
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if ("userId".equals(c.getName())) {
						request.getSession().removeAttribute("name");
						request.getSession().removeAttribute("id");
						request.getSession().setAttribute(c.getValue(), "");
						break;
					}
				}
			}
			Cookie cookie = new Cookie("userId", null);
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch (Exception e) {
			return 2;
		}
		return 4;
	}

	/**
	 * 修改用户地址
	 * 
	 * @param addess
	 *            地址信息
	 */
	public void address(HttpServletRequest request, String address) {
		long userId = Utils.getUserId(request);
		User user = userService.getUserById(userId);
		if (user != null) {
			try {
				user.setAddress(address);
				userService.address(user);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 通过id获取用户
	 * 
	 * @param id
	 * @return
	 */
	public User getUserById(long id) {
		return userService.getUserById(id);
	}

	/**
	 * 用户信息更新
	 * 
	 * @param user
	 */
	public void updateUser(User user) {
		userService.update(user);
	}

	/**
	 * 用户删除
	 * 
	 * @param id
	 */
	public void delete(long id) {
		userService.delete(id);
	}
}
