// 关闭时清空表单
$(function() {
	$('#dlg').dialog({
		onClose : function() {
			//closeArrangeDialog();
			$("#fm").form('clear');
		}
	});
});

var url;
//条件搜索
function searchArrange() {
	$('#dg').datagrid('load', {
		status : $("#s_status").val(),
		roomtype : $("#s_roomtype").val(),
		roomname : $("#s_roomname").val(),
		start : $('#s_start').datebox('getValue'),
		end : $('#s_end').datebox('getValue')
	});
}

function openRoomInitDialog() {
	$("#dlg").dialog("open").dialog("setTitle", "批量生产");
	url = 'initData.htm';
}


// 保存客房信息
function initArrangeData() {
	$("#fm").form(
			"submit",
			{
				url : url,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.alert('系统提示', "<font color=red>"+ result.errorMsg + "</font>");
						return;
					} else {
						$.messager.alert('系统提示', '生成成功');
						closeArrangeDialog();
						$("#dg").datagrid("reload");
					}
				}
			});
}


function closeArrangeDialog() {
	$("#fm").form('clear');
	$("#dlg").dialog("close");
}


function openRoomUpdateDialog() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert('系统提示', '请选择要修改的数据！');
		return;
	}
	var strIds = [];
	for ( var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].id);
	}
	var ids = strIds.join(",");
	$.messager.prompt('修改价格', '请输入新的价格（数字）:', function(r){
		if (r){
			$.post("updatePrice.htm", {
				ids : ids,
				price : r 
			}, function(result) {
				if (result.success) {
					$.messager.alert('系统提示', "操作成功！");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert('系统提示', result.errorMsg);
				}
			}, "json");
		}
	});
}

var arrangeids ;
function openAddCustomerDialog(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert('系统提示', '至少选择一个房间！');
		return;
	}
	if(selectedRows[0].status != "0"){
		$.messager.alert('系统提示', '只能选择未住人房间！');
		return;
	}
	$("#dlg2").dialog("open").dialog("setTitle", "选择客户");
	var strIds = [];
	for ( var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].id);
	}
	arrangeids = strIds.join(",");
}

function searchCustomer(){
	$('#dg2').datagrid('load', {
		keyword : $("#s_keyword").val()
	});
}

function chooseCustomer(){
	var selectedRows = $("#dg2").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '只能选择一名顾客！');
		return;
	}
	var customerid = selectedRows[0].id;
	$.messager.confirm("系统提示", "您确认要这么做吗？", function(r) {
		if (r) {
			$.post("arrangeCustomer.htm", {
				arrangeids : arrangeids,
				customerid : customerid
			}, function(result) {
				if (result.success) {
					$.messager.alert('系统提示', "操作成功！");
					$("#dg").datagrid("reload");
					closeChooseCustomerDialog();
				} else {
					$.messager.alert('系统提示', result.errorMsg);
				}
			}, "json");
		}
	});
	
	
}

function closeChooseCustomerDialog(){
	arrangeid = "";
	$("#dlg2").dialog("close")
}




