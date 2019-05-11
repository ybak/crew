<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign userInfo_=Session["USER_SESSION_INFO"] />
<@CommonQueryMacro.page title="�������  &gt; ��������ѯ">
	<@CommonQueryMacro.CommonQuery id="TRiskruleList" init="false" submitMode="current" >
			<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" colNm=6 showButton="false" />
			<center><@CommonQueryMacro.Button id="btQuery"/>&nbsp;&nbsp;&nbsp;&nbsp;<@CommonQueryMacro.Button id="btRest"/></center>
			<@CommonQueryMacro.DataTable id="QualityTable" title="��ѯ���" paginationbar="forminfo"  width="600" fieldStr="warnSignal[110],ruleCode[130],ruleDesc[150],warningLevel[120],lounAcc[180],custName[100],productName[200],loanAmt[120],loanBalance[120],operator[100],bankName[160],warnDate[100],isNewcust[40]" width="100%" hasFrame="true"/>
	     	<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" />
 	</@CommonQueryMacro.CommonQuery>
 <#--	<@CommonQueryMacro.ToolBar id="mytoolbar">
 	<div class="search" style="margin:0 20px 0 50px">
			<table>
			<tr >
			<td id="test" class="labeltd">�������</td><td class="datatd" colspan=6><@CommonQueryMacro.InterfaceElement elId="ruleDesc" isSingle="true"/></td>
			</tr>
			<tr>
			<td class="labeltd">�ͻ�����</td><td class="datatd" colspan=3><@CommonQueryMacro.InterfaceElement elId="custName" isSingle="true"/></td>
			<td class="labeltd" align="right"> Ԥ���ȼ�</td><td class="datatd"><@CommonQueryMacro.InterfaceElement elId="warningLevel" isSingle="true"/></td>
			</tr>
			<tr>
			<td class="labeltd">������</td><td class="datatd" colspan=3 align="left" ><@CommonQueryMacro.InterfaceElement elId="bankName" isSingle="true"/></td>
			<td class="labeltd" align="right"> ��Ʒ����</td><td  class="datatd" ><@CommonQueryMacro.InterfaceElement elId="productName" isSingle="true"/></td>
			</tr>
			<td class="labeltd">Ԥ��ʱ��</td><td class="datatd" style="padding:0 0 0 0" align="left" ><@CommonQueryMacro.InterfaceElement elId="warnDate" isSingle="true"/></td><td ><div style="margin:0 6px 0 0" class="labeltd">-</div></td><td class="datatd" align="left"><@CommonQueryMacro.InterfaceElement elId="lastwarnDate" isSingle="true"/></td>
			<td class="labeltd" align="right"> �����˺�</td><td class="datatd"><@CommonQueryMacro.InterfaceElement elId="lounAcc" isSingle="true"/></td>
			</tr>
			<tr>
			<td colspan=6 align="right"><div style="margin:0 20px 0 0"><@CommonQueryMacro.Button id="btQuery" /></div></td>
			</tr>
			</table> 
	</div>		
	</@CommonQueryMacro.ToolBar> 	-->	


<script language="JavaScript">
	function initCallGetter_post(){
		if(user_info.roleId=="222"||user_info.roleId=="333"){
			TRiskruleList_interface_dataset.setFieldReadOnly("bankName",true);
		}
		TRiskruleList_dataset.setParameter("flag","list");
		TRiskruleList_dataset.setParameter("roleId",user_info.roleId);
		TRiskruleList_dataset.setParameter("orgId",user_info.orgId);
		TRiskruleList_dataset.setParameter("userId",user_info.userId);
		TRiskruleList_dataset.flushData();
		TRiskruleList_dataset.setParameter("flag","");
	}
	//�ж��Ƿ�Ϊ��
//	function TRiskruleList_dataset_flushDataPost(dataset){
//		alert('��ѯ���');
//	}
	
	function btQuery_onClickCheck(button)
	{
		var ruleDesc=TRiskruleList_interface_dataset.getValue('ruleDesc');
		var custName=TRiskruleList_interface_dataset.getValue('custName');
		var bankName=TRiskruleList_interface_dataset.getValue('bankName');
		var productName=TRiskruleList_interface_dataset.getValue('productName');
		var warnDate=TRiskruleList_interface_dataset.getValue('warnDate');
		var lounAcc=TRiskruleList_interface_dataset.getValue('lounAcc');
		var lastwarnDate=TRiskruleList_interface_dataset.getValue('lastwarnDate');
		var warningLevel=TRiskruleList_interface_dataset.getValue('warningLevel');
		
		TRiskruleList_dataset.setParameter("roleId",user_info.roleId);
		TRiskruleList_dataset.setParameter("orgId",user_info.orgId);
		TRiskruleList_dataset.setParameter("userId",user_info.userId);
		TRiskruleList_dataset.setParameter("ruleDesc",ruleDesc);
		TRiskruleList_dataset.setParameter("custName",custName);
		TRiskruleList_dataset.setParameter("bankName",bankName);
		TRiskruleList_dataset.setParameter("productName",productName);
		TRiskruleList_dataset.setParameter("warnDate",warnDate);
		TRiskruleList_dataset.setParameter("lounAcc",lounAcc);
		TRiskruleList_dataset.setParameter("lastwarnDate",lastwarnDate);
		TRiskruleList_dataset.setParameter("warningLevel",warningLevel);
		TRiskruleList_dataset.setParameter("flag","list");
		if(warningLevel==""&&ruleDesc==""&&custName==""&&bankName==""&&productName==""&&warnDate==""&&lounAcc==""){
				alert("����������һ����ѯ����");
				return false;
		}
		return true;
	}
	
	function btQuery_onClick(button){
		TRiskruleList_dataset.flushData(1);
		TRiskruleList_dataset.setParameter("flag","");
	}
	function btRest_onClick(button){
		TRiskruleList_interface_dataset.clearData();
	}

	//ϵͳˢ�µ�Ԫ��
	function datatable1_zz_onRefresh(cell,value,record) {
		if(record) {
			var id = record.getValue("id");
			if( !(''==id || null == id))
			{
				cell.innerHTML="<center><a href=\"JavaScript:openModifyWindow('"+id+"')\">�޸�</a> &nbsp; <a href=\"JavaScript:doDel('"+id+"')\">ɾ��</a></center>";
			}
			
		}else {
			cell.innerHTML="&nbsp;";
		}
	}
	function btAdd_onClick(button) {
			btNewClick();
	}
	function btModify_onClick(button){
		btModifyClick();
	}
	//ȡ������
	function btCancel_onClickCheck(button) {
		//�رո�������
		subwindow_signWindow.close();
	}
	//�ظ�������,�ͷ�dataset
	function signWindow_floatWindow_beforeClose(subwindow) {
		QualitysuPar_dataset.cancelRecord();
		return true;
	}
	function signWindow_floatWindow_beforeHide(subwindow) {
		return signWindow_floatWindow_beforeClose(subwindow);
	}
	
	//��������
	function btNewClick() {
		subwindow_signWindow.show();

	}
	function btModifyClick() {
			var id = QualitysuPar_dataset.getValue('id');
			QualitysuPar_dataset.setFieldReadOnly("bankName",true);
			openModifyWindow(id);
		}
	//չʾ�Աȹ��ܵ�js
	function datatable1_id_onRefresh(cell, value, record){
		if(record!=null){
			var id=record.getValue("id");
			cell.innerHTML = "<a href=\"Javascript:showDetail('"+id+"')\">"+id+"</a>";
	
		} else {
			cell.innerHTML = ""
		}
	}

	//�޸Ĺ���
	function openModifyWindow(id) {
		QualitysuPar_dataset.setFieldReadOnly("id",true);
		QualitysuPar_dataset.setFieldReadOnly("bankName",true);
		QualitysuPar_dataset.setFieldReadOnly("productName",true);
		QualitysuPar_dataset.setFieldReadOnly("riskSignal",true);
		QualitysuPar_dataset.setFieldReadOnly("assureType",true);
		QualitysuPar_dataset.setFieldReadOnly("status",true);
		QualitysuPar_dataset.setFieldReadOnly("startTime",true);
		QualitysuPar_dataset.setFieldReadOnly("endTime",true);
		subwindow_signWindow.show();	
	}
	function btModOrAdd_postSubmit(button) {
		button.url="#";
		subwindow_signWindow.close();
		flushCurrentPage();
	}	

	function showDetail(id,sta){		
		var paramMap = new Map();
		paramMap.put("id",id);
		paramMap.put("st",sta);
		paramMap.put("action","detail");
		paramMap.put("flag","0");
		
	}
	function btModOrAdd_onClickCheck(button) {
		var id = QualitysuPar_dataset.getValue("id");
		return true;
	}
	function custinfo_onClick(){
		var id = QualitysuPar_dataset.getValue('id');
		btCustomerShow(id);
	}

	function forminfo_onClick(){
		if(!TRiskruleList_dataset.record){
			alert('��ѡ��һ������!');
			return;		
		}
		var contextPath="${contextPath}";
		var date=TRiskruleList_dataset.getValue('warnDateStr');
		var ruleId=TRiskruleList_dataset.getValue('ruleID');
		var loanAccount=TRiskruleList_dataset.getValue('lounAcc');
		openSubWin("uploadFile", "Ԥ����ϸ", 
			"/gbicc-pages/warn/ftl/warn_table.ftl?ruleId="+ruleId
			+"&date="+date+"&loanAccount="+loanAccount,1200,500);
	}
</script>	
</@CommonQueryMacro.page>