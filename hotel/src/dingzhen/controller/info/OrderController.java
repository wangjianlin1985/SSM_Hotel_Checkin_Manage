package dingzhen.controller.info;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import dingzhen.common.base.BaseController;
import dingzhen.common.base.ResponseDate;
import dingzhen.common.util.StringUtil;
import dingzhen.entity.info.Order;
import dingzhen.entity.info.OrderArrange;
import dingzhen.entity.info.Room;
import dingzhen.service.info.OrderArrangeService;
import dingzhen.service.info.OrderService;


// 订单管理
@Controller
@RequestMapping("order")
@SuppressWarnings({"all"})
public class OrderController extends BaseController<Order>{

	@Autowired
	private OrderArrangeService orderArrangeService;
	@Autowired
	private OrderService orderService;
	
	
	@RequestMapping("orderIndex")
	public String orderIndex(){
		return "info/order";
	}
	
	
	@RequestMapping("orderList")
	//ajax展示客房查询
	@ResponseBody
	public ResponseDate<Order> orderList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate<Order> rd = new ResponseDate<Order>();
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			Order order = new Order();
			order.setPage((page-1)*rows);
			order.setRows(rows);
			/**
			 * 若endtime为空  查询全部
			 * 若endtime为1 查询结账了的
			 * endtim为2  未结账的
			 */
			order.setEndtime(request.getParameter("endtime"));
			
			order.setEnd(request.getParameter("end")); // 结束时间
			// 开始时间，若开始时间为空，则默认查7天前的。
			String start = request.getParameter("start");
			if(StringUtil.isEmpty(start)){
				start = getPastDate(7);
			}
			order.setStart(start);
			
			String keyword = request.getParameter("keyword"); // 客户关键字姓名身份证手机等
			order.setKeyword(keyword);
			
			
			
			List<Order> list = orderService.findList(order);
			int total = orderService.count(order);
			rd.setRows(list);
			rd.setTotal(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}

	
	// 获取past天之前的日期
	public static String getPastDate(int past) {  
		Calendar calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);  
		Date today = calendar.getTime();  
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
		String result = format.format(today);  
		return result;  
	}  
	
	
	
	// 该订单下的房间信息
	@RequestMapping("orderArrangeList")
	@ResponseBody
	public ResponseDate orderArrangeList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String orderid = request.getParameter("orderid");
			Order order = new Order();
			order.setId(orderid);
			OrderArrange oa = new OrderArrange();
			oa.setOrder(order);
			List<OrderArrange> oaList = orderArrangeService.findList(oa);
			List<Map<String, Object>> mapList = new ArrayList<>();
			for(OrderArrange  orderArrange : oaList){
				Map<String, Object> map = new HashMap<>();
				map.put("roomname", orderArrange.getArrange().getRoom().getName());
				map.put("livedate", orderArrange.getArrange().getDate());
				mapList.add(map);
			}
			rd.setRows(mapList);
			rd.setTotal(0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
}
