var url;
//条件搜索
function searchOrder() {
	$('#dg').datagrid('load', {
		endtime : $("#s_endtime").val(),
		keyword : $("#s_keyword").val(),
		start : $('#s_start').datebox('getValue'),
		end : $('#s_end').datebox('getValue')
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
		url : "orderArrangeList.htm?orderid=" + orderid
	});  
	$("#dlg2").dialog("open").dialog("setTitle", "详情");
	
}