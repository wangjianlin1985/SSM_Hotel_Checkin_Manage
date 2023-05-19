package dingzhen.entity.info;

import dingzhen.common.base.BaseEntity;


// 入住安排
public class Arrange extends BaseEntity{

	private String id;
	private Room   room;  // 房间
	private String date;  // 日期
	private Float  price; // 每天的价格不一样
	private String status;  // 状态 0空位   1住人了   2退房结账了
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
