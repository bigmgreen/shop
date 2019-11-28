package com.shop.model;

import java.sql.Timestamp;

public class Goods {
	public Long id;
	public String imgurl;
	public String imgs;
	public String sizes;
	public String colors;
	public String title;
	public Integer ispost;
	public Integer type;
	public Integer price;
	public Integer oldprice;
	public Integer salecount;
	public Integer count;
	public Timestamp date;

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

	/**
	 * 需要把长字符串转为数组
	 * 
	 * @return
	 */
	public String[] getImgs() {
		return imgs.split(";");
	}

	/**
	 * 需要把长字符串转为数组
	 * 
	 * @return
	 */
	public String[] getSizes() {
		return sizes.split(",");
	}

	public void setSizes(String sizes) {
		this.sizes = sizes;
	}

	/**
	 * 需要把长字符串转为数组
	 * 
	 * @return
	 */
	public String[] getColors() {
		return colors.split(",");
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
