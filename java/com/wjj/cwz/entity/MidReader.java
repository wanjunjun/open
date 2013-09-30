package com.wjj.cwz.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Entity
@Table(name = "mid_reader", catalog = "cwz")
public class MidReader extends BaseBean{

	private String ticketId;
	private Date readerTime;
	private Integer readerCount;
	private String readerIp;
	
	@Column(name = "ticket_id", length = 100)
	public String getTicketId() {
		return ticketId;
	}
	public void setTicketId(String ticketId) {
		this.ticketId = ticketId;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "reader_time", length = 10)
	public Date getReaderTime() {
		return readerTime;
	}
	public void setReaderTime(Date readerTime) {
		this.readerTime = readerTime;
	}
	
	@Column(name = "reader_count")
	public Integer getReaderCount() {
		return readerCount;
	}
	public void setReaderCount(Integer readerCount) {
		this.readerCount = readerCount;
	}
	
	@Column(name = "reader_ip", length = 50)
	public String getReaderIp() {
		return readerIp;
	}
	public void setReaderIp(String readerIp) {
		this.readerIp = readerIp;
	}
	
			
}
