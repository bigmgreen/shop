package com.shop.utils;

import org.apache.ibatis.session.SqlSession;
import com.shop.dao.*;

/**
 * service父类 用于获取 各种dao
 * 
 * @author admin
 * 
 */
public class BaseService {
	protected SqlSession session;

	protected UserDao getUserDao() {
		session = Utils.openSqlSession();
		return session.getMapper(UserDao.class);
	}
	
	protected BannerDao getBannerDao() {
		session = Utils.openSqlSession();
		return session.getMapper(BannerDao.class);
	}
	
	protected GoodsDao getGoodsDao() {
		session = Utils.openSqlSession();
		return session.getMapper(GoodsDao.class);
	}
}
