<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="���̹���  &gt;  �������">
	<@CommonQueryMacro.CommonQuery id="TaskEntry" init="false" submitMode="current">
		<@CommonQueryMacro.Interface id="qalityquery" label="��ѯ" colNm="6"  showButton="false" />
				<center>
					<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
					<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
				</center>
		<@CommonQueryMacro.DataTable height="560"   id="monitorReportTable" paginationbar="btHandle" readonly="true" 
		fieldStr="warnLevel[80],loanAcct[150],custName[100],loanVariety[180],loanAmt[100],loanBalance[100],loanTerm[80],rptStatus[150],taskType[100],taskMatureDate[90],handler[80],currentUserName[80],ifTimeout[80]" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
	<script type="text/javascript" src="${contextPath}/gbicc-pages/regular/comm/common.js"></script>
	<script>
	function initCallGetter_post(){
		TaskEntry_interface_dataset.setValue('warnLevel','6');
		TaskEntry_dataset.setParameter("type","todoTask");
		TaskEntry_dataset.setParameter("monitor","monitor");
		TaskEntry_dataset.setParameter("warnLevel","6");//Ĭ�ϲ�ѯ6��
		TaskEntry_dataset.flushData(TaskEntry_dataset.pageIndex);
	}
	function btnReset_onClick(button){
		TaskEntry_interface_dataset.clearData();
	}
	function monitorReportTable_onDbClick(){
		btHandle_onClick();
	}
	function btHandle_onClick(){
		var businessId=TaskEntry_dataset.getValue("id");
		var rptStatus=TaskEntry_dataset.getValue("rptStatus");
		var custName=TaskEntry_dataset.getValue("custName");
		var loanAcct=TaskEntry_dataset.getValue("loanAcct");
		var reportUrl=TaskEntry_dataset.getValue("reportUrl");
		var taskType=TaskEntry_dataset.getValue("taskType");

		var title="������";
		
		if(taskType==TASK_TYPE.DQ&&rptStatus==REPORT_STATUS.wait_fill_report){
			title="��д���ڼ�ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.DQ&&(rptStatus==REPORT_STATUS.wait_hz_approve || rptStatus==REPORT_STATUS.wait_dhzg_approve)){
			title="��˶��ڼ�ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.DQ&&rptStatus==REPORT_STATUS.back){
			title="���ڼ�ر��汻�˻�("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.DQ&&rptStatus==REPORT_STATUS.wait_examine){
			title="��鶨�ڼ�ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.DQ&&rptStatus==REPORT_STATUS.approve_pass){
			title="���ڼ�ر������ͨ��������д��ʩ���ʱ��("+custName+"��"+loanAcct+"��)";
		}
		else if(taskType==TASK_TYPE.YJ&&rptStatus==REPORT_STATUS.wait_fill_report){
			title="��дԤ�����ñ���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YJ&&(rptStatus==REPORT_STATUS.wait_hz_approve || rptStatus==REPORT_STATUS.wait_dhzg_approve)){
			title="���Ԥ�����ñ���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YJ&&rptStatus==REPORT_STATUS.back){
			title="Ԥ�����ñ��汻�˻�("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YJ&&rptStatus==REPORT_STATUS.wait_examine){
			title="���Ԥ�����ñ���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YJ&&rptStatus==REPORT_STATUS.approve_pass){
			title="Ԥ�����ñ������ͨ��������д��ʩ���ʱ��("+custName+"��"+loanAcct+"��)";
		}
		else if(taskType==TASK_TYPE.RF&&rptStatus==REPORT_STATUS.wait_fill_report){
			title="��д��С�ڸ�����("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.RF&&(rptStatus==REPORT_STATUS.wait_hz_approve || rptStatus==REPORT_STATUS.wait_dhzg_approve)){
			title="�����С�ڸ�����("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.RF&&rptStatus==REPORT_STATUS.back){
			title="��С�ڸ����汻�˻�("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.RF&&rptStatus==REPORT_STATUS.wait_examine){
			title="�����С�ڸ�����("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.RF&&rptStatus==REPORT_STATUS.approve_pass){
			title="��С�ڸ��������ͨ��������д��ʩ���ʱ��("+custName+"��"+loanAcct+"��)";
		}
		else if(taskType==TASK_TYPE.YT&&rptStatus==REPORT_STATUS.wait_fill_report){
			title="��д��;��ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YT&&(rptStatus==REPORT_STATUS.wait_hz_approve || rptStatus==REPORT_STATUS.wait_dhzg_approve)){
			title="�����;��ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YT&&rptStatus==REPORT_STATUS.back){
			title="��;��ر��汻�˻�("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YT&&rptStatus==REPORT_STATUS.wait_examine){
			title="�������;��ر���("+custName+"��"+loanAcct+"��)";
		}else if(taskType==TASK_TYPE.YT&&rptStatus==REPORT_STATUS.approve_pass){
			title="��;��ر������ͨ��������д��ʩ���ʱ��("+custName+"��"+loanAcct+"��)";
		}
		
		var path=reportUrl+"?businessId="+businessId+"&rptStatus="+rptStatus+"&loanAcct="+loanAcct;
		//var pageReadOnly=TaskEntry_dataset.getValue("pageReadOnly");
		//if(rptStatus==REPORT_STATUS.complete||pageReadOnly=='0'){
		//	path=path+"&pageReadOnly=1";
		//}
		path=path+"&pageReadOnly=1";
	    ajMonitorReportWin=openSubWin("ajMonitorReportWixn",title,path,"1000","700");
	}
	</script>
</@CommonQueryMacro.page>