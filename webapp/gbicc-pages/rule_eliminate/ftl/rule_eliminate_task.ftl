<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="�����ų�/�ָ�����">
<table align="left" width="100%">
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="RuleEliminateTask" init="true" submitMode="current" navigate="false">
				<@CommonQueryMacro.DataTable id ="ruleEliminateTaskTable" paginationbar="btHandle"
				fieldStr="loanacno[150],custname[150],custname[150],prodname[150],acflag[150],riskflag[150],handler[200],handleOrg[200],status[100],eliminateRuleDesc[200],openAcctDate[100],matureDate[100]" readonly="true" width="100%"/></br>
			</@CommonQueryMacro.CommonQuery>
			<@CommonQueryMacro.FloatWindow id="ruleEliminateTaskFW" modal="true" label="���������ų�/�ָ�" position="top" 
				resize="true" minimize="false" width="800" maximize="true" closure="true" show="false" defaultZoom="normal">
				<@CommonQueryMacro.CommonQuery id="RuleEliminateTask" submitMode="current" navigate="false">
					<@CommonQueryMacro.Group id="ruleEliminateTaskGroup" label="" colNm=4
					fieldStr="loanacno,custname,prodid,prodname,riskflag,handleOrg"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="TriggerWarningRule" init="false" submitMode="selected" navigate="false">
					<@CommonQueryMacro.DataTable height="250" id ="task_triggerWarningRuleTable" paginationbar="" pagination="false"
					fieldStr="select,ruleCode,ruleName" readonly="true" width="100%"/>
					<span><font color="red">&nbsp;PS:��ѡ�ļ�¼Ϊ�ų��ļ�¼</font></span>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="RuleEliminateTask" submitMode="current" navigate="false">
					<@CommonQueryMacro.Group id="task_ruleEliminateGroup" label="" colNm=4
					fieldStr="eliminateRuleDesc,opinion"/>
					<center>
					<@CommonQueryMacro.Button id= "btnSubmit"/>
					<@CommonQueryMacro.Button id= "btnSubmitTrue"/>
					<@CommonQueryMacro.Button id= "btnBack"/>
					</center>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="false" submitMode="all">
					<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ">
						<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable" paginationbar="btnOpinion" nowrap="false"
						fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
						<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="�鿴���" position="center" 
							closure="true" show="false" defaultZoom="normal">
							<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
						</@CommonQueryMacro.FloatWindow>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.FloatWindow>
		</td>
	</tr>
</table>
<script language="JavaScript">
	var submitWindow=null;
	function initCallGetter_post(){
		$("a[id=btnSubmitTrue]").hide();
	}
	var opinionHide=false;
	//����
	function btHandle_onClick(button){
		subwindow_ruleEliminateTaskFW.show();
		var triggerRuleAcctId=RuleEliminateTask_dataset.getValue("loanacno");
		
		TriggerWarningRule_dataset.setParameter("accId",triggerRuleAcctId);
		TriggerWarningRule_dataset.flushData(TriggerWarningRule_dataset.pageIndex);
		
		var businessId=RuleEliminateTask_dataset.getValue("id");
		var flag="2";
		selectGridFun(triggerRuleAcctId,flag);
		TaskVariable.findTaskVariable(businessId,function(y){
			if(y.backBtn!=null && y.backBtn=="hide"){
				$("a[id=btnBack]").hide();
				TriggerWarningRule_dataset.setFieldReadOnly("select",false);
				RuleEliminateTask_dataset.setFieldReadOnly("eliminateRuleDesc",false);
				RuleEliminateTask_dataset.setFieldHidden("opinion",true);
				opinionHide=true;
			}else{
				//$("a[id=btnSave]").hide();
				TriggerWarningRule_dataset.setFieldReadOnly("select",true);
				RuleEliminateTask_dataset.setFieldReadOnly("eliminateRuleDesc",true);
				RuleEliminateTask_dataset.setFieldHidden("opinion",false);
				opinionHide=false;
			}
		});
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
		
		$("#fldlabel_eliminateRuleDesc").html($("#fldlabel_eliminateRuleDesc").text()+"<span style='color:red;'>*</span>");
		$("#fldlabel_opinion").html($("#fldlabel_opinion").text()+"<span style='color:red;'>*</span>");
	}
	//�˻�
	function btnBack_onClickCheck(button){
		var op="back";
		RuleEliminateTask_dataset.setParameter("op",op);
		var eliminateRuleDesc=RuleEliminateTask_dataset.getValue("eliminateRuleDesc");
		var opinion=RuleEliminateTask_dataset.getValue("opinion");
		if(eliminateRuleDesc==null || eliminateRuleDesc==""){
			top.easyMsg.info("�ų�/�ָ�����˵������Ϊ�գ�");
			return false;
		}
		if(opinionHide==false && (opinion==null || opinion=="")){
			top.easyMsg.info("����������Ϊ�գ�");
			return false;
		}
	}
	//�ύ
	function btnSubmit_onClick(button){
		var eliminateRuleDesc=RuleEliminateTask_dataset.getValue("eliminateRuleDesc");
		var opinion=RuleEliminateTask_dataset.getValue("opinion");
		if(eliminateRuleDesc==null || eliminateRuleDesc==""){
			top.easyMsg.info("�ų�/�ָ�����˵������Ϊ�գ�");
			return false;
		}
		if(opinionHide==false && (opinion==null || opinion=="")){
			top.easyMsg.info("����������Ϊ�գ�");
			return false;
		}
		var orgId=user_info.orgId;
		var businessId=RuleEliminateTask_dataset.getValue("id");
		TaskVariable.findTaskVariable(businessId,function(y){
			if(y && y.nextRole){//��ȡ����ɫID�򿪴��ڡ�
				submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+y.nextRole,"600","400");
			}else{//��ȡ������ֱ���ύ
				btnSubmitTrue.click();
			}
		});
	}
	function btnSubmitTrue_onClickCheck(button){
		var op="submit";
		RuleEliminateTask_dataset.setParameter("op",op);
	}
	//ȡ��
	function cancelFun(){
		RuleEliminateTask_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		RuleEliminateTask_dataset.setParameter("taskAssignee",taskAssignee);
		btnSubmitTrue.click();
	}
	//�鿴���
	function btnOpinion_onClick(button){
		subwindow_taskApprovalHistoryFW.show();
	}
	//�����ر�ҳ�棬ˢ�±���
	function btnSave_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_ruleEliminateTaskFW.close();
		RuleEliminateTask_dataset.flushData(RuleEliminateTask_dataset.pageIndex);
	}
	//�ύ��ر�ҳ�棬ˢ�±���
	function btnSubmitTrue_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_ruleEliminateTaskFW.close();
		RuleEliminateTask_dataset.flushData(RuleEliminateTask_dataset.pageIndex);
	}
	//�˻غ�ر�ҳ�棬ˢ�±���
	function btnBack_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_ruleEliminateTaskFW.close();
		RuleEliminateTask_dataset.flushData(RuleEliminateTask_dataset.pageIndex);
	}
	//����ҳ�湴ѡ����
	function selectGridFun(triggerRuleAcctId,flag){
		TriggerWarningRule_dataset.flushData(TriggerWarningRule_dataset.pageIndex);
		RuleEliminate.dwrFindEliminateList(triggerRuleAcctId,flag,function(y){
			var record=TriggerWarningRule_dataset.getFirstRecord();
			if(null!=y && y.length>0){
				while(record){
					for(var i=0;i<y.length;i++){
						if(y[i]==record.getValue("ruleCode")){
							record.setValue("select",true);
						}
					}
					record=record.getNextRecord();
				}
			}else{
				while(record){
					record.setValue("select",false);
					record=record.getNextRecord();
				}
			}
		});
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/RuleEliminate.js'> </script>
</@CommonQueryMacro.page>