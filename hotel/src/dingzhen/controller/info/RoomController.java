package dingzhen.controller.info;

import java.util.List;

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
import dingzhen.entity.info.Room;
import dingzhen.service.info.RoomService;

/**
 * 客房管理 
 *
 */

@Controller
@RequestMapping("room")
@SuppressWarnings({"all"})
public class RoomController extends BaseController<Room>{

	@Autowired
	private RoomService roomService;
	
	// 进入列表
	@RequestMapping("roomIndex")
	public String index(){
		return "info/room";
	}
	
	//ajax展示列表数据
	@RequestMapping("roomList")
	@ResponseBody
	public ResponseDate<Room> roomList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate<Room> rd = new ResponseDate<Room>();
		try {
			page = Integer.parseInt(request.getParameter("page"));//==null?1:Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));//==null?10:Integer.parseInt(request.getParameter("rows"));
			Room room = new Room();
			room.setPage((page-1)*rows);
			room.setRows(rows);
			room.setName(request.getParameter("name"));
			room.setType(request.getParameter("type"));
			List<Room> list = roomService.findList(room);
			int total = roomService.count(room);
			rd.setRows(list);
			rd.setTotal(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
	

	// 新增或修改
	@RequestMapping("reserveRoom")
	@ResponseBody
	public ResponseDate reserveRoom(HttpServletRequest request,Room room,HttpServletResponse response){
		String id = request.getParameter("id");
		ResponseDate rd = new ResponseDate();
		try {
			if (StringUtil.isNotEmpty(id)) {   // id不为空 说明是修改
				room.setId(id);
				roomService.update(room);
				rd.setSuccess(true);
			}else {   // 添加
				room.setId(get32UUID());
				roomService.add(room);
				rd.setSuccess(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			rd.setSuccess(true);
			rd.setErrorMsg(OPERATION_FAIL);
		}
		return rd;
	}
	
	
	// 批量删除
	@RequestMapping("deleteRoom")
	@ResponseBody
	@Transactional
	public ResponseDate deleteRoom(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				Room room = new Room();
				room.setId(id);
				roomService.delete(room);
			}
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			rd.setErrorMsg(DELETE_FAIL);
		}
		return rd;
	}
	
	
	
	
}
