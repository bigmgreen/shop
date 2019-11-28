package com.shop.manager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.model.User;
import com.shop.service.UserService;
import com.shop.utils.Utils;

@Component
public class UserManager {
	@Autowired
	private UserService userService;

	/**
	 * 登录操作
	 * 
	 * @param user
	 *            登录用户
	 * 
	 * @return 3 成功 2 后台报错
	 */
	public boolean login(User user, HttpServletRequest request, HttpServletResponse response) {
		User user_validate = getUserByNameOrEmail(user);
		if (user_validate != null) {
			if (user.getPassword().equals(user_validate.getPassword())) {
				request.getSession().setAttribute("name", user_validate.getName());
				request.getSession().setAttribute("id", user.getId());

				request.getSession().setAttribute(user_validate.getId() + "", user_validate.getName());
				Cookie cookie = new Cookie("userId", user_validate.getId() + "");
				cookie.setPath("/");
				response.addCookie(cookie);
				return true;
			}
		}
		return false;
	}

	/**
	 * 注册操作
	 * 
	 * @param user
	 *            注册用户
	 * 
	 * @return 1 成功 2 后台报错 3 用户重名 4 邮箱重复
	 */
	public boolean register(User user, HttpServletRequest request, HttpServletResponse response) {
		try {
			userService.register(user);
			request.getSession().setAttribute("name", user.getName());
			request.getSession().setAttribute("id", user.getId());

			request.getSession().setAttribute(user.getId() + "", user.getName());
			Cookie cookie = new Cookie("userId", user.getId() + "");
			cookie.setPath("/");
			response.addCookie(cookie);

			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

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
					cookieName = (String) request.getSession().getAttribute(c.getValue());
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
	 * 姓名的重复验证
	 *
	 * @param user
	 *            被验证的用户
	 * @param flag
	 * @return
	 */
	public boolean validate_name(String name) {
		return null != userService.getUserByName(name);
	}

	/**
	 * 邮箱的重复验证
	 * 
	 * @param email
	 * @return
	 */
	public boolean validate_email(String email) {
		return null != userService.getUserByEmail(email);
	}

	/**
	 * 用户的登录验证
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
	 * 管理员的登录验证
	 * 
	 * @param userName
	 * @param password
	 * @return
	 */
	public User validateLoginAdmin(String userName, String password) {
		return userService.getAdmin(userName, password);
	}

	/**
	 * 管理员登录操作
	 * 
	 * @param user
	 *            登录用户
	 * 
	 * @return 3 成功 2 后台报错
	 */
	public void loginAdmin(User user, HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("adminName", user.getName());
		request.getSession().setAttribute("adminId", user.getId());

		request.getSession().setAttribute("adminUserId", user.getId());
		Cookie cookie = new Cookie("adminUserId", user.getId().toString());
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	/**
	 * 管理员退出系统
	 * 
	 * @param request
	 *            清理session
	 * @param response
	 *            清理cookie
	 * @return
	 */
	public int userAdminEixt(HttpServletRequest request, HttpServletResponse response) {
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (Cookie c : cookies) {
					if ("adminUserId".equals(c.getName())) {
						request.getSession().removeAttribute("adminName");
						request.getSession().removeAttribute("adminId");
						request.getSession().setAttribute(c.getValue(), "");
						break;
					}
				}
			}
			Cookie cookie = new Cookie("adminUserId", null);
			cookie.setPath("/");
			response.addCookie(cookie);
		} catch (Exception e) {
			return 2;
		}
		return 4;
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
	 * 通过姓名获得用户
	 * 
	 * @param user
	 *            验证用户
	 * @return
	 */
	public User getUserByName(String name) {
		return userService.getUserByName(name);
	}

	/**
	 * 通过邮箱获得用户
	 * 
	 * @param user
	 *            验证用户
	 * @return
	 */
	public User getUserByEmail(String email) {
		return userService.getUserByEmail(email);
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
	public boolean delete(long id) {
		try {
			userService.delete(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	/**
	 * 获取所有注册用户
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAll(int pageIndex, int pageSize) {
		List list = userService.getAll(pageIndex, pageSize);
		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}
		return list;
	}

	/**
	 * 获取所有注册用户总数
	 * 
	 * @return
	 */
	public int getAllCount() {
		return userService.getAllCount();
	}

}
