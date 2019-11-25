package com.shop.utils;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 公共函数类
 * 
 * @author Administrator
 *
 */
public class Utils {

	/** 页容量 */
	public static int PAGE_SIZE = 6;
	/** 会话工厂 */
	private static SqlSessionFactory sessionFactory = null;

	public static SqlSessionFactory getsqlSessionFactory() {
		try {
			if (sessionFactory == null) {
				sessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis.xml"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return sessionFactory;
	}

	/***
	 * 获取 sqlSession
	 * 
	 * @return sqlSession
	 */
	public static SqlSession openSqlSession() {
		return Utils.getsqlSessionFactory().openSession();
	}

	/**
	 * 从客户端获得用户id
	 * 
	 * @param request
	 */
	public static long getUserId(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		long userId = 0;
		if (cookies != null) {
			for (Cookie c : cookies) {
				if ("userId".equals(c.getName())) {
					if (request.getSession().getAttribute(c.getValue()) != null && !"".equals(c.getValue())) {
						userId = Long.parseLong(c.getValue());
					}
					break;
				}
			}
		}
		return userId;
	}

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

	/**
	 * 获取日期字符串
	 * 
	 * @return
	 */
	public static String getDateDesc() {
		// 输入毫秒数，转化为日期，用calendar方法；
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);// 24小时制
		int minute = calendar.get(Calendar.MINUTE);
		int second = calendar.get(Calendar.SECOND);

		return year + "年" + (month + 1) + "月" + day + "日" + hour + "时" + minute + "分" + second + "秒";
	}
}
