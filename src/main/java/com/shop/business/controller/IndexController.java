package com.shop.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shop.utils.Utils;

/**
 * 处理业务端首页
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/shop")
public class IndexController {

	/**
	 * 用户信息
	 * 
	 * @return
	 */
	@RequestMapping("/index")
	public String index(Model model) {
		
		return Utils.getBusinessUrl("index");
	}
}
