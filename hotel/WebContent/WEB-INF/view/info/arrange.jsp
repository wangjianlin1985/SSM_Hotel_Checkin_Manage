<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>客房查询</title>
   	<script type="text/javascript" src="${path }/js/info/arrange.js"></script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="arrangeList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
                	<th data-options="field:'id',hidden:'false'">编号</th>
                	<th field="date" width="60" align="center">日期</th>
                	<th field="roomname" width="60" align="center" formatter="formatRoommame">房间号</th>
                	<th field="roomtype" width="60" align="center" formatter="formatRoomtype">类型</th>
                	<th field="status" width="60" align="center"   formatter="formatStatus">状态</th>
                	<th field="price" width="60" align="center">价格</th>
            	</tr>
        </thead>
</table>
<script type="text/javascript">
	function formatRoommame(value,row,index){
		return row.room.name;
	}
	function formatRoomtype(value,row,index){
		return row.room.type;
	}
	function formatStatus(value,row,index){
		if(value=="0"){
			return "未住人";
		} else if(value=="1"){
			return "已住人";
		} else {
			return "已结算";
		}
	}
</script>
    	
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="7360ca61da574656807568d18f61a3" clazz="easyui-linkbutton" onClick="openRoomInitDialog()" name="生成数据"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="0f209d86e9514d04986d1f6058c6aa" clazz="easyui-linkbutton" onClick="openRoomUpdateDialog()" name="修改价格"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="2bd54615b5b8418aa27ab37e0fb675" clazz="easyui-linkbutton" onClick="openAddCustomerDialog()" name="顾客入住"  iconCls="icon-edit" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;开始：&nbsp;<input id="s_start" type="text" class="easyui-datebox">
		&nbsp;结束：&nbsp;<input id="s_end" type="text" class="easyui-datebox" >
		&nbsp;房间号：&nbsp;<input type="text" name="s_roomname" id="s_roomname" size="20" onkeydown="if(event.keyCode==13) searchArrange()"/>
		&nbsp;房间类型：&nbsp;
		<select id="s_roomtype" >
			<option value=''>全部</option>
			<option value='标准间'>标准间</option>
			<option value='单人间'>单人间</option>
			<option value='商务间'>商务间</option>
			<option value='大床房'>大床房</option>
			<option value='其他'>其他</option>
		</select>
		&nbsp;状态：&nbsp;
		<select id="s_status" >
			<option value=''>全部</option>
			<option value='0'>未住人</option>
			<option value='1'>已住人</option>
			<option value='2'>已结算</option>
		</select>
		<a href="javascript:searchArrange()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>




<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" style="text-align:right;width: 400px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>开始日期：</td>
  			<td><input id="start" name="start" type="text" class="easyui-datebox"></td>
  		</tr>
  		<tr>
  			<td>结束日期：</td>
  			<td><input id="end" name="end" type="text" class="easyui-datebox"></td>
  		</tr>
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:initArrangeData()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeArrangeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>



<div id="dlg2" class="easyui-dialog" iconCls="icon-search" style="width: 500px;height: 480px;padding: 10px 20px"
  closed="true" buttons="#dlg2-buttons">
  <div style="height: 40px;" align="center">
  	关键字：<input type="text" id="s_keyword" name="s_keyword" onkeydown="if(event.keyCode==13) searchCustomer()"/>
  	<a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
  </div>
  <div style="height: 350px;">
  	<table id="dg2" title="查询结果" class="easyui-datagrid" fitColumns="true"  pagination="true" rownumbers="true" url="${path }/customer/customerList.htm" singleSelect="true" fit="true" >
    <thead>
    	<tr>
    		<th data-options="field:'ck2',checkbox:true"></th>
    		<th field="id" width="50" align="center" data-options="hidden:true">编号</th>
    		<th field="name" width="100" align="center">姓名</th>
    		<th field="phone" width="100" align="center">电话</th>
    		<th field="idcardno" width="200" align="center">身份证</th>
    	</tr>
    </thead>
</table>
  </div>
</div>

<div id="dlg2-buttons">
	<a href="javascript:chooseCustomer()" class="easyui-linkbutton" iconCls="icon-ok" >确定</a>
	<a href="javascript:closeChooseCustomerDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>
