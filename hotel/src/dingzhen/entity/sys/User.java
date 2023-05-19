package dingzhen.entity.sys;

import java.io.Serializable;

import org.apache.ibatis.type.Alias;

import dingzhen.common.base.BaseEntity;

/**
 * 用户信息
 * @author User
 *
 */
@Alias("user")
public class User extends BaseEntity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", roleId=" + roleId + ", description="
				+ description + ", roleName=" + roleName + ", email=" + email + "]";
	}
	private String id;         // ID
	private String name;   // 用户名
	private String password;     // 密码
	private String roleId;   // 角色
	private String description;     
	private String roleName;
	private String email;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
}
