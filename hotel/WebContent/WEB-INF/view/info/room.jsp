<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>顾客主页</title>
   	<script type="text/javascript" src="${path }/js/info/room.js"></script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="roomList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
                	<th data-options="field:'id',hidden:'false'">编号</th>
                	<th field="name" width="60" align="center">编号</th>
                	<th field="type" width="60" align="center">类型</th>
                	<th field="price" width="60" align="center">价格</th>
            	</tr>
        </thead>
</table>
    	
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="5072e087f81544fd9b332880b47a69" clazz="easyui-linkbutton" onClick="openRoomAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="ef01768920b14dca8b9d94bbc0356a" clazz="easyui-linkbutton" onClick="openRoomUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="437de6e644bc4767adf0c699af5d3c" clazz="easyui-linkbutton" onClick="deleteRoom()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;编号：&nbsp;<input type="text" name="s_name" id="s_name" size="20" onkeydown="if(event.keyCode==13) searchRoom()"/>
		&nbsp;类型：&nbsp;
		<select id="s_type" >
			<option value=''>全部</option>
			<option value='标准间'>标准间</option>
			<option value='单人间'>单人间</option>
			<option value='商务间'>商务间</option>
			<option value='大床房'>大床房</option>
			<option value='其他'>其他</option>
		</select>
		<a href="javascript:searchRoom()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>




<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" style="text-align:right;width: 400px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>编号：</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>类型：</td>
  			<td>
  				<select name="type" >
					<option value='标准间'>标准间</option>
					<option value='单人间'>单人间</option>
					<option value='商务间'>商务间</option>
					<option value='大床房'>大床房</option>
					<option value='其他'>其他</option>
				</select>
  			</td>
  		</tr>
  		<tr>
  			<td>价格：</td>
  			<td><input type="text" id="price" name="price" class="easyui-numberbox" required="true"/></td>
  		</tr>
  	
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveRoom()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeRoomDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>