package dingzhen.entity.info;

import dingzhen.common.base.BaseEntity;

// 顾客管理
public class Customer extends BaseEntity {

	private String id;          // ID主键
	private String name;        // 姓名
	private String phone;       // 手机号
	private String idcardno;    // 身份证
	private String remarks;     // 备注
	private String sex;         // 男女
	
	
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdcardno() {
		return idcardno;
	}
	public void setIdcardno(String idcardno) {
		this.idcardno = idcardno;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	@Override
	public String toString() {
		return "Customer [id=" + id + ", name=" + name + ", phone=" + phone + ", idcardno=" + idcardno + ", remarks="
				+ remarks + ", sex=" + sex + "]";
	}
	
}
