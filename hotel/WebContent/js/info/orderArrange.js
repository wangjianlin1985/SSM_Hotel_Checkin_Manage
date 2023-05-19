var url;
//条件搜索
function searchOrderArrange() {
	$('#dg').datagrid('load', {
		roomname : $("#s_roomname").val()
	});
}

$(function(){
	$('#dg').datagrid({
		url : "orderArrangeList.htm"
	});
});

var xufeiid = '';
function openXufeiDialog(){
	var selectedRows = $("#dg").datagrid('getSelections');
	if (selectedRows.length != 1) {
		$.messager.alert('系统提示', '请选择一条要编辑的数据！');
		return;
	}
	var row = selectedRows[0];
	xufeiid = row.orderid;
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