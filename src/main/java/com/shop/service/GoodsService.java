package com.shop.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.shop.model.Banner;
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
public class GoodsService extends BaseService {

	/**
	 * 获取焦点图数据
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getBanners() {
		List list = getBannerDao().getBanner();

		session.close();
		return list;
	}

	/**
	 * 获取推荐列表
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getHotGoods() {
		List list = getGoodsDao().getHotGoods();

		session.close();
		return list;
	}

	/**
	 * 获取所有商品
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAll(int pageIndex, int pageSize) {
		List list = getGoodsDao().getAll((pageIndex - 1) * pageSize, pageSize);

		session.close();

		return list;
	}

	/**
	 * 通过类型获取对于类型的商品列表
	 * 
	 * @param type
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsListByType(int type, int pageSize) {
		List list = getGoodsDao().getGoodsListByType(type, pageSize);

		session.close();
		return list;
	}

	/**
	 * 根据搜索的条件显示结果集
	 * 
	 * @param pageIndex
	 * @param pageIndex
	 * @param type
	 * @param kw
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsListBykw(String kw, int type, int pageIndex, int pageSize) {
		List list = null;

		System.out.println(!"".equals(kw));
		System.out.println(type == 0);

		if (!"".equals(kw) || type == 0) {
			list = getGoodsDao().getGoodsListByKw(kw, (pageIndex - 1) * pageSize, pageSize);
		} else {
			list = getGoodsDao().getGoodsListByTypePage(type, (pageIndex - 1) * pageSize, pageSize);
		}

		session.close();
		return list;
	}

	/**
	 * 根据搜索的条件显示结果集长度
	 * 
	 * @param kw
	 * @param type
	 * @return
	 */
	public int getGoodsCountBykw(String kw, int type) {
		int pageCount = 0;

		if (!"".equals(kw) || type == 0) {
			pageCount = getGoodsDao().getGoodsCountByKw(kw);
		} else {
			pageCount = getGoodsDao().getGoodsCountByType(type);
		}

		session.close();
		return pageCount;
	}

	/**
	 * 通过商品id获取商品详情
	 * 
	 * @param id
	 * @return
	 */
	public Goods getGoodsById(long id) {
		Goods goods = getGoodsDao().getGoodsById(id);

		goods.setImgs(goods.getImgs().replaceAll(";", ","));

		session.close();
		return goods;
	}

	/**
	 * 添加购物车
	 * 
	 * @param goodsid
	 * @param count
	 * @param color
	 * @param size
	 * @return
	 */
	public void addCar(long goodsid, long userid, int count, String color, String size) {
		GoodsOrderOrCar goodsOrderOrCar = new GoodsOrderOrCar();
		goodsOrderOrCar.setGoodsid(goodsid);
		goodsOrderOrCar.setCount(count);
		goodsOrderOrCar.setColor(color);
		goodsOrderOrCar.setSize(size);
		goodsOrderOrCar.setUserid(userid);

		Date date = new Date();
		goodsOrderOrCar.setDate(new Timestamp(date.getTime()));

		Goods goods = getGoodsDao().getGoodsById(goodsid);

		goodsOrderOrCar.setPrice(goods.getPrice());
		goodsOrderOrCar.setImgurl(goods.getImgurl());
		goodsOrderOrCar.setTitle(goods.getTitle());

		goodsOrderOrCar.setUsername(getUserDao().getUser(userid).getName());

		getGoodsDao().addCar(goodsOrderOrCar);
		session.commit();
		session.close();
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
		List list = getGoodsDao().getAllCar(userid, (pageIndex - 1) * pageSize, pageSize);

		session.close();

		return list;
	}

	/**
	 * 查询当前用户的购物车总数
	 * 
	 * @param userid
	 * @return
	 */
	public int getCarCount(long userid) {
		int pageCount = getGoodsDao().getCarCount(userid);

		session.close();
		return pageCount;
	}

	/**
	 * 根据id删除当前用户的购物车记录
	 * 
	 * @param id
	 * @return
	 */
	public void delCar(long id) {
		getGoodsDao().delCar(id);

		session.commit();
		session.close();
	}

	/**
	 * 批量删除
	 * 
	 * @param ids
	 * @return
	 */
	public void delByids(String[] ids) {
		getGoodsDao().delByids(ids);

		session.commit();
		session.close();
	}

	/**
	 * 批量查找
	 * 
	 * @param ids
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List selectByids(String[] ids) {
		List list = getGoodsDao().selectByids(ids);

		session.close();

		return list;
	}

	/**
	 * 批量插入
	 * 
	 * @param ids
	 */
	@SuppressWarnings("rawtypes")
	public void carbuy(String[] ids) {
		List list = this.selectByids(ids);

		for (int i = 0; i < list.size(); i++) {
			GoodsOrderOrCar goodsOrderOrCar = (GoodsOrderOrCar) list.get(i);

			goodsOrderOrCar.setOrdercode(UUID.randomUUID().toString().replaceAll("-", ""));
			goodsOrderOrCar.setType(1); // 1待发货 2待收货 3 已收货

			Date date = new Date();
			goodsOrderOrCar.setDate(new Timestamp(date.getTime()));
		}

		getGoodsDao().inserts(list);

		session.commit();
		session.close();

		this.delByids(ids);
	}

	/**
	 * 获取所有商品总数
	 * 
	 * @return
	 */
	public int getAllCount() {
		int pageCount = getGoodsDao().getAllCount();

		session.close();
		return pageCount;
	}

	/**
	 * 商品删除
	 * 
	 * @param id
	 */
	public void delete(long id) {
		getGoodsDao().delete(id);

		session.commit();
		session.close();
	}

	/**
	 * 商品焦点图设置
	 * 
	 * @param banner
	 */
	public void setBanner(Banner banner) {
		Date date = new Date();
		banner.setDate(new Timestamp(date.getTime()));

		getBannerDao().setBanner(banner);

		session.commit();
		session.close();
	}

	/**
	 * 根据id删除焦点图
	 * 
	 * @param id
	 */
	public void bannerDelete(long id) {
		getBannerDao().bannerDelete(id);

		session.commit();
		session.close();
	}

	/**
	 * 添加商品
	 * 
	 * @param goods
	 */
	public void addGoods(Goods goods) {
		getGoodsDao().addGoods(goods);

		session.commit();
		session.close();
	}

	/**
	 * 修改商品
	 * 
	 * @param goods
	 */
	public void updateGoods(Goods goods) {
		getGoodsDao().updateGoods(goods);

		session.commit();
		session.close();
	}

}
