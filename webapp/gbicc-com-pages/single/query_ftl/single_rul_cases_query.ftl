<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="������ѯ�б�">
<@CommonQueryMacro.CommonQuery id="SingleRulCasesQuery" init="true" submitMode="current">
	<table>
		<tr>
			<td>
				<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" showButton="false" labelwidth="100" colNm=8/>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center" style="margin-bottom:10px">
					<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
					<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.DataTable id="SingleRulCasesQueryTable" readonly="false" paginationbar="btn_Read,btnReplenish" remoteSort="true" sortable="true"
				fieldStr="casesCode[100],casesName[150],casesStatus[80],casesNature[55],createUserId[100],createUser[150],createDt[100],warnCount[100],inveCount[150],alreInveCount[100]" width="100%" hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<@CommonQueryMacro.FloatWindow id="SingleRulCasesQueryFW" modal="true" label="�鿴����" 
resize="true" minimize="false" width="1200" height="650" maximize="true" closure="true" show="false" defaultZoom="normal">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="SingleRulCasesQuery" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="SingleRulCasesQueryGroup" label="" colNm=4 labelwidth="150"
				fieldStr="casesCode,casesName,casesNature,followupFlag,createDt,createOrg,casesDesc,casesConclusion"/>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulWarningSelectBox" label="����Ԥ���ź��б�" expand="true">
				<@CommonQueryMacro.CommonQuery id="SingleRulWarningSelect" init="false" submitMode="selected">
					<@CommonQueryMacro.DataTable id="SingleRulWarningSelectTable" nowrap="true" fitColumns="false" readonly="true" paginationbar="btnShow" 
					fieldStr="select,rulCode[70],taskCode[110],rulType[120],rulName[150],fcettypecode[100],fcetname[150],warnStatus[100],warnDt[80],mainOrg[120],warningRelieve" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox" label="Э�������б�" expand="true">
				<@CommonQueryMacro.CommonQuery id="SingleRulInvestigation" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable nowrap="true" id="SingleRulInvestigationTable" readonly="true" paginationbar="btnRead" 
					fieldStr="inveCode[120],inveName[150],inveOrgName[120],inveUser[150],inveCont[150],createDt[100],status[100],matureDt[100],inveNumb[80],inveFeedDt[100]" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="false" submitMode="all">
				<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ">
					<@CommonQueryMacro.DataTable nowrap="true" id="taskApprovalHistoryTable" paginationbar="btnOpinion"
					fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
					<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="�鿴���" position="center" 
						closure="true" show="false" defaultZoom="normal">
						<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
					</@CommonQueryMacro.FloatWindow>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="SingleRulCasesDutyinfo" init="false" submitMode="all">
				<@CommonQueryMacro.GroupBox id="SingleRulCasesDutyinfoBox" label="������Ϣ��¼">
					<@CommonQueryMacro.DataTable id="SingleRulCasesDutyinfoTable" readonly="false" paginationbar="btnAddDuty"
					fieldStr="duty[150],dutyOrg[150],desc[300]" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.GroupBox>
				<br/><center>
					<@CommonQueryMacro.Button id="btnSubmitDuty" />
					<@CommonQueryMacro.Button id="btnCancelDuty" />
				</center>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
</table>
</@CommonQueryMacro.FloatWindow>
<script>
	var invetask_wait_submit_status="1";//Э��������ύ״̬
	var invetask_already_complete="3";//Э��������Э��״̬
	//ҳ���ʼ��
	function initCallGetter_post(){
		
	}
	function btnAddDuty_onClick(){
		SingleRulCasesDutyinfo_dataset.insertRecord("end");
	}
	function btnReplenish_onClick(){
		var casesStatus=SingleRulCasesQuery_dataset.getValue("casesStatus");
		if(casesStatus!="4"){
			top.easyMsg.info("ֻ�С��ѹ鵵��״̬�����ݲ��ܽ��а�����Ϣ��¼��");
			return;
		}
		subwindow_SingleRulCasesQueryFW.show();
		
		var casesId=SingleRulCasesQuery_dataset.getValue("id");
		TaskApprovalHistory_dataset.setParameter("businessId",casesId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
		
		SingleRulWarningSelect_dataset.setParameter("casesId",casesId);
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
		
		SingleRulCasesDutyinfo_dataset.setParameter("casesId",casesId);
		SingleRulCasesDutyinfo_dataset.flushData(SingleRulCasesDutyinfo_dataset.pageIndex);
		
		SingleRulCasesDutyinfo_dataset.setValue("dutyName",SingleRulCasesDutyinfo_dataset.getValue("tempDutyName"));
		SingleRulCasesDutyinfo_dataset.setValue("dutyOrgName",SingleRulCasesDutyinfo_dataset.getValue("tempDutyOrgName"));
		
		$("a[id=btnSubmitDuty]").show();
		$("a[id=btnCancelDuty]").show();
		$("a[id=btnAddDuty]").show();
	}
	function SingleRulCasesQueryTable_onDbClick(){
		btn_Read_onClick();
	}
	//�鿴 ������ ��ϸ 
	function btnShow_onClick(){
		var record=SingleRulWarningSelect_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
			}
			record=record.getNextRecord();
		}
		var warningIds="";
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		if(warningIds.length>0){
			warningIds=warningIds.substring(0,warningIds.length-1);
			openSubWin("singleRuleWin","������Ԥ���ź���ϸ��Ϣ","/gbicc-com-pages/single/query_ftl/single_rul_warning_read_win.ftl?businessId="+warningIds,"1200","700");
		}else{
			warningIds="0";
			top.easyMsg.info("δѡ��Ԥ���ź�");
		}
		
	} 
	
	function btn_Read_onClick(){
		subwindow_SingleRulCasesQueryFW.show();
		
		var followupFlag=SingleRulCasesQuery_dataset.getValue("followupFlag");
		if(!followupFlag){
			SingleRulCasesQuery_dataset.setValue("followupFlag","N")
		}
		var casesId=SingleRulCasesQuery_dataset.getValue("id");
		TaskApprovalHistory_dataset.setParameter("businessId",casesId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
		
		SingleRulWarningSelect_dataset.setParameter("casesId",casesId);
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
		
		SingleRulCasesDutyinfo_dataset.setParameter("casesId",casesId);
		SingleRulCasesDutyinfo_dataset.flushData(SingleRulCasesDutyinfo_dataset.pageIndex);
		
		SingleRulCasesDutyinfo_dataset.setValue("dutyName",SingleRulCasesDutyinfo_dataset.getValue("tempDutyName"));
		SingleRulCasesDutyinfo_dataset.setValue("dutyOrgName",SingleRulCasesDutyinfo_dataset.getValue("tempDutyOrgName"));
		
		$("a[id=btnSubmitDuty]").hide();
		$("a[id=btnCancelDuty]").hide();
		$("a[id=btnAddDuty]").hide();
	}
	//������Ϣ��¼�б�ˢ�´���
	function btnSubmitDuty_onClickCheck(){
		var casesId=SingleRulCasesQuery_dataset.getValue("id");
		SingleRulCasesDutyinfo_dataset.setParameter("casesId",casesId);
		var record=SingleRulCasesDutyinfo_dataset.getFirstRecord();
		var bool=true;
		while(record){
			if(record.getValue("duty")==null || record.getValue("duty")=="" || record.getValue("dutyOrg")==null || record.getValue("dutyOrg")=="" || record.getValue("desc")==null || record.getValue("desc")==""){
				bool=false;
				break;
			}
			record=record.getNextRecord();
		}
		if(!bool){
			top.easyMsg.info("�����ˣ����λ�������ϸ˵��������Ϊ�գ�");
			return false;
		}
	}
	function btnSubmitDuty_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_SingleRulCasesQueryFW.close();
		SingleRulCasesQuery_dataset.flushData(SingleRulCasesQuery_dataset.pageIndex);
	}
	function btnCancelDuty_onClick(){
		subwindow_SingleRulCasesQueryFW.close();
	}
	//������
	function duty_DropDown_beforeOpen(dropDown){
		subAutoUserAndOrg_DropDownDataset.setParameter("roleFlag","true");
		duty_DropDown.cached=false;//��qGroupId�����뻺��
	}
	//�����˰��������¼�
	function duty_DropDown_onKeyup(val){
		if(val.length>=0){
			return true;
		}
		return false;
	}
	function btnRead_onClick(){
		var id = SingleRulInvestigation_dataset.getValue("id");
		if (id.length > 0)
			openInvestigationWinAllFun("read");
		else
			top.easyMsg.info("δѡ��Э������");
	}
	function openInvestigationWinAllFun(oper){
		var casesId=SingleRulInvestigation_dataset.getValue("casesId");
		var inveId=SingleRulInvestigation_dataset.getValue("id");
		var warningIds="";
		InveRelWarning.dwrFindWarningIds(inveId,function(y){
			if(y.length>0){
				for(var i=0;i<y.length;i++){
					warningIds=warningIds+y[i]+",";
				}
			}else{
				warningIds="0";
			}
			openInvestigationWinAll(casesId,warningIds,inveId,oper);
		});
	}
	//������Э�鴰��
	function openInvestigationWinAll(casesId,warningIds,inveId,oper){
		investigationWin=openSubWin("investigationWin","Э������","/gbicc-com-pages/single/ftl/single_rul_investigation.ftl?casesId="+casesId+"&warningIds="+warningIds+"&inveId="+inveId+"&oper="+oper,"950","700");
	}
	function btnReset_onClick(){
		SingleRulCasesQuery_interface_dataset.clearData();
	}
	//�鿴���
	function btnOpinion_onClick(button){
		var id = TaskApprovalHistory_dataset.getValue("taskName");
		if (id.length > 0)
			subwindow_taskApprovalHistoryFW.show();
		else
			top.easyMsg.info("δѡ����ʷ���");
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/InveRelWarning.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>