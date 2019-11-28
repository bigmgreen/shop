package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.Goods;
import com.shop.model.GoodsOrderOrCar;

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

	/**
	 * 获取所有商品
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAll(@Param("start") int start, @Param("end") int end);

	/**
	 * 通过类型获取对于类型的商品列表
	 * 
	 * @param pageIndex
	 * @param pageIndex
	 * @param kw
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsListByTypePage(@Param("type") int type, @Param("start") int start, @Param("end") int end);

	/**
	 * 通过类型获取对于类型的商品列表长度
	 * 
	 * @param kw
	 * @return
	 */
	public int getGoodsCountByType(@Param("type") int type);

	/**
	 * 根据搜索的条件显示结果集
	 * 
	 * @param pageIndex
	 * @param pageIndex
	 * @param kw
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsListByKw(@Param("kw") String kw, @Param("start") int start, @Param("end") int end);

	/**
	 * 根据搜索的条件显示结果集长度
	 * 
	 * @param kw
	 * @return
	 */
	public int getGoodsCountByKw(String kw);

	/**
	 * 通过商品id获取商品详情
	 * 
	 * @param id
	 * @return
	 */
	public Goods getGoodsById(@Param("id") long id);

	/**
	 * 添加购物车
	 * 
	 * @param goodsOrderOrCar
	 */
	public void addCar(GoodsOrderOrCar goodsOrderOrCar);

	/**
	 * 查询当前用户的购物车情况
	 * 
	 * @param userid
	 * @param i
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAllCar(@Param("userid") long userid, @Param("start") int start, @Param("end") int end);

	/**
	 * 查询当前用户的购物车总数
	 * 
	 * @param userid
	 * @return
	 */
	public int getCarCount(@Param("userid") long userid);

	/**
	 * 根据id删除当前用户的购物车记录
	 * 
	 * @param id
	 */
	public void delCar(@Param("id") long id);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	public void delByids(@Param("ids") String[] ids);

	/**
	 * 批量查找
	 * 
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByids(@Param("ids") String[] ids);

	/**
	 * 批量插入
	 * 
	 * @param list
	 */
	@SuppressWarnings("rawtypes")
	public void inserts(@Param("list") List list);

}
