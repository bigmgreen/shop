package com.shop.service;

import java.util.List;
import org.springframework.stereotype.Service;

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
	 * @param kw
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsListBykw(String kw, int pageIndex, int pageSize) {
		List list = getGoodsDao().getGoodsListBykw(kw, (pageIndex - 1) * pageSize, pageSize);

		session.close();
		return list;
	}

	/**
	 * 根据搜索的条件显示结果集长度
	 * 
	 * @param kw
	 * @return
	 */
	public int getGoodsCountBykw(String kw) {
		int pageCount = getGoodsDao().getGoodsCountBykw(kw);

		session.close();
		return pageCount;
	}

}
