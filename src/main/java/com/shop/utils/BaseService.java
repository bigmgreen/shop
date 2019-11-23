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
	/** 会话 */
	protected SqlSession session;

	/** 获取userDao */
	protected UserDao getUserDao() {
		session = Utils.openSqlSession();
		return session.getMapper(UserDao.class);
	}
}
