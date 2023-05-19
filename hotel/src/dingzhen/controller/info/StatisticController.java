package dingzhen.controller.info;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dingzhen.common.base.BaseController;
import dingzhen.common.util.StringUtil;
import dingzhen.entity.info.Arrange;
import dingzhen.entity.info.Room;
import dingzhen.service.info.ArrangeService;

/**
 * 统计
 *
 */
@Controller
@RequestMapping("statistic")
@SuppressWarnings({"all"})
public class StatisticController extends BaseController{

	@Autowired
	private ArrangeService arrangeService;
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	@RequestMapping("index")
	public String index(){
		return "info/statistic";
	}
	
	// 按类型查询每个类型的入住占比
	@RequestMapping("loadDataLeixin")
	@ResponseBody
	public Map<String, Integer> loadDataLeixin(HttpServletRequest request){
		String start = request.getParameter("start");
		if(StringUtil.isEmpty(start)){
			start = OrderController.getPastDate(15); // 15天前到今天
		}
		String end = request.getParameter("end");
		if(StringUtil.isEmpty(end)){
			end = sdf.format(new Date());
		}
		Arrange arrange = new Arrange();
		arrange.setStart(start);
		arrange.setEnd(end);
		arrange.setSearchParamA("需要把未住人的去掉");
		/**
		 * <option value='标准间'>标准间</option>
			<option value='单人间'>单人间</option>
			<option value='商务间'>商务间</option>
			<option value='大床房'>大床房</option>
			<option value='其他'>其他</option>
		 */
		int biaozhun = 0;
		int danren = 0;
		int shangwu = 0;
		int dachuang = 0;
		int qita = 0;
		try {
			Room r1 = new Room(); 
			
			r1.setType("标准间");
			arrange.setRoom(r1);
			biaozhun = arrangeService.count(arrange);
			
			r1.setType("单人间");
			arrange.setRoom(r1);
			danren = arrangeService.count(arrange);
			
			r1.setType("商务间");
			arrange.setRoom(r1);
			shangwu = arrangeService.count(arrange);
			
			r1.setType("大床房");
			arrange.setRoom(r1);
			dachuang = arrangeService.count(arrange);
			
			r1.setType("其他");
			arrange.setRoom(r1);
			qita = arrangeService.count(arrange);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Integer> map = new HashMap<>();
		map.put("biaozhun", biaozhun);
		map.put("danren", danren);
		map.put("shangwu", shangwu);
		map.put("dachuang", dachuang);
		map.put("qita", qita);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 查询每天的入住数量
	@RequestMapping("loadData2")
	@ResponseBody
	public Map<String, Object> loadData2(HttpServletRequest request){
		String start = request.getParameter("start");
		if(StringUtil.isEmpty(start)){
			start = OrderController.getPastDate(15); // 15天前到今天
		}
		String end = request.getParameter("end");
		if(StringUtil.isEmpty(end)){
			end = sdf.format(new Date());
		}
		List<String> dateList = new ArrangeController().getDays(start, end);
		String days = "";
		String counts = "";
		try {
			for(String day : dateList){
				days += "," + day;
				
				Arrange arrange = new Arrange();
				arrange.setStart(day);
				arrange.setEnd(day);
				arrange.setSearchParamA("需要把未住人的去掉");
				int count = arrangeService.count(arrange); // 每天的入住
				counts += "," + count;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("days", days.substring(1));
		map.put("counts", counts.substring(1));
		return map;
	}
	
	
	
	// 查询每天的入住的营业额
	/**
	 * 这里的营业额计算方式是按天计算的
	 * 比如某个人定了一个房间3号，4号两天，3号是100元，但是因为4号周末，所以4号的时候150元
	 * 然后退房了，总额是250元，但是统计营业额时是3号100，4号150，而不是3号0，4号250
	 * @param request
	 * @return
	 */
	@RequestMapping("loadData3")
	@ResponseBody
	public Map<String, Object> loadData3(HttpServletRequest request){
		String start = request.getParameter("start");
		if(StringUtil.isEmpty(start)){
			start = OrderController.getPastDate(15); // 15天前到今天
		}
		String end = request.getParameter("end");
		if(StringUtil.isEmpty(end)){
			end = sdf.format(new Date());
		}
		List<String> dateList = new ArrangeController().getDays(start, end);
		String days = "";
		String counts = "";
		try {
			for(String day : dateList){
				days += "," + day;
				
				Arrange arrange = new Arrange();
				arrange.setStart(day);
				arrange.setEnd(day);
				arrange.setSearchParamA("需要把未住人的去掉");
				List<Arrange> al = arrangeService.findList(arrange);
				float totalprice = 0;
				for(Arrange a : al){
					totalprice += a.getPrice();
				}
				counts += "," + totalprice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("days", days.substring(1));
		map.put("counts", counts.substring(1));
		return map;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/** =========================================一下接口全部是按月查询  =================================*/
	@RequestMapping("monthIndex")
	public String monthIndex(){
		return "info/statisticMonth";
	}
	
	
	@RequestMapping("monthloadData2")
	@ResponseBody
	public Map<String, Object> monthloadData2(HttpServletRequest request){
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		List<String> datelist = getMonthBetween(start, end);
		
		String days = "";
		String counts = "";
		try {
			for(String day : datelist){
				days += "," + day;
				Arrange arrange = new Arrange();
				arrange.setStart(day + "-01");
				arrange.setEnd(day + "-31");
				arrange.setSearchParamA("需要把未住人的去掉");
				int count = arrangeService.count(arrange); // 每天的入住
				counts += "," + count;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("days", days.substring(1));
		map.put("counts", counts.substring(1));
		return map;
	}
	
	
	
	@RequestMapping("monthloadData3")
	@ResponseBody
	public Map<String, Object> monthloadData3(HttpServletRequest request){
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String days = "";
		String counts = "";
		List<String> datelist = getMonthBetween(start, end);
		try {
			for(String day : datelist){
				days += "," + day;
				
				Arrange arrange = new Arrange();
				arrange.setStart(day + "-01");
				arrange.setEnd(day + "-31");
				arrange.setSearchParamA("需要把未住人的去掉");
				List<Arrange> al = arrangeService.findList(arrange);
				float totalprice = 0;
				for(Arrange a : al){
					totalprice += a.getPrice();
				}
				counts += "," + totalprice;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<>();
		map.put("days", days.substring(1));
		map.put("counts", counts.substring(1));
		return map;
	}

	
	
	
	
	private static List<String> getMonthBetween(String minDate, String maxDate) {
		try {
			ArrayList<String> result = new ArrayList<String>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");// 格式化为年月
			Calendar min = Calendar.getInstance();
			Calendar max = Calendar.getInstance();
			min.setTime(sdf.parse(minDate));
			min.set(min.get(Calendar.YEAR), min.get(Calendar.MONTH), 1);
			max.setTime(sdf.parse(maxDate));
			max.set(max.get(Calendar.YEAR), max.get(Calendar.MONTH), 2);
			Calendar curr = min;
			while (curr.before(max)) {
				result.add(sdf.format(curr.getTime()));
				curr.add(Calendar.MONTH, 1);
			}
			return result;
		} catch (Exception e) {
			return null;
		}
		
	}
	
	public static void main(String[] args) throws Exception{
		String minDate = "2018-09";
		String maxDate = "2018-11";
		List<String> datelist = getMonthBetween(minDate, maxDate);
		for(String string : datelist){
			System.out.println(string);
		}
		
		
	}
	
	
	
}
