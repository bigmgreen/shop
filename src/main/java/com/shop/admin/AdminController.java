package com.shop.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.GoodsCommentManager;
import com.shop.manager.GoodsManager;
import com.shop.manager.GoodsOrderManager;
import com.shop.manager.UserManager;
import com.shop.model.User;
import com.shop.utils.Code;
import com.shop.utils.Utils;

/**
 * 处理管理端逻辑
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private GoodsManager goodsManager;

	@Autowired
	private GoodsOrderManager goodsOrderManager;

	@Autowired
	private UserManager userManager;

	@Autowired
	private GoodsCommentManager goodsCommentManager;

	/**
	 * 管理员登录页面
	 * 
	 * @return
	 */
	@RequestMapping("/login.html")
	public String login(Model model) {
		model.addAttribute("title", "登录 ");
		return Utils.getAdminUrl("login");
	}

	/**
	 * 管理员登录
	 * 
	 * @return
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	@ResponseBody
	public Code loginDo(@RequestParam("username") String username, @RequestParam("password") String password,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		User user = userManager.validateLoginAdmin(username, password);

		Code code = new Code();

		if (null != user) {
			userManager.loginAdmin(user, request, response);
			code.setCode(0);
			code.setMsg("登录成功");
			return code;
		}

		code.setCode(-1);
		code.setMsg("用户名或者密码错误");
		return code;
	}

	/**
	 * 管理员登出
	 * 
	 * @return
	 */
	@RequestMapping("/logout.admin")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		userManager.userAdminEixt(request, response);
		
		return "redirect:login.html";
	}

	/**
	 * 首页页面信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @return
	 */
	@RequestMapping("/index.admin")
	public String index(Model model) {
		model.addAttribute("title", "首页");

		model.addAttribute("oders", goodsOrderManager.getAllOrder(1, 5));

		model.addAttribute("comments", goodsCommentManager.getAll(1, 5));

		model.addAttribute("goodses", goodsManager.getAll(1, 5));

		model.addAttribute("users", userManager.getAll(1, 5));

		return Utils.getAdminUrl("index");
	}

	/**
	 * 用户列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/users.admin")
	public String users(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "8") int pageSize,
			Model model) {
		model.addAttribute("title", "用户列表");

		model.addAttribute("list", userManager.getAll(pageIndex, pageSize));
		model.addAttribute("pageCount", (userManager.getAllCount() + pageSize - 1) / pageSize);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);

		return Utils.getAdminUrl("users");
	}

	/**
	 * 回复评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/userdel.admin")
	@ResponseBody
	public Code userdel(@RequestParam long id) {
		boolean status = userManager.delete(id);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 商品列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/goodses.admin")
	public String goodses(@RequestParam(defaultValue = "1") int pageIndex,
			@RequestParam(defaultValue = "8") int pageSize, Model model) {
		model.addAttribute("title", "商品列表");
		// model.addAttribute("kw", kw);
		// model.addAttribute("list", goodsManager.getGoodsList(kw, pageIndex,
		// pageSize));
		// model.addAttribute("pageCount", (goodsManager.getGoodsCountBykw(kw) +
		// pageSize - 1) / pageSize);
		// model.addAttribute("pageIndex", pageIndex);
		// model.addAttribute("pageSize", pageSize);

		return Utils.getAdminUrl("goodses");
	}

	/**
	 * 评价列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/comments.admin")
	public String comments(@RequestParam(defaultValue = "1") int pageIndex,
			@RequestParam(defaultValue = "8") int pageSize, Model model) {
		model.addAttribute("title", "评价列表");

		model.addAttribute("list", goodsCommentManager.getAll(pageIndex, pageSize));
		model.addAttribute("pageCount", (goodsCommentManager.getAllCount() + pageSize - 1) / pageSize);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);

		return Utils.getAdminUrl("comments");
	}

	/**
	 * 回复评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentappend.admin")
	@ResponseBody
	public Code append(@RequestParam long id, @RequestParam String txt, HttpServletRequest request, Model model) {
		boolean status = goodsCommentManager.appendComment(id, txt, "管理员");

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 订单列表
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/orders.admin")
	public String orders(@RequestParam(defaultValue = "1") int pageIndex,
			@RequestParam(defaultValue = "8") int pageSize, Model model) {
		model.addAttribute("title", "订单列表");

		model.addAttribute("list", goodsOrderManager.getAllOrder(pageIndex, pageSize));
		model.addAttribute("pageCount", (goodsOrderManager.getAllOrderCount() + pageSize - 1) / pageSize);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);

		return Utils.getAdminUrl("orders");
	}

	/**
	 * 根据id更新订单
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderupdate.admin")
	@ResponseBody
	public Code orderupdate(@RequestParam long id) {
		boolean status = goodsOrderManager.updateOrder(id, 2);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}
}
