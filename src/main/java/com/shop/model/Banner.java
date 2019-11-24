package com.shop.model;

public class Banner {
	public Long id;
	public long goodsid;
	public String imgurl;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public long getGoodsid() {
		return goodsid;
	}

	public void setGoodsid(long goodsid) {
		this.goodsid = goodsid;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

}
