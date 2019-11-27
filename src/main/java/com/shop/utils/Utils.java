package com.shop.utils;

import java.io.IOException;
import java.io.StringReader;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.HTMLEditorKit.ParserCallback;
import javax.swing.text.html.parser.ParserDelegator;

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
	 * 字符串过滤
	 * 
	 * @param str
	 * @return
	 */
	public static String removeHtml(String str) {
		try {
			final StringBuilder b = new StringBuilder();
			ParserDelegator delegator = new ParserDelegator();

			delegator.parse(new StringReader(str), new ParserCallback() {
				public void handleText(char[] data, int pos) {
					b.append(data);
				};
			}, true);
			return b.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return str;
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

}
