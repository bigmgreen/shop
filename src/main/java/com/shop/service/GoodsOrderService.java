package com.shop.service;

import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.shop.model.Goods;
import com.shop.model.GoodsOrder;
import com.shop.utils.BaseService;
import com.shop.utils.Utils;

/**
 * 商品业务处理类
 * 
 * @author admin
 * 
 */
@Service
public class GoodsOrderService extends BaseService {

	/**
	 * 生成订单
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @return
	 */
	public void addOrder(long goodsid, long userid, int count, String color, String size) {
		GoodsOrder goodsOrder = new GoodsOrder();
		goodsOrder.setGoodsid(goodsid);
		goodsOrder.setCount(count);
		goodsOrder.setColor(color);
		goodsOrder.setSize(size);
		goodsOrder.setUserid(userid);
		goodsOrder.setOrdercode(UUID.randomUUID().toString().replaceAll("-", ""));
		goodsOrder.setType(1); // 1待发货 2待收货
		goodsOrder.setDate(Utils.getDateDesc());

		Goods goods = getGoodsDao().getGoodsById(goodsid);

		goodsOrder.setPrice(goods.getPrice());
		goodsOrder.setImgurl(goods.getImgurl());
		goodsOrder.setTitle(goods.getTitle());

		goodsOrder.setUsername(getUserDao().getUser(userid).getName());

		getGoodsOrderDao().addOrder(goodsOrder);
		session.commit();
		session.close();
	}

	/**
	 * 获取某一类订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCountByType(long userid, int type) {
		int pageCount = getGoodsOrderDao().getOrderCountByType(userid, type);

		session.close();
		return pageCount;
	}

	/**
	 * 获取所有订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCount(long userid) {
		int pageCount = getGoodsOrderDao().getOrderCount(userid);

		session.close();
		return pageCount;
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
		List list = getGoodsOrderDao().getOrderByType(userid, type, (pageIndex - 1) * pageSize, pageSize);
		session.commit();
		session.close();

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
		List list = getGoodsOrderDao().getAllOrder(userid, (pageIndex - 1) * pageSize, pageSize);
		session.commit();
		session.close();

		return list;
	}

	/**
	 * 根据id更新当前用户的订单
	 * 
	 * @param id
	 * @return
	 */
	public void updateOrder(long id) {
		getGoodsOrderDao().updateOrder(id);

		session.commit();
		session.close();
	}

	/**
	 * 根据id删除当前用户的订单
	 * 
	 * @param id
	 * @return
	 */
	public void delOrder(long id) {
		getGoodsOrderDao().delOrder(id);

		session.commit();
		session.close();
	}

}
