package com.wjj.cwz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Entity
@Table(name = "c_reader", catalog = "cwz")
public class Reader extends BaseBean{

	private String readerId;
	private String type;
	private String description;
	
	@Column(name = "reader_id", length = 50)
	public String getReaderId() {
		return readerId;
	}
	public void setReaderId(String readerId) {
		this.readerId = readerId;
	}
	@Column(name = "type", length = 10)
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Column(name = "description", length = 50)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}		
}
