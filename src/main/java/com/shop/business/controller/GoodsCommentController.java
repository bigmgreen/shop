package com.shop.business.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.utils.Utils;

/**
 * 处理业务端商品评论逻辑
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/shop")
public class GoodsCommentController {

	/**
	 * 评论列表信息
	 * 
	 * @param pageIndex
	 * @param model
	 * @return
	 */
	@RequestMapping("/comments")
	public String list(@RequestParam(defaultValue = "1") int pageIndex, Model model) {
		model.addAttribute("list", null);

		return Utils.getBusinessUrl("list");
	}

	/**
	 * 评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/comment")
	public String detail(@RequestParam long id, Model model) {
		model.addAttribute("comment", null);

		return Utils.getBusinessUrl("detail");
	}

	/**
	 * 添加评论信息
	 * 
	 * @param goodsId
	 * @param txt
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentadd")
	public String add(@RequestParam long goodsId, @RequestParam String txt, Model model) {
		model.addAttribute("comment", null);

		return Utils.getBusinessUrl("detail");
	}

	/**
	 * 删除评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentdel")
	public String del(@RequestParam long id, Model model) {
		return Utils.getBusinessUrl("detail");
	}

	/**
	 * 回复评论信息
	 * 
	 * @param goodsId
	 * @param commentId
	 * @param index
	 * @param txt
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentappend")
	public String append(@RequestParam long goodsId, @RequestParam long commentId, @RequestParam int index,
			@RequestParam String txt, Model model) {
		model.addAttribute("comment", null);

		return Utils.getBusinessUrl("detail");
	}
}
