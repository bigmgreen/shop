package com.shop.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.GoodsManager;
import com.shop.utils.Code;
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
	public String index(Model model) {
		model.addAttribute("banner", goodsManager.getBanners());

		model.addAttribute("hotlist", goodsManager.getHotList());

		model.addAttribute("list", goodsManager.getIndexList());

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
	public String list(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "8") int pageSize,
			@RequestParam(defaultValue = "") String kw, Model model) {
		model.addAttribute("kw", kw);
		model.addAttribute("list", goodsManager.getGoodsList(kw, pageIndex, pageSize));
		model.addAttribute("pageCount", (goodsManager.getGoodsCountBykw(kw) + pageSize - 1) / pageSize);
		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);

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

	/**
	 * 购买商品
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping("/buy.user")
	@ResponseBody
	public Code buy(@RequestParam long goodsid, @RequestParam int count, @RequestParam String color,
			@RequestParam String size, Model model) {
		Code code = new Code();
		
		code.setCode(0);

		return code;
	}

	/**
	 * 查询当前用户的购物车情况
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/carlist")
	public String carList(Model model) {
		model.addAttribute("title", "我的购物车 | ");

		return Utils.getBusinessUrl("carlist");
	}
}
