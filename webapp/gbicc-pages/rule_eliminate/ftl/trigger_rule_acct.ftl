<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="���������˻�">
<table align="left" width="100%">
    <tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="TriggerRuleAcct" init="true" submitMode="current" navigate="false">
				<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" colNm=4/>
				<@CommonQueryMacro.DataTable id ="triggerRuleAcctTable" paginationbar="btnAdd,btnRead"
				fieldStr="loanacno[150],custname[150],prodid[100],prodname[150],acflag[80],acflag2[100],riskflag[80],overbal[100],operidName[100],bankidName[100]" readonly="true" width="100%"/></br>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.FloatWindow id="triggerRuleAcctFW" modal="true" label="�����ų�/�ָ�" position="top" 
			resize="true" minimize="false" width="800" maximize="true" closure="true" show="false" defaultZoom="normal">
				<@CommonQueryMacro.CommonQuery id="TriggerRuleAcct" init="true" submitMode="current" navigate="false">
					<@CommonQueryMacro.Group id="triggerRuleAcctGroup" label="" colNm=4
					fieldStr="loanacno,custname,prodid,prodname,riskflag,bankidName"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="TriggerWarningRule" init="false" submitMode="selected" navigate="false">
					<@CommonQueryMacro.DataTable height="300" id ="triggerWarningRuleTable" paginationbar="" pagination="false"
					fieldStr="select,ruleCode,ruleName" readonly="true" width="100%"/>
					<span><font color="red">&nbsp;PS:��ѡ�ļ�¼Ϊ�ų��ļ�¼</font></span>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="RuleEliminate" init="true" submitMode="current" navigate="false">
					<@CommonQueryMacro.Group id="ruleEliminateGroup" label="" colNm=4 labelwidth="250"
					fieldStr="eliminateRuleDesc"/>
					<center>
					<@CommonQueryMacro.Button id= "btn_save"/>
					<@CommonQueryMacro.Button id= "btn_submit"/>
					<@CommonQueryMacro.Button id= "btn_submit_true"/>
					<span id="msgLabel">�ô����˺��ѱ�������ų���ָ���δ�ύ�����Ѿ�����������������������ʱ�޷��������ȴ���˽�����</span>
					</center>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.FloatWindow>
		</td>
	</tr>
</table>
<script language="JavaScript">
	var submitWindow=null;
	function initCallGetter_post(){
		$("a[id=btn_submit_true]").hide();
	}
	function btn_save_onClickCheck(button){
		if(TriggerWarningRule_dataset.length==0){
			top.easyMsg.info("�ʻ�δ�����κι���,�޷�ִ�иò�����");
			return false;
		}
		var vd=RuleEliminate_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var eliminateRuleDesc=RuleEliminate_dataset.getValue("eliminateRuleDesc");
		if(eliminateRuleDesc==null || eliminateRuleDesc==""){
			top.easyMsg.info("�ų�/�ָ�����˵������Ϊ�գ�");
			return false;
		}
		var op="one_save";
		RuleEliminate_dataset.setParameter("flag","add");
		TriggerRuleAcct_dataset.setParameter("op",op);
	}
	function btn_submit_onClick(button){
		if(TriggerWarningRule_dataset.length==0){
			top.easyMsg.info("�ʻ�δ�����κι���,�޷�ִ�иò�����");
			return false;
		}
		var vd=RuleEliminate_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var eliminateRuleDesc=RuleEliminate_dataset.getValue("eliminateRuleDesc");
		if(eliminateRuleDesc==null || eliminateRuleDesc==""){
			top.easyMsg.info("�ų�/�ָ�����˵������Ϊ�գ�");
			return false;
		}
		var orgId=user_info.orgId;
		var roleId="557";
		submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	//ȡ��
	function cancelFun(){
		TriggerRuleAcct_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		TriggerRuleAcct_dataset.setParameter("taskAssignee",taskAssignee);
		btn_submit_true.click();
	}
	function btn_submit_true_onClickCheck(){
		var op="one_submit";
		RuleEliminate_dataset.setParameter("flag","add");
		TriggerRuleAcct_dataset.setParameter("op",op);
	}
	function btnAdd_onClick(button){
		var triggerRuleAcctId=TriggerRuleAcct_dataset.getValue("loanacno");
		TriggerWarningRule_dataset.setParameter("accId",triggerRuleAcctId);
		TriggerWarningRule_dataset.flushData(TriggerWarningRule_dataset.pageIndex);
		
		subwindow_triggerRuleAcctFW.show();
		TriggerWarningRule_dataset.setFieldReadOnly("select",false);
		$("div[name=ruleEliminateGroup]").show();
		RuleEliminate_dataset.setParameter("triggerRuleAcctId",triggerRuleAcctId);
		RuleEliminate_dataset.flushData(RuleEliminate_dataset.pageIndex);
		var ruleEliminateId=RuleEliminate_dataset.getValue("id");
		if(ruleEliminateId!=null){
			TaskVariable.findRuningTaskByBusinessKey(ruleEliminateId,function(y){
				if(null!=y && y=="true"){
					$("a[id=btn_save]").hide();
					$("a[id=btn_submit]").hide();
					$("span[id=msgLabel]").show();
					RuleEliminate_dataset.setFieldReadOnly("eliminateRuleDesc",true);
					TriggerWarningRule_dataset.setFieldReadOnly("select",true);
					var flag="2";
					selectGridFun(triggerRuleAcctId,flag);
				}else{
					$("a[id=btn_save]").show();
					$("a[id=btn_submit]").show();
					$("span[id=msgLabel]").hide();
					RuleEliminate_dataset.setFieldReadOnly("eliminateRuleDesc",false);
					TriggerWarningRule_dataset.setFieldReadOnly("select",false);
					var flag="1";
					selectGridFun(triggerRuleAcctId,flag);
				}
			});
		}else{
			$("a[id=btn_save]").show();
			$("a[id=btn_submit]").show();
			$("span[id=msgLabel]").hide();
			RuleEliminate_dataset.setFieldReadOnly("eliminateRuleDesc",false);
			TriggerWarningRule_dataset.setFieldReadOnly("select",false);
			var flag="1";
			selectGridFun(triggerRuleAcctId,flag);
		}
		
		$("#fldlabel_eliminateRuleDesc").html($("#fldlabel_eliminateRuleDesc").text()+"<span style='color:red;'>*</span>");
	}
	function btnRead_onClick(button){
		subwindow_triggerRuleAcctFW.show();
		var triggerRuleAcctId=TriggerRuleAcct_dataset.getValue("loanacno");
		$("div[name=ruleEliminateGroup]").hide();
		$("span[id=msgLabel]").hide();
		var flag="1";
		selectGridFun(triggerRuleAcctId,flag);
		$("a[id=btn_save]").hide();
		$("a[id=btn_submit]").hide();
		TriggerWarningRule_dataset.setFieldReadOnly("select",true);
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
	//�����ر�ҳ�棬ˢ�±���
	function btn_save_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("����ɹ���");
		subwindow_triggerRuleAcctFW.close();
		TriggerRuleAcct_dataset.flushData(TriggerRuleAcct_dataset.pageIndex);
	}
	//�ύ��ر�ҳ�棬ˢ�±���
	function btn_submit_true_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		button.url="#";
		top.easyMsg.info("�ύ�ɹ���");
		subwindow_triggerRuleAcctFW.close();
		TriggerRuleAcct_dataset.flushData(TriggerRuleAcct_dataset.pageIndex);
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/RuleEliminate.js'> </script>
</@CommonQueryMacro.page>