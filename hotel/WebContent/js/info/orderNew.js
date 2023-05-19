var url;
//条件搜索
function searchOrder() {
	$('#dg').datagrid('load', {
		keyword : $("#s_keyword").val(),
		roomname : $('#s_roomname').val()
	});
}

// 查看详情
function openDetailDialog(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '只能选择一个订单！');
		return;
	}
	var ord = selectedRows[0];
	var orderid = ord.id;
	var str = "开始时间：" + ord.starttime + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	var en = ord.endtime;
	if(en == null || en == "null"){
		en = "";
	}
	str +=    "结束时间：" + en + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	str +=    "总价：" + ord.totalprice + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	$("#orderinfo").html(str);
	
	$('#dg2').datagrid({
		url : path + "/order/orderArrangeList.htm?orderid=" + orderid
	});  
	$("#dlg2").dialog("open").dialog("setTitle", "详情");
	
}


// 退房
function tuifangDialog(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '只能选择一个订单！');
		return;
	}
	var ord = selectedRows[0];
	var orderid = ord.id;
	$.messager.confirm("系统提示", "您确认要退房吗？", function(r) {
		if (r) {
			$.post("tuifang.htm", {
				orderid : orderid
			}, function(result) {
				if (result.success) {
					$.messager.alert('系统提示', "退房成功！");
					$("#dg").datagrid("reload");
				} else {
					$.messager.alert('系统提示', result.errorMsg);
				}
			}, "json");
		}
	});
	
}



// 续费
var xufeiid = '';
function openXufeiDialog(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '请选择一条要编辑的数据！');
		return;
	}
	var row = selectedRows[0];
	xufeiid = row.id;
	$("#dlg").dialog("open").dialog("setTitle", "续费");
}


function saveXufei(){
	$("#fm").form(
			"submit",
			{
				url : 'xufei.htm?id=' + xufeiid,
				onSubmit : function() {
					return $(this).form("validate");
				},
				success : function(result) {
					var result = eval('(' + result + ')');
					if (result.errorMsg) {
						$.messager.alert('系统提示', "<font color=red>"+ result.errorMsg + "</font>");
						return;
					} else {
						$.messager.alert('系统提示', '操作成功');
						closeXufeiDialog();
						$("#dg").datagrid("reload");
					}
				}
			});
}

function closeXufeiDialog(){
	$("#fm").form('clear');
	$("#dlg").dialog("close");
	xufeiid = '';
}