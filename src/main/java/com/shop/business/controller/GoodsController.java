package com.shop.business.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.GoodsManager;
import com.shop.manager.UserManager;
import com.shop.model.User;
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

	@Autowired
	private UserManager userManager;

	/**
	 * 首页页面信息
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
	 * 搜索列表页面信息
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
	 * 商品页面信息
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
	 * 判断支付信息
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("/getpay")
	@ResponseBody
	public Code getpay(HttpServletRequest request) {
		Code code = new Code();

		User user = userManager.getUser(request);
		boolean status = true;
		if (null == user.getAddress() || null == user.getPostelcode()) {
			status = false;
		}

		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
			code.setMsg("支付信息不完整，请先完善支付信息");
		}

		return code;
	}

	/**
	 * 支付页面信息
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping("/pay")
	public String pay(@RequestParam long goodsid, @RequestParam int count, @RequestParam String color,
			@RequestParam String size, Model model) {
		model.addAttribute("title", "支付 | ");
		// TODO: 加 token
		model.addAttribute("goods", goodsManager.getGoodsById(goodsid));
		model.addAttribute("count", count);
		model.addAttribute("color", color);
		model.addAttribute("size", size);

		return Utils.getBusinessUrl("pay");
	}

	/**
	 * 添加购物车
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/addcar.user", method = RequestMethod.POST)
	@ResponseBody
	public Code addcar(@RequestParam long goodsid, @RequestParam int count, @RequestParam String color,
			@RequestParam String size, HttpServletRequest request) {

		boolean status = goodsManager.addCar(goodsid, userManager.getUser(request).getId(), count, color, size);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 查询当前用户的购物车情况
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @param type
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/carlist")
	public String list(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "8") int pageSize,
			HttpServletRequest request, Model model) {
		model.addAttribute("title", "我的购物车 | ");

		long userid = userManager.getUser(request).getId();

		model.addAttribute("list", goodsManager.getAllCar(userid, pageIndex, pageSize));
		model.addAttribute("pageCount", (goodsManager.getCarCount(userid) + pageSize - 1) / pageSize);

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);

		return Utils.getBusinessUrl("carlist");
	}
	
	/**
	 * 根据id删除当前用户的购物车记录
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/cardel.user")
	@ResponseBody
	public Code cardel(@RequestParam long id) {
		boolean status = goodsManager.delCar(id);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}
	
	/**
	 * 当前用户的购物车结算
	 * 
	 * @param ids
	 * @param model
	 * @return
	 */
	@RequestMapping("/carbuy.user")
	@ResponseBody
	public Code carbuy(@RequestParam String ids) {
		boolean status = goodsManager.carbuy(ids.split(","));
		
		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}
}
