package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.GoodsOrderOrCar;

/**
 * 订单实体类
 * 
 * @author Administrator
 *
 */
public interface GoodsOrderDao {
	/**
	 * 生成订单
	 * 
	 * @param goodsOrderOrCar
	 */
	public void addOrder(GoodsOrderOrCar goodsOrderOrCar);

	/**
	 * 获取某一类订单
	 * 
	 * @param userid
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getOrderByType(@Param("userid") long userid, @Param("type") int type, @Param("start") int start,
			@Param("end") int end);

	/**
	 * 获取所有订单
	 * 
	 * @param userid
	 * 
	 * @param type
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllOrder(@Param("userid") long userid, @Param("start") int start, @Param("end") int end);

	/**
	 * 获取某一类订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCountByType(@Param("userid") long userid, @Param("type") int type);

	/**
	 * 获取所有订单总数
	 * 
	 * @param userid
	 * 
	 * @return
	 */
	public int getOrderCount(@Param("userid") long userid);

	/**
	 * 根据id更新当前用户的订单
	 * 
	 * @param id
	 * @return
	 */
	public void updateOrder(long id);

	/**
	 * 根据id删除当前用户的订单
	 * 
	 * @param id
	 * @return
	 */
	public void delOrder(long id);
}
