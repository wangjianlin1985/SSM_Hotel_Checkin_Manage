<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/common.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>顾客主页</title>
   	<script type="text/javascript" src="${path }/js/info/customer.js"></script>
    </head>
 
 
<body style="margin:1px">

<!-- 加载数据表格 -->
<table  id="dg" class="easyui-datagrid" fitColumns="true"
   				 pagination="true" rownumbers="true" url="customerList.htm" fit="true" toolbar="#tb">
        <thead>
            	<tr>
            		<th data-options="field:'ck',checkbox:true"></th>
                	<th data-options="field:'id',hidden:'false'">编号</th>
                	<th field="name" width="60" align="center">姓名</th>
                	<th field="idcardno" width="60" align="center">身份证</th>
                	<th field="phone" width="60" align="center">手机</th>
                	<th field="sex" width="60" align="center">性别</th>
                	<th field="remarks" width="120" align="center">备注</th>
            	</tr>
        </thead>
</table>
    	
<!-- 数据表格上的搜索和添加等操作按钮 -->
<div id="tb" >
	<div class="updownInterval"> </div>
	<div>
		<privilege:operation operationId="b58414d32ade4f00aae39177ab2640" clazz="easyui-linkbutton" onClick="openCustomerAddDialog()" name="添加"  iconCls="icon-add" ></privilege:operation>
		<privilege:operation operationId="df50628c16164d61857cf6699b88cd" clazz="easyui-linkbutton" onClick="openCustomerUpdateDialog()" name="修改"  iconCls="icon-edit" ></privilege:operation>
		<privilege:operation operationId="b3e797ed44254a828c4e0b3b0e5395" clazz="easyui-linkbutton" onClick="deleteCustomer()()" name="删除"  iconCls="icon-remove" ></privilege:operation>
	</div>
	<div class="updownInterval"> </div>
	<div>
		&nbsp;姓名/手机/身份证：&nbsp;<input type="text" name="s_keyword" id="s_keyword" size="20" onkeydown="if(event.keyCode==13) searchCustomer()"/>
		<a href="javascript:searchCustomer()" class="easyui-linkbutton" iconCls="icon-search" >搜索</a>
	</div>
	<div class="updownInterval"> </div>
</div>




<!-- 新增和修改对话框 -->
<div id="dlg" class="easyui-dialog" style="text-align:right;width: 400px;height: 320px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
 <form id="fm" method="post">
 	<table cellspacing="5px;">
  		<tr>
  			<td>姓名：</td>
  			<td><input type="text" id="name" name="name" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>身份证：</td>
  			<td><input type="text" id="idcardno" name="idcardno" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>手机：</td>
  			<td><input type="text" id="phone" name="phone" class="easyui-validatebox" required="true"/></td>
  		</tr>
  		<tr>
  			<td>性别：</td>
  			<td><select name="sex" id="sex">
  				<option value="男">男</option>
  				<option value="女">女</option>
  				<option value="其他">其他</option>
  			</select></td>
  		</tr>
  		<tr>
  			<td>备注：</td>
  			<td><input type="text" id="remarks" name="remarks" /></td>
  		</tr>
  	</table>
 </form>
</div>
<div id="dlg-buttons" style="text-align:center">
	<a href="javascript:reserveCustomer()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
	<a href="javascript:closeCustomerDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>