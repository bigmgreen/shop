package com.shop.utils;

import org.apache.log4j.Logger;

/**
 * 公共函数类
 * 
 * @author Administrator
 *
 */
public class Utils {

	public static Logger log = Logger.getLogger(Utils.class);

	/**
	 * 返回业务系统的 URL
	 * 
	 * @param path
	 * @return
	 */
	public static String getBusinessUrl(String path) {
		return "business/" + path;
	}

	/**
	 * 返回管理系统的 URL
	 * 
	 * @param path
	 * @return
	 */
	public static String getAdminUrl(String path) {
		return "admin/" + path;
	}
}
