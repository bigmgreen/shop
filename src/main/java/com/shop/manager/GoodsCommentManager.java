package com.shop.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.service.GoodsCommentService;

@Component
public class GoodsCommentManager {
	@Autowired
	private GoodsCommentService goodsCommentService;

	/**
	 * 添加评论信息
	 * 
	 * @param goodsid
	 * @param userid
	 * @param txt
	 * @return
	 */
	public boolean addComment(long goodsid, long userid, String txt) {
		try {
			goodsCommentService.addComment(goodsid, userid, txt);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 通过商品id获取商品详情的相关评论
	 * 
	 * @param id
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsCommentsById(long goodsid, int pageIndex, int pageSize) {
		return goodsCommentService.getGoodsCommentsById(goodsid, pageIndex, pageSize);
	}

	/**
	 * 通过商品id获取商品详情的相关评论总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getGoodsCommentsCount(long goodsid) {
		return goodsCommentService.getGoodsCommentsCount(goodsid);
	}

	/**
	 * 根据id删除评论
	 *
	 * @param id
	 * @return
	 */
	public boolean delComment(long id) {
		try {
			goodsCommentService.delComment(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 回复评论信息
	 * 
	 * @param id
	 * @param userName
	 * @param txt
	 * @return
	 */
	public boolean appendComment(long id, String txt, String userName) {
		try {
			goodsCommentService.appendComment(id, txt, userName);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
