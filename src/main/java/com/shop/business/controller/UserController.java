package com.shop.business.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.UserManager;
import com.shop.model.User;
import com.shop.utils.Code;
import com.shop.utils.Utils;

/**
 * 处理业务端用户登录/注册/密码重置/用户信息更新
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/shop")
public class UserController {

	@Autowired
	private UserManager userManager;

	/**
	 * 用户登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Model model) {
		model.addAttribute("title", "用户登录 | ");
		return Utils.getBusinessUrl("login");
	}

	/**
	 * 用户登录页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Code loginDo(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		User user = new User();
		user.setName(username);
		user.setEmail(username);
		user.setPassword(password);

		Code code = new Code();

		if (0 == userManager.validateLogin(user)) {
			userManager.login(user, request, response);
			code.setCode(0);
			code.setMsg("登录成功");
			return code;
		}

		code.setCode(-1);
		code.setMsg("用户名或者密码错误");
		return code;
	}

	/**
	 * 用户注册页面
	 * 
	 * @return
	 */
	@RequestMapping("/register")
	public String register(Model model) {
		model.addAttribute("title", "注册 | ");
		return Utils.getBusinessUrl("register");
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	@ResponseBody
	public Code registerDo(@RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("password") String password, Model model, HttpServletRequest request,
			HttpServletResponse response) {

		User user = new User();
		user.setName(username);
		user.setEmail(email);
		user.setPassword(password);

		Code code = new Code();

		if (userManager.validate_name(username)) {
			code.setCode(-1);
			code.setMsg("用户名重复");
			return code;
		}

		if (userManager.validate_email(email)) {
			code.setCode(-1);
			code.setMsg("邮箱重复");
			return code;
		}

		userManager.register(user, request, response);
		code.setCode(0);
		code.setMsg("注册成功");
		return code;
	}

	/**
	 * 用户密码重置页面
	 * 
	 * @return
	 */
	@RequestMapping("/resetpwd")
	public String resetPwd(HttpServletRequest request, Model model) {

		model.addAttribute("title", "密码重置 | ");
		return Utils.getBusinessUrl("reset-pwd");
	}

	/**
	 * 用户密码重置
	 * 
	 * @return
	 */
	@RequestMapping(value = "/resetpwd.do", method = RequestMethod.POST)
	@ResponseBody
	public Code resetPwdDo(@RequestParam("email") String email, @RequestParam("password") String password, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		User user = userManager.getUserByEmail(email);
		Code code = new Code();
		if (null != user) {
			user.setPassword(password);
			userManager.updateUser(user);
			code.setCode(0);
			code.setMsg("重置成功");
		} else {
			code.setCode(-1);
			code.setMsg("这个邮箱没有注册");
		}

		return code;
	}

	/**
	 * 用户退出
	 * 
	 * @return
	 */
	@RequestMapping("/userlogout.user")
	public String userlogout(HttpServletRequest request, HttpServletResponse response, Model model) {
		userManager.userEixt(request, response);
		return "redirect:login.html";
	}

	/**
	 * 用户信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String userinfo(HttpServletRequest request, Model model) {
		model.addAttribute("title", "用户信息 | ");

		User user = userManager.getUser(request);
		model.addAttribute("user", user);

		return Utils.getBusinessUrl("userinfo");
	}

	/**
	 * 用户信息更新
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userinfo.do", method = RequestMethod.POST)
	@ResponseBody
	public Code userinfoDo(@RequestParam("postcode") String postcode, @RequestParam("address") String address,
			HttpServletRequest request, HttpServletResponse response, Model model) {

		Code code = new Code();
		User user = userManager.getUser(request);

		if (null != user) {
			user.setPostelcode(postcode);
			user.setAddress(address);

			userManager.updateUser(user);
			userManager.login(user, request, response);
			code.setCode(0);
		} else {
			code.setCode(-1);
			code.setMsg("登录超时，请重新登录");
		}
		return code;
	}
}
