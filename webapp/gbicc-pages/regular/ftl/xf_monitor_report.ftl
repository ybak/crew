<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign businessId=RequestParameters["businessId"]?default("")>
<#assign rptStatus=RequestParameters["rptStatus"]?default("")>
<#assign pageReadOnly=RequestParameters["pageReadOnly"]?default('0')>

<@CommonQueryMacro.page title="���������ඨ�ڼ�ر���">
<script type="text/javascript" src="${contextPath}/gbicc-pages/regular/comm/common.js"></script>
	<table>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="XFMonitorReportWin" init="true" submitMode="current">
					<@CommonQueryMacro.GroupBox id="box1" label="���������Ϣ">
						<@CommonQueryMacro.Group id="group1" label="" colNm=4 labelwidth="150" 
							fieldStr="loanVariety,custName,custCode,certType,certCode,coopObj,loanAmt,loanBalance,issueDate,completeDate,arrearAmt,arrearInte,lendCode,guarWay,gageCode,arrearAmt,riskStatus,mobilecall,contaddr,acctStatus,checkPerCode,checkWay,checkPlace,checkDate,checkType"/>
					</@CommonQueryMacro.GroupBox>
					<@CommonQueryMacro.GroupBox id="box2" label="��������">
						<@CommonQueryMacro.Group id="group2" label="" colNm=4 labelwidth="150" 
							fieldStr="healthCond,marriageCond,contactWay,contactWayUpd,profession,professionUpd"/>
						<@CommonQueryMacro.Group id="group3" label="��ͥ�ʲ��͸�ծ�仯����ѯ���ţ�" colNm=4 labelwidth="150" 
							fieldStr="property,income,liabilities,ifinflrepmt"/>
					</@CommonQueryMacro.GroupBox>
					<@CommonQueryMacro.GroupBox id="box3" label="���������������ʽΪ��Ѻ�ģ������Ѻ�������">
						<@CommonQueryMacro.Group id="group3" label="" colNm=4 labelwidth="150" 
							fieldStr="pledgeAddr,pledgeStatus,pledgeValueChange,pledgeValue,pledgeOwner,pledgeOwnerDesc,guarPerson,guarPerName,guarPerPhone,guarPerLia,guarPerLiaAmt,guarAbility"/>
					</@CommonQueryMacro.GroupBox>
					<@CommonQueryMacro.GroupBox id="box5" label="���տ��ƴ�ʩ">
							<@CommonQueryMacro.Group id="group5" label="" colNm=2
							fieldStr="lmtCtrl,riskCtrl,otherCtrlDesc,appendCtrl,frequency,applyOpin"/>
					</@CommonQueryMacro.GroupBox>
					<@CommonQueryMacro.GroupBox id="box6" label="���">
							<@CommonQueryMacro.Group id="group6" labelwidth="250" label="" colNm=2
							fieldStr="opinion"/>
					</@CommonQueryMacro.GroupBox>
					<@CommonQueryMacro.GroupBox id="box7" label="��ʩ���ʱ��">
							<@CommonQueryMacro.Group id="group7" label="" colNm=2
							fieldStr="measCompleteDate"/>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="true" submitMode="all">
					<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ">
						<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable" paginationbar="btnOpinion"
						fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
						<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="�鿴���" position="top" 
							closure="true" show="false" defaultZoom="normal">
							<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
						</@CommonQueryMacro.FloatWindow>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="XFMonitorReportWin" mode="1" init="true" submitMode="current">
					<center>
					<@CommonQueryMacro.Button id= "btnSave"/>
					<@CommonQueryMacro.Button id= "btnSubmit"/>
					<@CommonQueryMacro.Button id= "btnSubmitTrue"/>
					<@CommonQueryMacro.Button id= "btnBack"/>
					<@CommonQueryMacro.Button id= "btnPrint"/>
					</center>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
	</table>
<script>
	var submitWindow=null;
	var measCompleteDateHide=false;
	function btnPrint_onClick(){
		var reportId='${businessId}';
		window.open("${contextPath}/common/donloadWord?reportType=XF&reportId="+reportId+"&businessId="+reportId);
	}
	var fields_loanPer=[["contactWay","2","contactWayUpd"],["profession","2","professionUpd"]];
	//ҳ���ʼ��
	function initCallGetter_post(){
		$("a[id=btnSubmitTrue]").hide();
		var checkWay=XFMonitorReportWin_dataset.getValue("checkWay");
		checkway_selectedFun(checkWay);
		var riskCtrl=XFMonitorReportWin_dataset.getValue("riskCtrl");
		riskCtrl_selectedFun(riskCtrl);
		for(var i=0;i<fields_loanPer.length;i++){
			var value=XFMonitorReportWin_dataset.getValue(fields_loanPer[i][0]);
			_xfMonitorReport_selectedFun(value,fields_loanPer[i][1],fields_loanPer[i][2]);
		}
		
		var businessId='${businessId}';
		var rptStatus='${rptStatus}';
		XFMonitorReportWin_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		//��������ͼÿһ�ڵ��������ʼ��ҳ��
		TaskVariable.findTaskVariable(businessId,function(y){
			if(y.pageReadOnly!=null && y.pageReadOnly=="true"){
				//����ҳ��ֻ��
        		setPageReadOnlyFun();
			}
        	if(y.backBtn!=null && y.backBtn=="hide"){
        		//�����˻ذ�ť
        		$("a[id=btnBack]").hide();
        		//����������
        		//$("fieldset[name=box6]").hide();
        	}else{
        		//var editFields=["opinion"];
        		//setPageCanWriteFun(editFields);
        	}
        	if(y.ctrlMeas!=null && y.ctrlMeas=="hide"){
        		//���ؿ��ƴ�ʩ
        		$("fieldset[name=box5]").hide();
        	}
        	if(y.ctrlMeasReadOnly!=null && y.ctrlMeasReadOnly=="false"){
        		//�����ֶο�д
        		var editFields=["riskCtrl","otherCtrlDesc","appendCtrl","applyOpin","lmtCtrl","frequency"];
        		setPageCanWriteFun(editFields);
        	}
        	if(y.measDate==null || y.measDate=="hide"){
        		//��ʾ��ʩ���ʱ��
        		$("fieldset[name=box7]").hide();
        		measCompleteDateHide=true;
        	}else{
        		var editFields=["measCompleteDate"];
        		setPageCanWriteFun(editFields);
        		measCompleteDateHide=false;
        	}
        	var editFields=["opinion"];
    		setPageCanWriteFun(editFields);
       	});
		MonitorReportCtrl.dwrFindCtrl(businessId,function(y){
			if(y && y.length>0){
				var apdCtrl="";
				var lmtCtrl="";
				var othCtrl="";
				for(var i=0;i<y.length;i++){
					var obj=eval("("+y[i]+")");
					if(obj.ctrlType=="1"){
						lmtCtrl=lmtCtrl+obj.conmeasCode+",";
					}else if(obj.ctrlType=="2"){
						othCtrl=othCtrl+obj.conmeasCode+",";
						XFMonitorReportWin_dataset.setValue("otherCtrlDesc",obj.otherCtrlDesc);
					}else if(obj.ctrlType=="3"){
						apdCtrl=apdCtrl+obj.conmeasCode+",";
					}
				}
				if(apdCtrl!=""){
					apdCtrl=apdCtrl.substring(0,apdCtrl.length-1);
				}
				if(lmtCtrl!=""){
					lmtCtrl=lmtCtrl.substring(0,lmtCtrl.length-1);
				}
				if(othCtrl!=""){
					othCtrl=othCtrl.substring(0,othCtrl.length-1);
				}
				XFMonitorReportWin_dataset.setValue("appendCtrl",apdCtrl);
				XFMonitorReportWin_dataset.setValue("lmtCtrl",lmtCtrl);
				XFMonitorReportWin_dataset.setValue("riskCtrl",othCtrl);
			}
		});
		MonitorReportCtrl.dwrFindFrequency(businessId,function(y){
			if(y && y[0]!=""){
				XFMonitorReportWin_dataset.setValue("frequency",y[0]);
				XFMonitorReportWin_dataset.setValue("frequencyName",y[1]);
				XFMonitorReportWin_dataset.setFieldHidden("frequency",false);
			}else{
				XFMonitorReportWin_dataset.setFieldHidden("frequency",true);
			}
		});
		$("#fldlabel_opinion").html($("#fldlabel_opinion").text()+"<span style='color:red;'>*</span>");
		$("#fldlabel_measCompleteDate").html($("#fldlabel_measCompleteDate").text()+"<span style='color:red;'>*</span>");
		var pageReadOnly='${pageReadOnly}';
		if(pageReadOnly=="1"){
			XFMonitorReportWin_dataset.setReadOnly(true);
			$("a[id=btnSave]").hide();
			$("a[id=btnSubmit]").hide();
			$("a[id=btnBack]").hide();
		}
	}
	function XFMonitorReportWin_dataset_onSetValue(ds,curretField,val){
		for(var i=0;i<fields_loanPer.length;i++){
			if(curretField.name=='checkway'){
				checkway_selectedFun(val);
			}else if(curretField.name=='appendctrl'){
				appendCtrl_selectedFun(val);
			}else if(curretField.name==fields_loanPer[i][0].toLowerCase()){
				_xfMonitorReport_selectedFun(val,fields_loanPer[i][1],fields_loanPer[i][2]);
			}else if(curretField.name=='riskctrl'){
				riskCtrl_selectedFun(val);
			}
		}
		return val;
	}
	function frequency_DropDown_beforeOpen(dropDown){
		var businessId='${businessId}';
		subAutoDataDic_DropDownDataset.setParameter("businessId",businessId);
		subAutoDataDic_DropDownDataset.setParameter("dicCode",703);
		frequency_DropDown.cached=false;//��qGroupId�����뻺��
	}
	//��ѡ��ť�����������¼�------start
	function riskCtrl_selectedFun(val){
		if(val && val!="" && val.indexOf("SS")>-1){
			XFMonitorReportWin_dataset.setFieldHidden("otherCtrlDesc",false);
		}else{
			XFMonitorReportWin_dataset.setFieldHidden("otherCtrlDesc",true);
			XFMonitorReportWin_dataset.setValue("otherCtrlDesc",null);
		}
	}
	function appendCtrl_selectedFun(val){
		if(val && val!="" && val.indexOf("1")>-1){
			XFMonitorReportWin_dataset.setFieldHidden("frequency",false);
		}else{
			XFMonitorReportWin_dataset.setFieldHidden("frequency",true);
			XFMonitorReportWin_dataset.setValue("frequency",null);
			XFMonitorReportWin_dataset.setValue("frequencyName",null);
		}
	}
	function checkway_selectedFun(val){
		if(null==val || val==""){
			XFMonitorReportWin_dataset.setFieldHidden("checkPlace",true);
			XFMonitorReportWin_dataset.setFieldHidden("checkDate",true);
			XFMonitorReportWin_dataset.setFieldHidden("checkType",true);
		}else if(val=="1"){
			XFMonitorReportWin_dataset.setFieldHidden("checkPlace",false);
			XFMonitorReportWin_dataset.setFieldHidden("checkDate",false);
			XFMonitorReportWin_dataset.setFieldHidden("checkType",true);
			XFMonitorReportWin_dataset.setValue("checkType",null);
		}else{
			XFMonitorReportWin_dataset.setFieldHidden("checkPlace",true);
			XFMonitorReportWin_dataset.setFieldHidden("checkDate",true);
			XFMonitorReportWin_dataset.setFieldHidden("checkType",false);
			XFMonitorReportWin_dataset.setValue("checkPlace",null);
			XFMonitorReportWin_dataset.setValue("checkDate",null);
		}
	}
	function _xfMonitorReport_selectedFun(val,show,fieldName){
		if(null!=val && val!="" && val==show){
			XFMonitorReportWin_dataset.setFieldHidden(fieldName,false);
		}else {
			XFMonitorReportWin_dataset.setFieldHidden(fieldName,true);
			XFMonitorReportWin_dataset.setValue(fieldName,null);
		}
	}
	//��ѡ��ť�����������¼�------end
	
	//ȡ��
	function cancelFun(){
		XFMonitorReportWin_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		XFMonitorReportWin_dataset.setParameter("taskAssignee",taskAssignee);
		btnSubmitTrue.click();
	}
	function btnSubmitTrue_onClickCheck(button){
		var op="submit";
		XFMonitorReportWin_dataset.setParameter("op",op);
	}
	function btnSubmitTrue_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		top.easyMsg.info("����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		if(window && window.parent){
			window.parent.ajMonitorReportWin_close();
		}
	}
	//�ύ��ť�����¼�
	function btnSubmit_onClick(button){
		var appendCtrl=XFMonitorReportWin_dataset.getValue("appendCtrl");
		var lmtCtrl=XFMonitorReportWin_dataset.getValue("lmtCtrl");
		var riskCtrl=XFMonitorReportWin_dataset.getValue("riskCtrl");
		var frequency=XFMonitorReportWin_dataset.getValue("frequency");
		var opinion=XFMonitorReportWin_dataset.getValue("opinion");
		var rptStatus='${rptStatus}';
		if(appendCtrl.indexOf('1')>-1 && (frequency==null || frequency=="")){
			top.easyMsg.info("�����Ӵ�����ʩ��ѡ���ǿ���Ƶ�ʱ���ѡ���ǿ��ļ��Ƶ�ʣ�");
			return false;
		}
		if(opinion==null || opinion==""){
			top.easyMsg.info("�������Ϊ�գ�");
			return false;
		}
		var vd=XFMonitorReportWin_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var measCompleteDate=XFMonitorReportWin_dataset.getValue("measCompleteDate");
		if(measCompleteDateHide==false && (measCompleteDate==null || measCompleteDate=="")){
			top.easyMsg.info("��ʩ���ʱ�䲻��Ϊ�գ�");
			return false;
		}
		//ѡ���˿��ƴ�ʩ����Ҫѡ�������
		if(rptStatus!="2" || ((appendCtrl!=null && appendCtrl!="") || (lmtCtrl!=null && lmtCtrl!="") || (riskCtrl!=null && riskCtrl!=""))){
			var orgId=user_info.orgId;
			var roleId="";
			var businessId='${businessId}';
			TaskVariable.findTaskVariable(businessId,function(y){
				if(y && y.nextRole){//��ȡ����ɫID�򿪴��ڡ�
					submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+y.nextRole,"600","400");
				}else{//��ȡ������ֱ���ύ
					btnSubmitTrue.click();
				}
			});
		}else{
			btnSubmitTrue.click();
		}
	}
	//�˻ذ�ť�ύ����¼�
	function btnBack_onClickCheck(button){
		var op="back";
		XFMonitorReportWin_dataset.setParameter("op",op);
		var appendCtrl=XFMonitorReportWin_dataset.getValue("appendCtrl");
		var frequency=XFMonitorReportWin_dataset.getValue("frequency");
		var opinion=XFMonitorReportWin_dataset.getValue("opinion");
		if(appendCtrl.indexOf('1')>-1 && (frequency==null || frequency=="")){
			top.easyMsg.info("�����Ӵ�����ʩ��ѡ���ǿ���Ƶ�ʱ���ѡ���ǿ��ļ��Ƶ�ʣ�");
			return false;
		}
		if(opinion==null || opinion==""){
			top.easyMsg.info("�������Ϊ�գ�");
			return false;
		}
	}
	
	//����ҳ�������ֶ�ֻ��
	function setPageReadOnlyFun(){
		var fieldName="";
		for(var i=0;i<XFMonitorReportWin_dataset.fields.length;i++){
			fieldName=XFMonitorReportWin_dataset.fields[i].name;
			if(fieldName.substring(0,1)!="_"){
				XFMonitorReportWin_dataset.setFieldReadOnly(fieldName,true);
			}
		}
	}
	//����ҳ���ֶο�д
	function setPageCanWriteFun(editFields){
		for(var i=0;i<editFields.length;i++){
			XFMonitorReportWin_dataset.setFieldReadOnly(editFields[i],false);
		}
	}
	function btnSave_onClickCheck(button){
		XFMonitorReportWin_dataset.setParameter("op",null);
		var appendCtrl=XFMonitorReportWin_dataset.getValue("appendCtrl");
		var frequency=XFMonitorReportWin_dataset.getValue("frequency");
		if(appendCtrl.indexOf('1')>-1 && (frequency==null || frequency=="")){
			top.easyMsg.info("�����Ӵ�����ʩ��ѡ���ǿ���Ƶ�ʱ���ѡ���ǿ��ļ��Ƶ�ʣ�");
			return false;
		}
		var measCompleteDate=XFMonitorReportWin_dataset.getValue("measCompleteDate");
		if(measCompleteDateHide==false && (measCompleteDate==null || measCompleteDate=="")){
			top.easyMsg.info("��ʩ���ʱ�䲻��Ϊ�գ�");
			return false;
		}
	}
	//�����ر�ҳ�棬ˢ�±���
	function btnSave_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("����ɹ���");
	}
	//�˻غ�ر�ҳ�棬ˢ�±���
	function btnBack_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		window.parent.ajMonitorReportWin_close();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/MonitorReportCtrl.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
</@CommonQueryMacro.page>