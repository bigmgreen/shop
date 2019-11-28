package com.shop.model;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

public class Goods {
	public Long id;
	public String imgurl;
	public String imgs;
	public String sizes;
	public String colors;
	public String[] goodssizes;
	public String[] goodscolors;
	public String title;
	public Integer ispost;
	public Integer type;
	public Integer price;
	public Integer oldprice;
	public Integer salecount;
	public Integer count;
	public Timestamp date;
	public MultipartFile goodsimgurl;

	public String[] getGoodssizes() {
		return goodssizes;
	}

	public void setGoodssizes(String[] goodssizes) {
		this.goodssizes = goodssizes;
	}

	public String[] getGoodscolors() {
		return goodscolors;
	}

	public void setGoodscolors(String[] goodscolors) {
		this.goodscolors = goodscolors;
	}

	public MultipartFile getGoodsimgurl() {
		return goodsimgurl;
	}

	public void setGoodsimgurl(MultipartFile goodsimgurl) {
		this.goodsimgurl = goodsimgurl;
	}

	public MultipartFile[] getGoodsimgs() {
		return goodsimgs;
	}

	public void setGoodsimgs(MultipartFile[] goodsimgs) {
		this.goodsimgs = goodsimgs;
	}

	public MultipartFile[] goodsimgs;

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getImgs() {
		return imgs;
	}

	public String getSizes() {
		return sizes;
	}

	public void setSizes(String sizes) {
		this.sizes = sizes;
	}

	public String getColors() {
		return colors;
	}

	public void setColors(String colors) {
		this.colors = colors;
	}

	public void setImgs(String imgs) {
		this.imgs = imgs;
	}

	public Integer getOldprice() {
		return oldprice;
	}

	public void setOldprice(Integer oldprice) {
		this.oldprice = oldprice;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getIspost() {
		return ispost;
	}

	public void setIspost(Integer ispost) {
		this.ispost = ispost;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getSalecount() {
		return salecount;
	}

	public void setSalecount(Integer salecount) {
		this.salecount = salecount;
	}

}
