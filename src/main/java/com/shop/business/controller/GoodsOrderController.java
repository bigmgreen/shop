package com.shop.business.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.GoodsManager;
import com.shop.manager.GoodsOrderManager;
import com.shop.manager.UserManager;
import com.shop.utils.Code;
import com.shop.utils.Utils;

/**
 * 处理业务端商品订单逻辑
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/shop")
public class GoodsOrderController {

	@Autowired
	private GoodsOrderManager goodsOrderManager;
	@Autowired
	private UserManager userManager;

	/**
	 * 生成订单
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/buy.user", method = RequestMethod.POST)
	@ResponseBody
	public Code buy(@RequestParam long goodsid, @RequestParam int count, @RequestParam String color,
			@RequestParam String size, HttpServletRequest request) {

		boolean status = goodsOrderManager.addOrder(goodsid, userManager.getUser(request).getId(), count, color, size);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 查询当前用户的订单信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @return
	 */
	@RequestMapping("/orders")
	public String list(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "8") int pageSize,
			@RequestParam(defaultValue = "0") int type, HttpServletRequest request, Model model) {
		model.addAttribute("title", "我的订单 | ");

		long userid = userManager.getUser(request).getId();

		if (type == 0) {
			model.addAttribute("list", goodsOrderManager.getAllOrder(userid, pageIndex, pageSize));
			model.addAttribute("pageCount", (goodsOrderManager.getOrderCount(userid) + pageSize - 1) / pageSize);
		} else {
			model.addAttribute("list", goodsOrderManager.getOrderByType(userid, type, pageIndex, pageSize));
			model.addAttribute("pageCount",
					(goodsOrderManager.getOrderCountByType(userid, type) + pageSize - 1) / pageSize);
		}

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("type", type);

		return Utils.getBusinessUrl("order-list");
	}

	/**
	 * 根据id更新当前用户的订单
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderupdate")
	@ResponseBody
	public Code orderupdate(@RequestParam long id) {
		boolean status = goodsOrderManager.updateOrder(id);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 根据id删除当前用户的订单
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/orderdel")
	@ResponseBody
	public Code orderdel(@RequestParam long id) {
		boolean status = goodsOrderManager.delOrder(id);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}
}
