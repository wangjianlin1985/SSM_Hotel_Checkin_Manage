package dingzhen.entity.info;

import dingzhen.common.base.BaseEntity;

// 客房管理
public class Room extends BaseEntity{

	private String id;    // id
	private String name;  // 编号
	private Float  price; // 通用价格
	private String type;  // 类型，大床房，商务间，标准间，单人间 其他
	
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	
}
