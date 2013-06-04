package com.wjj.cwz.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	private String readerIp;
	private String location;
	private Depo depo;
	
	
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
	
	@Column(name = "reader_ip", length = 50)
	public String getReaderIp() {
		return readerIp;
	}
	public void setReaderIp(String readerIp) {
		this.readerIp = readerIp;
	}
	
	@Column(name = "location", length = 100)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "depo")
	public Depo getDepo() {
		return depo;
	}

	public void setDepo(Depo depo) {
		this.depo = depo;
	}
}
