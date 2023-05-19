package dingzhen.entity.info;

import java.util.List;

import dingzhen.common.base.BaseEntity;

// 入住订单
public class Order extends BaseEntity{

	private String id;
	private String starttime;    //  入住开始
	private String endtime;      //  入住结束
	private Float  totalprice; // 总价
	private Customer customer;
	private List<Arrange> arrangeList;  //入住多天的
	
	private String roomname;     // 客房名称查询用
	
	
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public Float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public List<Arrange> getArrangeList() {
		return arrangeList;
	}
	public void setArrangeList(List<Arrange> arrangeList) {
		this.arrangeList = arrangeList;
	}
	
	
	
	
	
}
