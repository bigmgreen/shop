package com.shop.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.shop.service.GoodsOrderService;

@Component
public class GoodsOrderManager {
	@Autowired
	private GoodsOrderService goodsOrderService;

	/**
	 * 生成订单
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @return
	 */
	public boolean addOrder(long goodsid, long userid, int count, String color, String size) {
		try {
			goodsOrderService.addOrder(goodsid, userid, count, color, size);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 获取某一类订单
	 * 
	 * @param userid
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getOrderByType(long userid, int type, int pageIndex, int pageSize) {
		List list = goodsOrderService.getOrderByType(userid, type, pageIndex, pageSize);
		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}
		return list;
	}

	/**
	 * 获取所有订单
	 * 
	 * @param userid
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllOrder(long userid, int pageIndex, int pageSize) {
		List list = goodsOrderService.getAllOrder(userid, pageIndex, pageSize);
		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}
		return list;
	}

	/**
	 * 获取某一类订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCountByType(long userid, int type) {
		return goodsOrderService.getOrderCountByType(userid, type);
	}

	/**
	 * 获取所有订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCount(long userid) {
		return goodsOrderService.getOrderCount(userid);
	}
}
