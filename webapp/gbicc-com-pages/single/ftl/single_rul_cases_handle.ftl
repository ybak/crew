<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign businessId=RequestParameters["businessId"]?default("")>

<@CommonQueryMacro.page title="������Ԥ������-���������б�">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="SingleRulCases" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="SingleRulCasesGroup" label="" colNm=4 labelwidth="150"
				fieldStr="casesCode,casesName,casesNature,followupFlag,createDt,createOrg,casesDesc,casesConclusion,opinion"/>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulWarningSelectBox" label="����Ԥ���ź��б�" expand="true">
				<@CommonQueryMacro.CommonQuery id="SingleRulWarningSelect" init="false" submitMode="selected">
					<@CommonQueryMacro.DataTable id="SingleRulWarningSelectTable"  readonly="false" paginationbar="btRemove,btLaunchInve,btnShow" 
					fieldStr="select,rulCode,taskCode,rulName,fcettypecode[120],fcetname[150],warnStatus,warnDt,mainOrg,warningRelieve" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox" label="Э�������б�" expand="true">
				<@CommonQueryMacro.CommonQuery id="SingleRulInvestigation" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="SingleRulInvestigationTable"  readonly="true" paginationbar="btnAgainInve,btnRead" 
					fieldStr="inveCode[120],inveName[150],inveOrgName[150],inveUser[150],inveCont[150],createDt[100],status[100],matureDt[100],inveNumb[70],inveFeedDt[100],opr[100]" width="100%" hasFrame="true"/>
					<@CommonQueryMacro.Button id="btnDel" />
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="true" submitMode="all">
				<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ">
					<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable"  paginationbar="btnOpinion"
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
			<@CommonQueryMacro.CommonQuery id="SingleRulCases" mode="1" init="true" submitMode="current">
				<br/><center>
					<@CommonQueryMacro.Button id="btSave" />
					<@CommonQueryMacro.Button id="btFiling" />
					<@CommonQueryMacro.Button id="btFilingChecker" />
					<@CommonQueryMacro.Button id="btAgree" />
					<@CommonQueryMacro.Button id="btBack" />
					<@CommonQueryMacro.Button id="btClose" />
				</center>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
</table>
<script>
	var invetask_wait_submit_status="1";//Э��������ύ״̬
	var invetask_already_complete="3";//Э��������Э��״̬
	var submitWindow=null;
	//ҳ���ʼ��
	function initCallGetter_post(){
		var casesId='${businessId}';
		$("a[id=btFilingChecker]").hide();
		SingleRulCases_dataset.setParameter("id",casesId);
		SingleRulCases_dataset.flushData(SingleRulCases_dataset.pageIndex);
		
		TaskApprovalHistory_dataset.setParameter("businessId",casesId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
		$("a[id=btnDel]").hide();
		
		SingleRulWarningSelect_dataset.setParameter("casesId",casesId);
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
		
		var followupFlag=SingleRulCases_dataset.getValue("followupFlag");
		if(!followupFlag){
			SingleRulCases_dataset.setValue("followupFlag","N")
		}
		
		//��������ͼÿһ�ڵ��������ʼ��ҳ��
		var fields=["casesNature","casesConclusion"];
		TaskVariable.findTaskVariable(casesId,function(y){
			if(y.pageReadOnly!=null && y.pageReadOnly=="true"){
				setPageReadOnlyFieldsFun(fields,true);
				$("a[id=btAgree]").show();
				$("a[id=btBack]").show();
				$("a[id=btFiling]").hide();
				$("a[id=btSave]").hide();
				SingleRulCases_dataset.setFieldHidden("opinion",false);
				SingleRulCases_dataset.setFieldHidden("followupFlag",false);
				SingleRulCases_dataset.setFieldRequired("followupFlag",true);
				$("a[id=btRemove]").hide();
				$("a[id=btLaunchInve]").hide();
				$("a[id=btnAgainInve]").hide();
				SingleRulWarningSelect_dataset.setFieldReadOnly("warningRelieve",true);
			}else{
				setPageReadOnlyFieldsFun(fields,false);
				$("a[id=btAgree]").hide();
				$("a[id=btBack]").hide();
				$("a[id=btFiling]").show();
				$("a[id=btSave]").show();
				SingleRulCases_dataset.setFieldHidden("opinion",true);
				SingleRulCases_dataset.setFieldHidden("followupFlag",true);
				SingleRulCases_dataset.setFieldRequired("followupFlag",false);
				$("a[id=btRemove]").show();
				$("a[id=btLaunchInve]").show();
				$("a[id=btnAgainInve]").show();
				SingleRulWarningSelect_dataset.setFieldReadOnly("warningRelieve",false);
			}
		});
		setPageRequiredFieldsFun(fields,true);
	}
	//ɾ��
	function btnCasesDel_onClickCheck(){
		var casesStatus=SingleRulCases_dataset.getValue("casesStatus");
		var casesId=SingleRulCases_dataset.getValue("id");
		if(casesId==null || casesId==""){
			top.easyMsg.info("��ѡ��Ҫɾ���İ�����");
			return false;
		}
		if(casesStatus!="1"){
			top.easyMsg.info("ֻ��ɾ���ݸ�״̬�İ�����");
			return false;
		}
		SingleRulWarningSelect_dataset.setParameter("casesId",casesId);
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		if(SingleRulWarningSelect_dataset.length>0){
			top.easyMsg.info("�ð����д���Ԥ���źţ��޷�ɾ����");
			return false;
		}
		SingleRulCases_dataset.setFieldRequired("casesNature",false);
		return confirm("ȷ��ɾ���ð�����");
	}
	function btnCasesDel_postSubmit(){
		top.easyMsg.info("�����ɹ���");
		SingleRulCases_dataset.flushData(SingleRulCases_dataset.pageIndex);
	}
	var investigationWin=null;
	function investigationWin_close(){
		investigationWin.close();
	}
	function singleRulInvestigation_flush_data(){
		SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
	}
	function investigationWin_and_parWin_close(){
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
	//�Ƴ�
	function btRemove_onClickCheck(){
		var fields=["casesNature"];
		var fields2=["checkEmph","inveWay","inveConc","partUser"];
		setPageReadOnlyFieldsFun(fields,true);
		setPageReadOnlyFieldsFun2(fields2,true);
		
		var record=SingleRulWarningSelect_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
			}
			record=record.getNextRecord();
		}
		if(!(records.length>0)){
			top.easyMsg.info("��ѡ��Ҫ�Ƴ���Ԥ���źţ�");
			return false;
		}
		
		var fields=["casesNature","casesConclusion"];
		setPageRequiredFieldsFun(fields,false);
		SingleRulWarningSelect_dataset.setFieldRequired("warningRelieve",false);
		
		var warningIds="";
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		DWREngine.setAsync(false);
		var bool=true;
		warningIds=warningIds.substring(0,warningIds.length-1);
		InveRelWarning.dwrFindWarningCount(warningIds,function(y){
			if(y>0){
				bool=false;
			}
		});
		DWREngine.setAsync(true);
		if(!bool){
			top.easyMsg.info("��ѡ���Ԥ���ź��ѷ���Э�������޷��Ƴ���");
			return false;
		}else{
			return confirm("ȷ���Ƴ����źţ�");
		}
	}
	function btRemove_postSubmit(button){
		top.easyMsg.info("�����ɹ���");
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		
		var fields=["casesNature"];
		var fields2=["checkEmph","inveWay","inveConc","partUser"];
		setPageReadOnlyFieldsFun(fields,false);
		setPageReadOnlyFieldsFun2(fields2,false);
	}
	//����Э��
	function btLaunchInve_onClick(button){
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
		}else{
			if(window.confirm("û��ѡ��Ԥ���źţ��Ƿ������")==false){
				return false;
			}
			warningIds="0";
		}
		var casesId=SingleRulCases_dataset.getValue("id");
		openInvestigationWin(casesId,warningIds,"");
	}
	//�鿴 ������ ��ϸ ��Ϣ 
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
	
	
	//�򿪷���Э�鴰��
	function openInvestigationWin(casesId,warningIds,inveId){
		investigationWin=openSubWin("investigationWin","����Э��","/gbicc-com-pages/single/ftl/single_rul_investigation_add.ftl?casesId="+casesId+"&warningIds="+warningIds+"&inveId="+inveId,"1200","690");
	}
	//Э�������б�ˢ�´���
	function SingleRulInvestigationTable_opr_onRefresh(cell,value,record) {
		if (record) {//�����ڼ�¼ʱ
			if(record.getValue("status")=="1"){
				cell.innerHTML="<a href='JavaScript:inveUpdate(\""+value+"\")'>�޸�</a>&nbsp;<a href='JavaScript:inveDel(\""+value+"\")'>ɾ��</a>";
			}else{
				cell.innerHTML="";
			}
		} 
	}
	//Э�������б�-�޸��¼�
	function inveUpdate(inveId){
		var casesId=SingleRulCases_dataset.getValue("id");
		var warningIds="";
		InveRelWarning.dwrFindWarningIds(inveId,function(y){
			if(y.length>0){
				for(var i=0;i<y.length;i++){
					warningIds=warningIds+y[i]+",";
				}
			}else{
				warningIds="0";
			}
			openInvestigationWin(casesId,warningIds,inveId);
		});
	}
	//Э�������б�-ɾ���¼�
	function inveDel(inveId){
		SingleRulInvestigation_dataset.setParameter("op","deleteInve");
		SingleRulInvestigation_dataset.setParameter("inveId",inveId);
		
		var fields=["casesNature"];
		var fields2=["checkEmph","inveWay","inveConc","partUser"];
		setPageReadOnlyFieldsFun(fields,true);
		setPageReadOnlyFieldsFun2(fields2,true);
		$("a[id=btnDel]").click();
	}
	function btnDel_postSubmit(){
		SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
		var fields=["casesNature"];
		var fields2=["checkEmph","inveWay","inveConc","partUser"];
		setPageReadOnlyFieldsFun(fields,false);
		setPageReadOnlyFieldsFun2(fields2,false);
	}
	//�鿴Э������
	function btnRead_onClick(){
		var id = SingleRulInvestigation_dataset.getValue("id");
		if (id.length > 0)
			openInvestigationWinAllFun("read");
		else
			top.easyMsg.info("δѡ��Э������");
	}
	//�ص���
	function btnAgainInve_onClick(){
		var status=SingleRulInvestigation_dataset.getValue("status");
		if(status!=invetask_already_complete){
			top.easyMsg.info("ֻ�С���Э�顿״̬��������ִ���ص��������");
			return;
		}
		openInvestigationWinAllFun("againInve");
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
	//ͬ��
	function btAgree_onClickCheck(button){
		SingleRulCases_dataset.setParameter("op","agree");
		var record=SingleRulWarningSelect_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("warningRelieve")==null || record.getValue("warningRelieve")==""){
				/* top.easyMsg.info("Ԥ��������ȫ��¼���ſ�����鵵����˫��������Ԥ���ź��б������¼�룡");
				return false; */
				record.setValue("warningRelieve","Y");
			}
			var temp="{'warnId':'"+record.getValue("id")+"','warningRelieve':'"+record.getValue("warningRelieve")+"'}";
			records.push(temp);
			record=record.getNextRecord();
		}
		SingleRulCases_dataset.setParameter("warnRecords","["+records+"]");
	}
	function btAgree_postSubmit(button){
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
	//����ҳ���ֶα���
	function setPageRequiredFieldsFun(fields,bool){
		for(var i=0;i<fields.length;i++){
			SingleRulCases_dataset.setFieldRequired(fields[i],bool);
		}
	}
	//����ҳ���ֶ�ֻ��
	function setPageReadOnlyFieldsFun(fields,bool){
		for(var i=0;i<fields.length;i++){
			SingleRulCases_dataset.setFieldReadOnly(fields[i],bool);
		}
	}
	//����ҳ���ֶ�ֻ��2
	function setPageReadOnlyFieldsFun2(fields,bool){
		for(var i=0;i<fields.length;i++){
			SingleRulInvestigation_dataset.setFieldReadOnly(fields[i],bool);
		}
	}
	//����
	function btSave_onClickCheck(button){
		var casesNature=SingleRulCases_dataset.getValue("casesNature");
		var casesConclusion=SingleRulCases_dataset.getValue("casesConclusion");
		if(casesNature==null || casesNature=="" || casesConclusion==null || casesConclusion==""){
			top.easyMsg.info("��д���������ʡ��롾�������ý��ۡ���ſɱ��棡");
			return false;
		}
		SingleRulWarningSelect_dataset.setFieldRequired("warningRelieve",true);
		var record=SingleRulWarningSelect_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("warningRelieve")==null || record.getValue("warningRelieve")==""){
				record.setValue("warningRelieve","Y");
			}
			var temp="{'warnId':'"+record.getValue("id")+"','warningRelieve':'"+record.getValue("warningRelieve")+"'}";
			records.push(temp);
			record=record.getNextRecord();
		}
		SingleRulCases_dataset.setParameter("op","save");
		SingleRulCases_dataset.setParameter("warnRecords","["+records+"]");
	}
	//����鵵
	function btFiling_onClickCheck(button){
		//����Ƿ��ܹ鵵
		var record=SingleRulInvestigation_dataset.getFirstRecord();
		var bool=true;
		while(record){
			if(record.getValue("status")!=invetask_already_complete){
				bool=false;
			}
			record=record.getNextRecord();
		}
		if(!bool){
			top.easyMsg.info("�����Э������״̬����ȫ��Ϊ����Э�顿�ſ�����鵵��");
			return false;
		}
		
		var casesNature=SingleRulCases_dataset.getValue("casesNature");
		var casesConclusion=SingleRulCases_dataset.getValue("casesConclusion");
		if(casesNature==null || casesNature=="" || casesConclusion==null || casesConclusion==""){
			top.easyMsg.info("��д���������ʡ��롾�������ý��ۡ���ſ�����鵵��");
			return false;
		}
		
		SingleRulWarningSelect_dataset.setFieldRequired("warningRelieve",true);
		
		var record=SingleRulWarningSelect_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("warningRelieve")==null || record.getValue("warningRelieve")==""){
				/* top.easyMsg.info("Ԥ��������ȫ��¼���ſ�����鵵����˫��������Ԥ���ź��б������¼�룡");
				return false; */
				record.setValue("warningRelieve","Y");
			}
			var temp="{'warnId':'"+record.getValue("id")+"','warningRelieve':'"+record.getValue("warningRelieve")+"'}";
			records.push(temp);
			record=record.getNextRecord();
		}
		SingleRulCases_dataset.setParameter("op","filing");
		SingleRulCases_dataset.setParameter("warnRecords","["+records+"]");
		SingleRulCases_dataset.setValue("opinion",SingleRulCases_dataset.getValue("casesConclusion"));
		
		var orgId=user_info.orgId;
		var roleId="";
		if("00001"==orgId){
			roleId="559";
		}else{
			roleId="561";
		}
		submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	//����鵵�ύ��ˢ��ҳ��
	function btFiling_postSubmit(button){
		button.url="#";
		top.easyMsg.info("����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
	//�˻ؼ���¼�
	function btBack_onClickCheck(button){
		SingleRulCases_dataset.setFieldRequired("followupFlag",false);
		var opinion=SingleRulCases_dataset.getValue("opinion");
		if(opinion==null || opinion==""){
			top.easyMsg.info("�˻�����д��������");
			return false;
		}
		SingleRulCases_dataset.setParameter("op","back");
	}
	//�˻غ�ˢ��ҳ��
	function btBack_postSubmit(button){
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
	//�ر�
	function btClose_onClick(button){
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
	//ˢ�µ�ǰҳ
	function flushCurrentPage(){
		SingleRulCases_dataset.flushData(SingleRulCases_dataset.pageIndex);
	}
	function taskApprovalHistoryTable_onDbClick(){
		btnOpinion_onClick();
	}
	//�鿴���
	function btnOpinion_onClick(button){
		var id = TaskApprovalHistory_dataset.getValue("taskName");
		if (id.length > 0)
			subwindow_taskApprovalHistoryFW.show();
		else
			top.easyMsg.info("δѡ����ʷ���");
	}
	function cancelFun(){
		submitWindow.close();
	}
	function submitFun(userId){
		SingleRulCases_dataset.setParameter("userId",userId);
		btFilingChecker.click();
	}
	function btFilingChecker_postSubmit(){
		submitWindow.close();
		top.easyMsg.info("�����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/InveRelWarning.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>