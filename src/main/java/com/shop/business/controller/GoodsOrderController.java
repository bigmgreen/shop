package com.shop.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

	/**
	 * 订单列表信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @return
	 */
	@RequestMapping("/orders")
	public String list(@RequestParam(defaultValue = "1") int pageIndex, Model model) {
		model.addAttribute("list", null);

		return Utils.getBusinessUrl("list");
	}

	/**
	 * 订单信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/order")
	public String detail(@RequestParam long id, Model model) {
		model.addAttribute("order", null);

		return Utils.getBusinessUrl("detail");
	}
}
