package com.wjj.cwz.entity;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
@Entity
@Table(name = "c_advance", catalog = "cwz")
public class Advance extends BaseBean{
	private String note;
	private BigDecimal money;
	private Date date;
	private String ids; // ajax del 传过来的id
			
	@Column(name = "note", length = 255)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@Column(name = "money", precision = 10)
	public BigDecimal getMoney() {
		return money;
	}
	public void setMoney(BigDecimal money) {
		this.money = money;
	}
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "_date", length = 19)
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
