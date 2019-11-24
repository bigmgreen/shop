package com.shop.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.manager.GoodsManager;
import com.shop.utils.Utils;

/**
 * 处理业务端商品逻辑
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/shop")
public class GoodsController {

	@Autowired
	private GoodsManager goodsManager;

	/**
	 * 首页信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(@RequestParam(defaultValue = "1") int pageIndex, Model model) {
		if (1 == pageIndex) {
			model.addAttribute("banner", goodsManager.getBanners());
		}

		model.addAttribute("list", goodsManager.getIndexList(pageIndex));

		return Utils.getBusinessUrl("index");
	}

	/**
	 * 搜索列表信息
	 * 
	 * @param pageIndex
	 * @param kw
	 * @param model
	 * @return
	 */
	@RequestMapping("/list")
	public String list(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "") String kw, Model model) {
		model.addAttribute("list", goodsManager.getGoodsList(pageIndex, kw));

		return Utils.getBusinessUrl("list");
	}

	/**
	 * 商品信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(@RequestParam long id, Model model) {
		model.addAttribute("goods", goodsManager.getGoodsById(id));
		model.addAttribute("comments", goodsManager.getGoodsCommentsById(id));

		return Utils.getBusinessUrl("detail");
	}
}
