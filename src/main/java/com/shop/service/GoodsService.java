package com.shop.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import com.shop.dao.BannerDao;
import com.shop.model.Goods;
import com.shop.model.User;
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
		return getBannerDao().getBanner();
	}

	/**
	 * 获取推荐列表
	 * 
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getHotGoods() {
		return getGoodsDao().getHotGoods();
	}

	/**
	 * 通过类型获取对于类型的商品列表
	 * 
	 * @param type
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public List<Goods> getGoodsListByType(int type, int pageSize) {
		return getGoodsDao().getGoodsListByType(type, pageSize);
	}

}
