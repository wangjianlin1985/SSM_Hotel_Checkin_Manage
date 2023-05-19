// 关闭时清空表单
$(function() {
	$('#dlg').dialog({
		onClose : function() {
			//closeCustomerDialog();
			$("#fm").form('clear');
		}
	});
});

var url;
//条件搜索
function searchCustomer() {
	$('#dg').datagrid('load', {
		keyword : $("#s_keyword").val()
	});
}
// 打开新增顾客信息对话框
function openCustomerAddDialog() {
	$("#dlg").dialog("open").dialog("setTitle", "添加顾客信息");
	url = 'reserveCustomer.htm';
}

// 打开修改顾客信息对话框
function openCustomerUpdateDialog() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '请选择一条要编辑的数据！');
		return;
	}
	var row = selectedRows[0];
	$("#dlg").dialog("open").dialog("setTitle", "修改顾客信息");
	$("#fm").form("load", row);
	url = "reserveCustomer.htm?id=" + row.id;
}

// 保存顾客信息
function reserveCustomer() {
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
						$.messager.alert('系统提示', '保存成功');
						closeCustomerDialog();
						$("#dg").datagrid("reload");
					}
				}
			});
}

// 关闭添加修改角色对话框
function closeCustomerDialog() {
	$("#fm").form('clear');
	$("#dlg").dialog("close");
}


// 删除顾客
function deleteCustomer() {
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length == 0) {
		$.messager.alert('系统提示', '请选择要删除的数据！');
		return;
	}
	var strIds = [];
	for ( var i = 0; i < selectedRows.length; i++) {
		strIds.push(selectedRows[i].id);
	}
	var ids = strIds.join(",");
	$.messager.confirm("系统提示", "您确认要删除这<font color=red>" + selectedRows.length+ "</font>条数据吗？", function(r) {
		if (r) {
			$.post("deleteCustomer.htm", {
				ids : ids
			}, function(result) {
				if (result.success) {
					$.messager.alert('系统提示', "您已成功删除<font color=red>"	+ strIds.length + "</font>条数据！");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert('系统提示', result.errorMsg);
				}
			}, "json");
		}
	});
}


