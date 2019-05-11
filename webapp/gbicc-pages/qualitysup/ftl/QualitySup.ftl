<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="�������  &gt; ��������ѯ">
	<@CommonQueryMacro.CommonQuery id="QualitySup" init="false" submitMode="current">
			<div style="margin: 0 0px 0 0">
				<@CommonQueryMacro.Interface id="qalityquery" label="�����ල��ѯ" colNm="4" showButton="false"/>
			</div>
			<center>
				<@CommonQueryMacro.Button id="btQuery"/>
				<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
			</center>
			<@CommonQueryMacro.DataTable id="QualityTable" title="��ѯ���"  fieldStr="loanAcct[150],warningLevel,custName,loanVariety[200],loanAmt,loanBalance,loanTerm,handler,bankname[200],taskType,taskCreatDate,completeDate" width="100%" hasFrame="true"/>
 <#--     	<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" > -->	
			
	</@CommonQueryMacro.CommonQuery>

<script language="JavaScript">
	//���ò�ѯ����
	function btnReset_onClick(button){
		QualitySup_interface_dataset.clearData();
	}
	//��λһ�м�¼
	function locate(id) {
		var record = QualitysuPar_dataset.find(["id"],[id]);
		if(record) {
			QualitysuPar_dataset.setRecord(record);
		}
	}
	//ϵͳˢ�µ�Ԫ��
	function datatable1_operation_onRefresh(cell,value,record) {
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
	function btQuery_onClick() {
		
		var productName=QualitySup_interface_dataset.getValue("productName");
		var taskType=QualitySup_interface_dataset.getValue("taskType");
		var handler=QualitySup_interface_dataset.getValue("handler");
		var custName=QualitySup_interface_dataset.getValue("custName");
		var bankname=QualitySup_interface_dataset.getValue("bankname");
		var qualitysupperc=QualitySup_interface_dataset.getValue("qualitysupperc");
		if(qualitysupperc>100||qualitysupperc<0){
			alert("������0-100%֮�ڵĳ�������");
			return false;
		}
		QualitySup_dataset.setParameter("productName",productName);
		QualitySup_dataset.setParameter("taskType",taskType);
		QualitySup_dataset.setParameter("handler",handler);
		QualitySup_dataset.setParameter("custName",custName);
		QualitySup_dataset.setParameter("bankname",bankname);
		QualitySup_dataset.setParameter("queryflag","queryflag");
		QualitySup_dataset.setParameter("qualitysupperc",qualitysupperc);

		QualitySup_dataset.flushData();
		
		QualitySup_dataset.setParameter("queryflag","");
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
		QualitysuPar_dataset.insertRecord("end");
		QualitysuPar_dataset.setFieldReadOnly("id",true);
		QualitysuPar_dataset.setFieldReadOnly("bankName",false);
		QualitysuPar_dataset.setFieldReadOnly("productName",false);
		QualitysuPar_dataset.setFieldReadOnly("riskSignal",false);
		QualitysuPar_dataset.setFieldReadOnly("assureType",false);
		QualitysuPar_dataset.setFieldReadOnly("warningLevel",false);
		QualitysuPar_dataset.setFieldReadOnly("status",false);
		QualitysuPar_dataset.setFieldReadOnly("startTime",false);
		QualitysuPar_dataset.setFieldReadOnly("endTime",false);
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
		QualitysuPar_dataset.setFieldReadOnly("warningLevel",true);
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
	//�����ˢ�µ�ǰҳ

	//ˢ�µ�ǰҳ
	function flushCurrentPage() {
		QualitysuPar_dataset.flushData(QualitysuPar_dataset.pageIndex);
	}

</script>	
</@CommonQueryMacro.page>