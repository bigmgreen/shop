package com.shop.business.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.business.manager.UserManager;
import com.shop.business.model.User;
import com.shop.utils.Code;
import com.shop.utils.Utils;

/**
 * 处理业务端用户登录/注册/密码重置
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
	 * 用户信息
	 * 
	 * @return
	 */
	@RequestMapping("/userinfo")
	public String userinfo(Model model) {
		model.addAttribute("title", "用户信息 | ");
		return Utils.getBusinessUrl("userinfo");
	}

	/**
	 * 用户登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login")
	public String login() {
		return Utils.getBusinessUrl("login");
	}

	/**
	 * 用户登录
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
	// /**
	// * 用户登录
	// * @return
	// */
	//// @RequestMapping("/login/{name}")
	// @RequestMapping("/login")
	// public String login() {
	//// public String login(@PathVariable("name") String name) {
	// return Utils.getBusinessUrl("login");
	// }

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	@RequestMapping("/register")
	public String register() {
		return Utils.getBusinessUrl("register");
	}

	/**
	 * 用户密码重置
	 * 
	 * @return
	 */
	@RequestMapping("/resetpwd")
	public String resetPwd(Model model) {
		model.addAttribute("title", "密码重置 | ");
		return Utils.getBusinessUrl("reset-pwd");
	}

	/**
	 * 用户信息更新
	 * 
	 * @return
	 */
	@RequestMapping(value = "/userinfo.do", method = RequestMethod.POST)
	public String userinfoDo(@RequestParam("userinfo") String userinfo, Model model) {
		// TODO: 返回上一个页面
		model.addAttribute("userName", "zx");
		return Utils.getBusinessUrl("index");
	}

	/**
	 * 用户注册
	 * 
	 * @return
	 */
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String registerDo(@ModelAttribute User user) {
		return Utils.getBusinessUrl("index");
	}

	/**
	 * 用户密码重置
	 * 
	 * @return
	 */
	@RequestMapping(value = "/resetpwd.do", method = RequestMethod.POST)
	public String resetPwdDo() {
		return Utils.getBusinessUrl("login");
	}
}
