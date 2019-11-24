package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Goods;

/**
 * 商品实体类
 * 
 * @author Administrator
 *
 */
public interface GoodsDao {
	/**
	 * 获取推荐列表
	 * 
	 * @return
	 */
	public List<Goods> getHotGoods();

	/**
	 * 通过类型获取对于类型的商品列表
	 * 
	 * @param type
	 * @param pageSize
	 * @return
	 */
	public List<Goods> getGoodsListByType(@Param("type") int type, @Param("pageSize") int pageSize);
}
