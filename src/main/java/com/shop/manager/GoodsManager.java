package com.shop.manager;

import java.util.ArrayList;
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
	 * @param kw
	 * @param type
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List getGoodsList(String kw, int type, int pageIndex, int pageSize) {
		List list = goodsService.getGoodsListBykw(kw, type, pageIndex, pageSize);

		if (null == list || (null != list && list.size() == 0)) {
			list = null;
		}

		return list;
	}

	/**
	 * 根据搜索的条件显示结果集个数
	 * 
	 * @param kw
	 * @param type
	 * @return
	 */
	public int getGoodsCountBykw(String kw, int type) {
		return goodsService.getGoodsCountBykw(kw, type);
	}

	/**
	 * 通过商品id获取商品详情
	 * 
	 * @param id
	 * @return
	 */
	public Goods getGoodsById(long id) {
		return goodsService.getGoodsById(id);
	}

	/**
	 * 添加购物车
	 * 
	 * @param goodsid
	 * @param id
	 * @param count
	 * @param color
	 * @param size
	 * @return
	 */
	public boolean addCar(long goodsid, Long id, int count, String color, String size) {
		try {
			goodsService.addCar(goodsid, id, count, color, size);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 查询当前用户的购物车情况
	 * 
	 * @param userid
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllCar(long userid, int pageIndex, int pageSize) {
		List list = goodsService.getAllCar(userid, pageIndex, pageSize);
		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}
		return list;
	}

	/**
	 * 查询当前用户的购物车总数
	 * 
	 * @param userid
	 * @return
	 */
	public int getCarCount(long userid) {
		return goodsService.getCarCount(userid);
	}

	/**
	 * 根据id删除当前用户的购物车记录
	 * 
	 * @param id
	 * @return
	 */
	public boolean delCar(long id) {
		try {
			goodsService.delCar(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 当前用户的购物车结算
	 * 
	 * @param ids
	 * @return
	 */
	public boolean carbuy(String[] ids) {
		try {
			goodsService.carbuy(ids);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
