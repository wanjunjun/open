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

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-2-11
 * 
 */
@Entity
@Table(name = "c_module", catalog = "cwz")
public class Module extends BaseBean {
	private String name;
	private String url;
	private Integer sortNum;
	private Module parent;
	private Set<Module> childs = new HashSet<Module>(0);
	private Set<RoleModule> roleModules = new HashSet<RoleModule>(0);
		
	@Column(name = "name", length = 30)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "url", length = 50)
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Column(name = "sort_num")
	public Integer getSortNum() {
		return sortNum;
	}
	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}
	
	@ManyToOne(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "parent")
	public Module getParent() {
		return parent;
	}
	public void setParent(Module parent) {
		this.parent = parent;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<Module> getChilds() {
		return childs;
	}
	public void setChilds(Set<Module> childs) {
		this.childs = childs;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "module")
	public Set<RoleModule> getRoleModules() {
		return roleModules;
	}
	public void setRoleModules(Set<RoleModule> roleModules) {
		this.roleModules = roleModules;
	}
	
}
