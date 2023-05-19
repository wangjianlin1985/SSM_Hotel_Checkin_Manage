package dingzhen.controller.info;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dingzhen.common.base.BaseController;
import dingzhen.common.base.ResponseDate;
import dingzhen.common.util.StringUtil;
import dingzhen.entity.info.Arrange;
import dingzhen.entity.info.Customer;
import dingzhen.entity.info.Order;
import dingzhen.entity.info.OrderArrange;
import dingzhen.entity.info.Room;
import dingzhen.service.info.ArrangeService;
import dingzhen.service.info.OrderArrangeService;
import dingzhen.service.info.OrderService;

// 退房，续房操作
@Controller
@RequestMapping("orderArrange")
@SuppressWarnings({"all"})
public class OrderArrangeController extends BaseController<OrderArrange>{

	@Autowired
	private OrderArrangeService orderArrangeService;
	@Autowired
	private ArrangeService arrangeService;
	@Autowired
	private OrderService orderService;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	

	@RequestMapping("orderIndex")
	public String orderIndex(){
		return "info/orderNew";
	}
	
	
	@RequestMapping("orderList")
	//ajax展示客房查询
	@ResponseBody
	public ResponseDate<Order> orderList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate<Order> rd = new ResponseDate<Order>();
		try {
			Order order = new Order();
			/**
			 * 若endtime为空  查询全部
			 * 若endtime为1 查询结账了的
			 * endtim为2  未结账的
			 */
			order.setEndtime("2");
			
			String keyword = request.getParameter("keyword"); // 客户关键字姓名身份证手机等
			order.setKeyword(keyword);
			
			String roomname = request.getParameter("roomname");
			
			List<Order> oList = new ArrayList<>();
			List<Order> list = orderService.findList(order);
			
			/**
			 * 按房间号搜索。
			 * 1 先查出出所有订单
			 * 2 根据订单ID查询他的所有关联的arrange，然后找到所有的房间号。
			 */
			for(Order O : list){
				OrderArrange oa = new OrderArrange();
				oa.setOrder(order);
				List<OrderArrange> oaList = orderArrangeService.findList(oa);
				String roomnames = "";
				Set<String> r = new TreeSet<>();
				for(OrderArrange a : oaList){
					if(O.getId().equals(a.getOrder().getId())) {
						r.add(a.getArrange().getRoom().getName()); // 用set集合将重名房间去掉，比如定了3号4号的8804房间。那么只显示一条8804
						roomnames += ("," + a.getArrange().getRoom().getName());
					}
					
				}
				if(StringUtil.isEmpty(roomname)){
					O.setRoomname(r.toString());
					oList.add(O);
				} else {
					if(roomnames.contains(roomname)){
						O.setRoomname(r.toString());
						oList.add(O);
					}
				}
				
			}
			rd.setRows(oList);
			rd.setTotal(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
	
	
	
	
	
	
	// 暂未使用，用上面的方法代替了
	@RequestMapping("orderArrangeIndex")
	public String orderArrangeIndex(){
		return "info/orderArrange";
	}
	
	// 暂未使用，用上面的方法代替了
	// 根据房间号查询该房间未退房的信息
	@RequestMapping("orderArrangeList")
	@ResponseBody
	public ResponseDate orderArrangeList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String roomname = request.getParameter("roomname");
			
			Map<String, Object> map = new HashMap<>();
			map.put("roomname", roomname);
			List<OrderArrange> list = orderArrangeService.findListByMap(map);
			List<Map<String, Object>> mapList = new ArrayList<>();
			for(OrderArrange oa : list){
				Map<String, Object> m = new HashMap<>();
				m.put("id", oa.getId());
				m.put("customername", oa.getOrder().getCustomer().getName());
				m.put("customerphone", oa.getOrder().getCustomer().getPhone());
				m.put("starttime", oa.getOrder().getStarttime());
				m.put("endtime", oa.getOrder().getEndtime());
				m.put("orderid", oa.getOrder().getId());
				m.put("roomname", oa.getArrange().getRoom().getName());
				m.put("arrangeid", oa.getArrange().getId());
				mapList.add(m);
			}
			rd.setRows(mapList);
			rd.setTotal(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}

	
	
	
	// 续费操作
	@RequestMapping("xufei")
	@ResponseBody
	@Transactional
	public ResponseDate deleteCustomer(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String id = request.getParameter("id");  //order表的id
			String endDate = request.getParameter("date"); // 续期时间
			Order order = new Order();
			order.setId(id);
			OrderArrange oa = new OrderArrange();
			oa.setOrder(order);
			List<OrderArrange> oaList = orderArrangeService.findList(oa); // 
			String startDate = oaList.get(0).getArrange().getDate();
			List<String> dateList = new ArrangeController().getDays(startDate, endDate);
			
			/**
			 *  先遍历所有日期的所有房间
			 *  未生成的
			 *  已经住人的
			 */
			for(OrderArrange oArrange : oaList){
				Room room = oArrange.getArrange().getRoom();  // 房间ID
				for(String date : dateList){
					// 将开始日期到续期时间中间的日期状态更改
					Arrange arrange = new Arrange();
					arrange.setRoom(room);
					arrange.setStart(date);
					arrange.setEnd(date);
					List<Arrange> aList = arrangeService.findList(arrange);
					if(aList == null || aList.size() == 0){ // 说明日期未生成
						rd.setErrorMsg(date + "日期太远未生成数据");
						return rd;
					} else {
						String status = aList.get(0).getStatus();
						if("0".equals(status)){
							// 未住人 正常
						} else if("1".equals(status)) {
							// 看是不是还是他续费的。
							OrderArrange oa3 = new OrderArrange();
							oa3.setArrange(arrange);
							List<OrderArrange> orl = orderArrangeService.findList(oa3);
							String orderid = orl.get(0).getOrder().getId();
							if(id.equals(orderid)){
								
							} else {
								rd.setErrorMsg(room.getName() + "在" + date + "被人住了。");
								return rd;
							}
						}
					}
				}
			}
			// 上述判断没有问题，更新状态
			for(OrderArrange oArrange : oaList){
				Room room = oArrange.getArrange().getRoom();  // 房间ID
				for(int i=1;i<dateList.size();i++){
					String date = dateList.get(i); // 把第一天过滤掉
					// 将开始日期到续期时间中间的日期状态更改
					Arrange arrange = new Arrange();
					arrange.setRoom(room);
					arrange.setStart(date);
					arrange.setEnd(date);
					Arrange na = arrangeService.findList(arrange).get(0);
					na.setStatus("1");
					arrangeService.updateStatus(na);
					// 插入arrangeorder表
					OrderArrange oa2 = new OrderArrange();
					oa2.setArrange(na);
					oa2.setOrder(order);
					List<OrderArrange> oa2List = orderArrangeService.findList(oa2);
					// 防止重复提交
					if(oa2== null || oa2List.size() == 0){
						oa2.setId(get32UUID());
						orderArrangeService.add(oa2);;
					}
					
					
				}
			}
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			rd.setErrorMsg("续费失败");
		}
		return rd;
	}
	
	
	//退房 tuifang
	@RequestMapping("tuifang")
	@ResponseBody
	public ResponseDate tuifang(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String orderid = request.getParameter("orderid");
			Order order = new Order();
			order.setId(orderid);
			
			
			OrderArrange oa = new OrderArrange();
			oa.setOrder(order);
			List<OrderArrange> oaList = orderArrangeService.findList(oa);
			float totalprice = 0f;
			for(OrderArrange oo : oaList){
				Arrange a = oo.getArrange();
				totalprice += (a.getRoom().getPrice());
				a.setStatus("2");
				arrangeService.updateStatus(a); // 更新状态
				
			}
			order.setTotalprice(totalprice);
			order.setEndtime(sdf.format(new Date()));
			orderService.update(order);; // 退房，总价
			rd.setSuccess(true);

		} catch (Exception e) {
			rd.setErrorMsg("退房失败");
			e.printStackTrace();
		}
		return rd;
	}
	
	
	
}
