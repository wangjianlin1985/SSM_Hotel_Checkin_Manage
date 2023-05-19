package dingzhen.controller.info;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.time.DateUtils;
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
import dingzhen.service.info.RoomService;

/**
 * 客房安排 
 */
@Controller
@RequestMapping("arrange")
@SuppressWarnings({"all"})
public class ArrangeController extends BaseController<Arrange>{

	@Autowired
	private ArrangeService arrangeService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderArrangeService orderArrangeService;
	@Autowired
	private RoomService roomService;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat sdfAll = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	
	@RequestMapping("arrangeIndex")
	public String arrangeIndex(){
		return "info/arrange";
	}
	
	
	//ajax展示客房查询
	@RequestMapping("arrangeList")
	@ResponseBody
	public ResponseDate<Arrange> arrangeList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate<Arrange> rd = new ResponseDate<Arrange>();
		try {
			page = Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));
			Arrange arrange = new Arrange();
			arrange.setPage((page-1)*rows);
			arrange.setRows(rows);
			arrange.setStatus(request.getParameter("status")); // 入住状态
			Room room = new Room();
			String roomname = request.getParameter("roomname"); // 客房名称
			if(StringUtil.isNotEmpty(roomname)){
				room.setName(roomname);
			}
			String roomtype = request.getParameter("roomtype"); // 状态
			if(StringUtil.isNotEmpty(roomtype)){
				room.setType(roomtype);
			}
			arrange.setRoom(room);
			
			String start = request.getParameter("start");   // 若不传开始时间则默认今天
			if(StringUtil.isEmpty(start)){
				start = sdf.format(new Date());
			}
			arrange.setStart(start);
			arrange.setEnd(request.getParameter("end"));    // 结束时间
			List<Arrange> list = arrangeService.findList(arrange);
			int total = arrangeService.count(arrange);
			rd.setRows(list);
			rd.setTotal(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
	
	
	// 批量插入
	@RequestMapping("initData")
	@ResponseBody
	@Transactional
	public ResponseDate initData(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String start = request.getParameter("start");
			String end = request.getParameter("end");
			
			List<Room> roomList = roomService.findList(new Room()); // 全部客房
			List<String> dateList = getDays(start, end);   // 全部日期
			for(Room room : roomList){
				for(String date : dateList){
					Arrange arrange = new Arrange();
					arrange.setId(get32UUID());
					arrange.setDate(date);
					arrange.setRoom(room);
					arrangeService.add(arrange);
				}
			}
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
	
	
	@RequestMapping("updatePrice")
	@ResponseBody
	@Transactional
	public ResponseDate deleteCustomer(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String[] ids=request.getParameter("ids").split(",");
			Float price = Float.parseFloat(request.getParameter("price"));
			for (String id : ids) {
				Arrange arrange = new Arrange();
				arrange.setId(id);
				arrange.setPrice(price);
				arrangeService.updatePrice(arrange);
			}
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			rd.setErrorMsg("更新失败");
		}
		return rd;
	}
	
	
	
	
	public static List<String> getDays(String startTime, String endTime) {
        // 返回的日期集合
        List<String> days = new ArrayList<String>();
        try {
            Date start = sdf.parse(startTime);
            Date end = sdf.parse(endTime);
            Calendar tempStart = Calendar.getInstance();
            tempStart.setTime(start);

            Calendar tempEnd = Calendar.getInstance();
            tempEnd.setTime(end);
            tempEnd.add(Calendar.DATE, +1);// 日期加1(包含结束)
            while (tempStart.before(tempEnd)) {
                days.add(sdf.format(tempStart.getTime()));
                tempStart.add(Calendar.DAY_OF_YEAR, 1);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return days;
    }
	
	
	
	// 安排顾客入住
	@RequestMapping("arrangeCustomer")
	@ResponseBody
	@Transactional
	public ResponseDate arrangeCustomer(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String arrangeids[] = request.getParameter("arrangeids").split(",");
			String customerid = request.getParameter("customerid");
			
			Customer customer = new Customer();
			customer.setId(customerid);
			// 1插入订单表生成订单
			Order order = new Order();
			order.setId(get32UUID());
			order.setCustomer(customer);
			order.setStarttime(sdfAll.format(new Date()));
			order.setTotalprice(0f);
			orderService.add(order);
			
			for(String arrangeid : arrangeids){
				Arrange arrange = new Arrange();
				arrange.setId(arrangeid);
				
				
				
				// 2插入arrangeorder关联表
				OrderArrange oa = new OrderArrange();
				oa.setId(get32UUID());
				oa.setOrder(order);
				oa.setArrange(arrange);
				orderArrangeService.add(oa);
				
				// 3更新房间状态
				arrange.setStatus("1");
				arrangeService.updateStatus(arrange);
			}
			
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			rd.setErrorMsg("入住失败");
		}
		return rd;
	}
	
	
	
	public static void main(String[] args) {
		String start = "2019-03-01";
		String end = "2019-03-01";
		List<String> date = getDays(start, end);
		for(String string : date){
			System.out.println(string);
		}
	}
	
	
}
