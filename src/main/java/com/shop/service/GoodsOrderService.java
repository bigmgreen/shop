package com.shop.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.shop.model.Goods;
import com.shop.model.GoodsOrderOrCar;
import com.shop.utils.BaseService;

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
		GoodsOrderOrCar goodsOrderOrCar = new GoodsOrderOrCar();
		goodsOrderOrCar.setGoodsid(goodsid);
		goodsOrderOrCar.setCount(count);
		goodsOrderOrCar.setColor(color);
		goodsOrderOrCar.setSize(size);
		goodsOrderOrCar.setUserid(userid);
		goodsOrderOrCar.setOrdercode(UUID.randomUUID().toString().replaceAll("-", ""));
		goodsOrderOrCar.setType(1); // 1待发货 2待收货 3 已收货

		Date date = new Date();
		goodsOrderOrCar.setDate(new Timestamp(date.getTime()));

		Goods goods = getGoodsDao().getGoodsById(goodsid);

		goodsOrderOrCar.setPrice(goods.getPrice());
		goodsOrderOrCar.setImgurl(goods.getImgurl());
		goodsOrderOrCar.setTitle(goods.getTitle());

		goodsOrderOrCar.setUsername(getUserDao().getUser(userid).getName());

		getGoodsOrderDao().addOrder(goodsOrderOrCar);
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
		
		session.close();

		return list;
	}

	/**
	 * 获取当前用户所有订单
	 * 
	 * @param userid
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllOrder(long userid, int pageIndex, int pageSize) {
		List list = getGoodsOrderDao().getOrderByUserId(userid, (pageIndex - 1) * pageSize, pageSize);
		
		session.close();

		return list;
	}

	/**
	 * 获取所有订单
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllOrder(int pageIndex, int pageSize) {
		List list = getGoodsOrderDao().getAllOrder((pageIndex - 1) * pageSize, pageSize);
		
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
