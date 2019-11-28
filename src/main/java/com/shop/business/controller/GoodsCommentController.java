package com.shop.business.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.manager.GoodsCommentManager;
import com.shop.manager.UserManager;
import com.shop.utils.Code;
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

	@Autowired
	private GoodsCommentManager goodsCommentManager;
	@Autowired
	private UserManager userManager;

	/**
	 * 添加评论信息
	 * 
	 * @param goodsId
	 * @param txt
	 * @param request
	 * @return
	 */
	@RequestMapping("/commentadd.user")
	@ResponseBody
	public Code add(@RequestParam long goodsId, @RequestParam String txt, HttpServletRequest request) {
		boolean status = goodsCommentManager.addComment(goodsId, userManager.getUser(request).getId(), txt);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 查询商品的评论信息
	 * 
	 * @param goodsId
	 * @param pageIndex
	 * @param pageSize
	 * @param model
	 * @return
	 */
	@RequestMapping("/comments.user")
	public String list(@RequestParam long goodsId, @RequestParam(defaultValue = "1") int pageIndex,
			@RequestParam(defaultValue = "8") int pageSize, HttpServletRequest request, Model model) {
		model.addAttribute("title", "我的评论 | ");

		model.addAttribute("list", goodsCommentManager.getGoodsCommentsById(goodsId, pageIndex, pageSize));
		model.addAttribute("pageCount", (goodsCommentManager.getGoodsCommentsCount(goodsId) + pageSize - 1) / pageSize);

		model.addAttribute("pageIndex", pageIndex);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("goodsId", goodsId);

		model.addAttribute("user", userManager.getUser(request));

		return Utils.getBusinessUrl("comments");
	}

	/**
	 * 删除评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentdel.user")
	@ResponseBody
	public Code del(@RequestParam long id, Model model) {
		boolean status = goodsCommentManager.delComment(id);

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

	/**
	 * 回复评论信息
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/commentappend.user")
	@ResponseBody
	public Code append(@RequestParam long id, @RequestParam String txt, HttpServletRequest request, Model model) {
		boolean status = goodsCommentManager.appendComment(id, txt, userManager.getUser(request).getName());

		Code code = new Code();
		if (status) {
			code.setCode(0);
		} else {
			code.setCode(-1);
		}
		return code;
	}

}
