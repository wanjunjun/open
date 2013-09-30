package com.wjj.cwz.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.SecondaryTable;
/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
@Entity
@Table(name = "c_subject", catalog = "cwz")
public class Subject implements java.io.Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "code", length = 50)
	private String code;
	
	@Column(name = "name", length = 50)
	private String name;
	
	@ManyToOne(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "parent")
	private Subject parent;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	private Set<Subject> childs = new HashSet<Subject>(0);
		
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
		
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
		
	public Subject getParent() {
		return parent;
	}
	public void setParent(Subject parent) {
		this.parent = parent;
	}
		
	public Set<Subject> getChilds() {
		return childs;
	}
	public void setChilds(Set<Subject> childs) {
		this.childs = childs;
	}
}
