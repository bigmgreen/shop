package com.shop.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.model.Goods;
import com.shop.service.GoodsService;

@Component
public class GoodsManager {
	@Autowired
	private GoodsService goodsService;

	/**
	 * 获取焦点图数据
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getBanners() {
		return goodsService.getBanners();
	}

	/**
	 * 获取推荐列表
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getHotList() {
		List list = goodsService.getHotGoods();
		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}
		return list;
	}

	/**
	 * 获取首页数据
	 * 
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getIndexList() {
		List list = new ArrayList();

		// type 1,2,3,4 分别依次是男装，女装，男鞋，女鞋 首页拿出前四条即可
		list.addAll(goodsService.getGoodsListByType(1, 4));
		list.addAll(goodsService.getGoodsListByType(2, 4));
		list.addAll(goodsService.getGoodsListByType(3, 4));
		list.addAll(goodsService.getGoodsListByType(4, 4));

		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}

		return list;
	}

	/**
	 * 根据搜索的条件显示结果集
	 * 
	 * @param pageIndex
	 * @param kw
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List getGoodsList(String kw, int pageIndex, int pageSize) {
		List list = goodsService.getGoodsListBykw(kw, pageIndex, pageSize);

		if (null == list || (null != list && list.size() == 0)) {
			list = null;
		}

		return list;
	}

	/**
	 * 根据搜索的条件显示结果集个数
	 * 
	 * @param kw
	 * @return
	 */
	public int getGoodsCountBykw(String kw) {
		return goodsService.getGoodsCountBykw(kw);
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
