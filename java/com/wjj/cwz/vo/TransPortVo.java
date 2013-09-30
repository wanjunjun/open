package com.wjj.cwz.vo;

import java.util.List;

import com.wjj.cwz.entity.TransPortDetail;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-10
 * 
 */
public class TransPortVo implements java.io.Serializable{

	private List<TransPortDetail> items;

	public List<TransPortDetail> getItems() {
		return items;
	}

	public void setItems(List<TransPortDetail> items) {
		this.items = items;
	}	
}
