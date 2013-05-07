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
 * @create 2013-2-11
 * 
 */
@Entity
@Table(name = "c_role", catalog = "cwz")
public class Role extends BaseBean {	
	private String name;	
	private String code;
	private String roleSecurity;
	private String description;
	private Role parent;
	private Set<Role> childs = new HashSet<Role>(0);
	private Set<RoleModule> roleModules = new HashSet<RoleModule>(0);
	private Set<UserRole> userRoles = new HashSet<UserRole>(0);
		
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
	
	@Column(name = "role_security", length = 50)
	public String getRoleSecurity() {
		return roleSecurity;
	}

	public void setRoleSecurity(String roleSecurity) {
		this.roleSecurity = roleSecurity;
	}
	
	@Column(name = "description", length = 100)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@ManyToOne(cascade=CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "parent")
	public Role getParent() {
		return parent;
	}
	public void setParent(Role parent) {
		this.parent = parent;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parent")
	public Set<Role> getChilds() {
		return childs;
	}
	public void setChilds(Set<Role> childs) {
		this.childs = childs;
	}
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "role")
	public Set<RoleModule> getRoleModules() {
		return roleModules;
	}
	public void setRoleModules(Set<RoleModule> roleModules) {
		this.roleModules = roleModules;
	}	
	
	@OneToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "role")
	public Set<UserRole> getUserRoles() {
		return userRoles;
	}

	public void setUserRoles(Set<UserRole> userRoles) {
		this.userRoles = userRoles;
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
