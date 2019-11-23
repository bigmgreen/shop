package com.shop.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import com.shop.model.Goods;
import com.shop.model.User;
import com.shop.utils.BaseService;

/**
 * 商品业务处理类
 * 
 * @author admin
 * 
 */
@Service
public class GoodsService extends BaseService {

	/**
	 * 通过类型获取对于类型的商品列表
	 * 
	 * @param type
	 * @param pageSize
	 * @param pageIndex
	 * @return
	 */
	public List<Goods> getGoodsListByType(int type, int pageSize, int pageIndex) {
		Goods goods = new Goods();
		List list = new ArrayList();
		list.add(list);
		return list;
	}

}
