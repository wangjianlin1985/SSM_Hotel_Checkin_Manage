package dingzhen.entity.info;

import dingzhen.common.base.BaseEntity;

/**
 * 订单-入住关联
 * 这样处理可以同时处理一个顾客住一天或连续多天的情况。
 *
 */
public class OrderArrange extends BaseEntity {

	private String id;
	private Order order;        
	private Arrange arrange;
	private String roomname; // 房间号 查询用
	
	
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Arrange getArrange() {
		return arrange;
	}
	public void setArrange(Arrange arrange) {
		this.arrange = arrange;
	}
	
}
