package com.shop.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.shop.model.GoodsComment;
import com.shop.utils.BaseService;
import com.shop.utils.Utils;

/**
 * 商品评论处理类
 * 
 * @author admin
 * 
 */
@Service
public class GoodsCommentService extends BaseService {

	/**
	 * 添加评论信息
	 * 
	 * @param goodsid
	 * @param userid
	 * @param txt
	 */
	public void addComment(long goodsid, long userid, String txt) {
		GoodsComment comment = new GoodsComment();
		comment.setGoodsid(goodsid);
		comment.setUserid(userid);
		comment.setTxt(Utils.removeHtml(txt));

		Date date = new Date();
		comment.setDate(new Timestamp(date.getTime()));

		comment.setUsername(getUserDao().getUser(userid).getName());

		getGoodsCommentDao().addComment(comment);
		session.commit();
		session.close();
	}

	/**
	 * 通过商品id获取商品详情的相关评论
	 * 
	 * @param id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsCommentsById(long goodsid, int pageIndex, int pageSize) {
		List list = getGoodsCommentDao().getGoodsCommentsById(goodsid, (pageIndex - 1) * pageSize, pageSize);

		session.close();

		if (null == list || (null != list && list.size() == 0)) {
			return null;
		}

		return list;
	}

	/**
	 * 获取所有评论
	 * 
	 * @param pageIndex
	 * @param pageSize
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getAll(int pageIndex, int pageSize) {
		List list = getGoodsCommentDao().getAll((pageIndex - 1) * pageSize, pageSize);
		
		session.close();

		return list;
	}

	/**
	 * 通过商品id获取商品详情的相关评论总数
	 * 
	 * @param goodsid
	 * @return
	 */
	public int getGoodsCommentsCount(long goodsid) {
		int pageCount = getGoodsCommentDao().getGoodsCommentsCount(goodsid);

		session.close();
		return pageCount;
	}

	/**
	 * 根据id删除评论
	 * 
	 * @param id
	 */
	public void delComment(long id) {
		getGoodsCommentDao().delComment(id);

		session.commit();
		session.close();
	}

	/**
	 * 通过id获取评论
	 * 
	 * @param id
	 * @return
	 */
	public GoodsComment getGoodsCommentById(long id) {
		GoodsComment goodsComment = getGoodsCommentDao().getGoodsCommentById(id);

		session.close();

		return goodsComment;
	}

	/**
	 * 回复评论信息
	 * 
	 * @param id
	 * @param userName
	 * @param txt
	 */
	public void appendComment(long id, String txt, String userName) {
		GoodsComment goodsComment = this.getGoodsCommentById(id);

		String msg = Utils.removeHtml(txt);

		goodsComment
				.setTxt(goodsComment.getTxt() + "<br>" + userName + " 回复 " + goodsComment.getUsername() + " 说：" + msg);

		getGoodsCommentDao().appendComment(goodsComment);

		session.commit();
		session.close();
	}

}
