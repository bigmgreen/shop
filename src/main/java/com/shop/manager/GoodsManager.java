package com.shop.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.model.Goods;
import com.shop.service.GoodsService;

@Component
public class GoodsManager {
	@Autowired
	private GoodsService goodsService;

	/**
	 * 获取首页数据
	 * 
	 * @param pageIndex
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getIndexList(int pageIndex) {
		return goodsService.getGoodsListByType(0, 30, 0);
	}

	/**
	 * 获取焦点图数据
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getBanners() {

		return null;
	}

	/**
	 * 根据搜索的条件显示结果集
	 * 
	 * @param pageIndex
	 * @param kw
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsList(int pageIndex, String kw) {
		// TODO 自动生成的方法存根
		return null;
	}

	/**
	 * 通过商品id获取商品详情
	 * 
	 * @param id
	 * @return
	 */
	public Goods getGoodsById(long id) {
		// TODO 自动生成的方法存根
		return null;
	}

	/**
	 * 通过商品id获取商品详情的相关评论
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsCommentsById(long id) {
		// TODO 自动生成的方法存根
		return null;
	}
}
