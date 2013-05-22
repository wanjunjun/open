package com.wjj.cwz.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Entity
@Table(name = "c_depo", catalog = "cwz")
public class Depo extends BaseBean{

	private String name;
	private String code;
	private String state;
	private String province;
	private String city;
	private String address;
	private Depo parent;
	private String adminCode;
	private String adminName;
	private Set<Depo> childs = new HashSet<Depo>(0);
	
	@Column(name = "name", length = 30)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "code", length = 30)
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Column(name = "state", length = 10)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "province", length = 10)
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	
	@Column(name = "city", length = 10)
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
	@Column(name = "address", length = 50)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@ManyToOne(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "parent")
	public Depo getParent() {
		return parent;
	}
	public void setParent(Depo parent) {
		this.parent = parent;
	}
	
	@Column(name = "admin_code", length = 50)
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	
	@Column(name = "admin_name", length = 50)
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<Depo> getChilds() {
		return childs;
	}
	public void setChilds(Set<Depo> childs) {
		this.childs = childs;
	}
	
	//以下临时方法构造角色树时用到,请勿随便更改
	@Transient
	public Long getId(){
		return super.getId();
	}
	
	@Transient
	public String getText() {
		return name;
	}
	
	@Transient
	public String getValue(){
		return String.valueOf(getId());
	}
}
