package com.shop.utils;

import java.util.Map;

/**
 * http 状态类
 * 
 * @author Administrator
 *
 */
public class Code {

	public Integer code;
	public String msg;
	public Map<String, Object> reslut;

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Map<String, Object> getReslut() {
		return reslut;
	}

	public void setReslut(Map<String, Object> reslut) {
		this.reslut = reslut;
	}
}
