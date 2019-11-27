package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.model.GoodsComment;

/**
 * 评论 DAO
 * 
 * @author Administrator
 *
 */
public interface GoodsCommentDao {

	/**
	 * 添加评论
	 * 
	 * @param goodsComment
	 */
	public void addComment(GoodsComment goodsComment);

	/**
	 * 通过商品id获取商品详情的相关评论
	 * 
	 * @param goodsid
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getGoodsCommentsById(@Param("goodsid") long goodsid, @Param("start") int start, @Param("end") int end);

	/**
	 * 通过商品id获取商品详情的相关评论总数
	 * 
	 * @param goodsid
	 * @return
	 */
	public int getGoodsCommentsCount(@Param("goodsid") long goodsid);

	/**
	 * 根据id删除评论
	 * 
	 * @param id
	 */
	public void delComment(long id);

	/**
	 * 回复评论信息
	 * 
	 * @param goodsComment
	 */
	public void appendComment(GoodsComment goodsComment);

	/**
	 * 通过id获取评论
	 * 
	 * @param id
	 * @return
	 */
	public GoodsComment getGoodsCommentById(@Param("id") long id);

}
