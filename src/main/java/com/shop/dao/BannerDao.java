package com.shop.dao;

import java.util.List;

import com.shop.model.Banner;

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
}
