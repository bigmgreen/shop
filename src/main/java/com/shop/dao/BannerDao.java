package com.shop.dao;

import java.util.List;

import com.shop.model.Banner;
import com.shop.model.Goods;

/**
 * 焦点图
 * 
 * @author Administrator
 *
 */
public interface BannerDao {
	/**
	 * 获取焦点图
	 * 
	 * @return
	 */
	public List<Banner> getBanner();

	/**
	 * 商品焦点图设置
	 * 
	 * @param banner
	 */
	public void setBanner(Banner banner);

	/**
	 * 根据id删除焦点图
	 * 
	 * @param id
	 */
	public void bannerDelete(long id);
}
