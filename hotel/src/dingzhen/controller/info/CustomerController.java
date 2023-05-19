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
import dingzhen.entity.info.Customer;
import dingzhen.entity.info.Customer;
import dingzhen.service.info.CustomerService;

/**
 * 顾客管理
 *
 */
@Controller
@RequestMapping("customer")
@SuppressWarnings({"all"})
public class CustomerController extends BaseController<Customer> {

	@Autowired
	private CustomerService customerService;
	
	// 进入列表
	@RequestMapping("customerIndex")
	public String index(){
		return "info/customer";
	}
	
	//ajax展示列表数据
	@RequestMapping("customerList")
	@ResponseBody
	public ResponseDate<Customer> customerList(HttpServletRequest request,HttpServletResponse response){
		ResponseDate<Customer> rd = new ResponseDate<Customer>();
		try {
			page = Integer.parseInt(request.getParameter("page"));//==null?1:Integer.parseInt(request.getParameter("page"));
			rows = Integer.parseInt(request.getParameter("rows"));//==null?10:Integer.parseInt(request.getParameter("rows"));
			Customer customer = new Customer();
			customer.setPage((page-1)*rows);
			customer.setRows(rows);
			customer.setKeyword(request.getParameter("keyword"));
			List<Customer> list = customerService.findList(customer);
			int total = customerService.count(customer);
			rd.setRows(list);
			rd.setTotal(total);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rd;
	}
	
	

	// 新增或修改
	@RequestMapping("reserveCustomer")
	@ResponseBody
	public ResponseDate reserveCustomer(HttpServletRequest request,Customer customer,HttpServletResponse response){
		String id = request.getParameter("id");
		ResponseDate rd = new ResponseDate();
		try {
			if (StringUtil.isNotEmpty(id)) {   // id不为空 说明是修改
				customer.setId(id);
				customerService.update(customer);
				rd.setSuccess(true);
			}else {   // 添加
				customer.setId(get32UUID());
				customerService.add(customer);
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
	@RequestMapping("deleteCustomer")
	@ResponseBody
	@Transactional
	public ResponseDate deleteCustomer(HttpServletRequest request,HttpServletResponse response){
		ResponseDate rd = new ResponseDate();
		try {
			String[] ids=request.getParameter("ids").split(",");
			for (String id : ids) {
				Customer customer = new Customer();
				customer.setId(id);
				customerService.delete(customer);
			}
			rd.setSuccess(true);
		} catch (Exception e) {
			e.printStackTrace();
			rd.setErrorMsg(DELETE_FAIL);
		}
		return rd;
	}
	
	
	
	
}
