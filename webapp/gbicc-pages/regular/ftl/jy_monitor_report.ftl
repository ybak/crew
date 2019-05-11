<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign businessId=RequestParameters["businessId"]?default("")>
<#assign rptStatus=RequestParameters["rptStatus"]?default("")>
<#assign pageReadOnly=RequestParameters["pageReadOnly"]?default('0')>

<@CommonQueryMacro.page title="���˾�Ӫ�ඨ�ڼ�ر���">
<script type="text/javascript" src="${contextPath}/gbicc-pages/regular/comm/common.js"></script>
<table>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box1" label="���������Ϣ">
					<@CommonQueryMacro.Group id="group1" label="" colNm=4 labelwidth="150" 
					fieldStr="custName,custCode,loanAcct,prodName,loanAmt,loanBalance,arrearAmt,arrearInte,issueDate,completeDate,guarWay,rateFloPct,acctStatus,riskType,mobilecall,contaddr,surveyDate,mainSurvPer,assistSurvPer,checkWay"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box2" label="����˾�Ӫ����">
					<@CommonQueryMacro.Group id="group2" label="" colNm=4 labelwidth="150" 
					fieldStr="estaDate,regiAddr,operAddr,operStartDate,operEndDate,enteProp,induClass,staffQuan,regiCapi,rcvCapi,operScope,enteScale,enteGrade,juirPerDelegate,juirPerIdentCode,realCtrlPer,realCtrlPerIdentCode"/>
					<@CommonQueryMacro.Group id="group21" label="�Ϸ���Ӫ����" colNm=4 labelwidth="150" 
						fieldStr="busiLice,zhongZhengMa,orgCode,taxRegiCode,enviFlag,specOperCode"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box3" label="ע���ʱ��仯���">
					<@CommonQueryMacro.Group id="group3" label="" colNm=4 labelwidth="400" 
					fieldStr="regiCapiChange,ifHaveCapiRpt,regiCapiChangeDesc"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="box4" label="��Ȩ�ṹ�仯���">
				<@CommonQueryMacro.CommonQuery id="JYStockStruInfo" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="stockStruTable" paginationbar="" pagination="true"
					fieldStr="holdcustname,paperid,inveamt,stockperc" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group5" label="" colNm=4 labelwidth="250" 
					fieldStr="sharStruIfChange,realCtrlPerIfChange,stockStruChangeDesc"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box6" label="����˻�����Ϣ�䶯���">
					<@CommonQueryMacro.Group id="group6" label="" colNm=4 labelwidth="250" 
					fieldStr="enteNameIfChange,orgCodeIfChange,busiLiceIfChange,taxRegiCodeIfChange,loanCardIfChange,specOperCodeIfChange,induClassIfChange,enteIdentIfLose,enteInfoChangeDesc"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box7" label="�����������">
					<@CommonQueryMacro.Group id="group7" label="" colNm=4 labelwidth="250" 
					fieldStr="finaRptIfCredible,loanPerFinaCond,enteAmtIfChange,predRepmtSrc,finaAnalEval"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="box8" label="��Ȼ�˱�֤��ծ�������Ϣ���������Ȼ�˱�֤�ˣ�������Ϣ����">
				<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group8" label="" colNm=4 labelwidth="150" 
						fieldStr="guarantorName,ourbankGuarTotAmt,othbankGuarTotAmt,ourbankLoanBal,othbankLoanBal"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="JYOurbankCreditBusiInfo" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="ourbankCreditBusiTable" pagination="true"
					fieldStr="contno,assukind,tcapi,bal,issueDate,matureDate,riskflag" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="JYOurbankGuarInfo" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="ourbankGuarTable" pagination="true"
					fieldStr="custname,contno,assukind,tcapi,bal,begindate,enddate,riskflag" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box9" label="��Ȼ�˱�֤����Ϣ�䶯������������Ȼ�˱�֤�ˣ�������Ϣ����">
					<@CommonQueryMacro.Group id="group9" label="" colNm=4 labelwidth="350" 
					fieldStr="relaPer,othRelaPer,guarantorWorkChange,newCompName,guarantorPhoneChange,guarantorNewPhone,guarantorAddrChange,guarantorNewAddr,guarantorIncomeChange,guarantorPosiChange,guarantorNewPosi,guarantorOperChange,guarantorInfoChangeDesc"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box10" label="��Ȼ�˱�֤�˵�����������������е�Ѻ�������Ϣ����">
					<@CommonQueryMacro.Group id="group10" label="" colNm=4 labelwidth="170" 
					fieldStr="guarantorWishChange,guarantorGuarStre,guarantorWishChangeDesc,guarantorGuarStreDesc"/>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="box11" label="����˵�Ѻ�����е�Ѻ�������Ϣ����">
				<@CommonQueryMacro.CommonQuery id="JYLoanPerMortgageInfo" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="loanPerMortgageTable" pagination="true"
					fieldStr="assuname,impatype,oldowner,orgivalue,evalvalue,confvalue,validdate,impanum,assurate2,addr" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group11" label="" colNm=4 labelwidth="250" 
					fieldStr="mortCond,mortIfDevalue,mortAsseInsuIfExpire,mortIssueAndDesc"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="box12" label="�������Ѻ��">
				<@CommonQueryMacro.CommonQuery id="JYLoanPerCollatInfo" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="loanPerCollatTable" pagination="true"
					fieldStr="assuname,impatype,oldowner,orgivalue,evalvalue,confvalue,validdate,impanum,assurate2" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
				<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group12" label="" colNm=4 labelwidth="350" 
					fieldStr="collatCond,collatCondDesc,collatIfDevalue,collatImelIfExpire,collatIfLoseLawPote,collatIssueAndDesc"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
				<@CommonQueryMacro.CommonQuery id="MonitorReportWarnInfo" init="false" submitMode="current">
					<@CommonQueryMacro.FloatWindow id="MonitorReportWarnInfoFW" modal="true" label="�鿴Ԥ����Ϣ" position="center" 
						closure="true" show="false" defaultZoom="normal" width="800" height="300">
						<@CommonQueryMacro.DataTable id="MonitorReportWarnInfoFWTable" pagination="true" pageCache="false" pagination="false"
						fieldStr="ruleCode[100],ruleName[250],ruleDesc[250],ruleRank[100],trigDate[100]" width="100%" hasFrame="true"/>
					</@CommonQueryMacro.FloatWindow>
				</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<!-- 
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="box14" label="�ش��¼�˵��">
				<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" init="false" submitMode="current">
					<@CommonQueryMacro.Group id="group14" label="" colNm=2
					fieldStr="loanPerIfInvoLawsuit,loanPerIfInvoLawsuitDesc"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	 -->
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="box15" label="���ƴ�ʩ">
						<@CommonQueryMacro.Group id="group15" label="" colNm=2
						fieldStr="lmtCtrl,riskCtrl,otherCtrlDesc,appendCtrl,frequency,applyOpin"/>
				</@CommonQueryMacro.GroupBox>
				<@CommonQueryMacro.GroupBox id="box16" label="���">
						<@CommonQueryMacro.Group id="group6" labelwidth="250" label="" colNm=2
						fieldStr="opinion"/>
				</@CommonQueryMacro.GroupBox>
				<@CommonQueryMacro.GroupBox id="box17" label="��ʩ���ʱ��">
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
			<@CommonQueryMacro.CommonQuery id="JYMonitorReportWin" mode="1" init="true" submitMode="current">
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
		window.open("${contextPath}/common/donloadWord?reportType=JY&reportId="+reportId+"&businessId="+reportId);
	}
	//Ԥ���ȼ�
	var redWarnLevel="3";
	var orangeWarnLevel="2";
	var yellowWarnLevel="1";
	
	var fields=[["relaPer","5","othRelaPer"],["guarantorWorkChange","2","newCompName"],
	            ["guarantorPhoneChange","2","guarantorNewPhone"],["guarantorAddrChange","2","guarantorNewAddr"],
	            ["guarantorPosiChange","2","guarantorNewPosi"],["guarantorWishChange","2","guarantorWishChangeDesc"],
				["guarantorGuarStre","2","guarantorGuarStreDesc"],["collatCond","2","collatCondDesc"]];
	//ҳ���ʼ��
	function initCallGetter_post(){
		$("a[id=btnSubmitTrue]").hide();
		var riskCtrl=JYMonitorReportWin_dataset.getValue("riskCtrl");
		riskCtrl_selectedFun(riskCtrl);
		//���ػ���ʾ�ֶ�
		for(var i=0;i<fields.length;i++){
			var value=JYMonitorReportWin_dataset.getValue(fields[i][0]);
			_jyMonitorReport_selectedFun(value,fields[i][1],fields[i][2]);
		}
		
		var businessId='${businessId}';
		var rptStatus='${rptStatus}';
		JYMonitorReportWin_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		JYStockStruInfo_dataset.setParameter("businessId",businessId);
		JYStockStruInfo_dataset.flushData(JYStockStruInfo_dataset.pageIndex);
		JYOurbankCreditBusiInfo_dataset.setParameter("businessId",businessId);
		JYOurbankCreditBusiInfo_dataset.flushData(JYOurbankCreditBusiInfo_dataset.pageIndex);
		JYOurbankGuarInfo_dataset.setParameter("businessId",businessId);
		JYOurbankGuarInfo_dataset.flushData(JYOurbankGuarInfo_dataset.pageIndex);
		JYLoanPerMortgageInfo_dataset.setParameter("businessId",businessId);
		JYLoanPerMortgageInfo_dataset.setParameter("assusort","D");
		JYLoanPerMortgageInfo_dataset.flushData(JYLoanPerMortgageInfo_dataset.pageIndex);
		JYLoanPerCollatInfo_dataset.setParameter("businessId",businessId);
		JYLoanPerCollatInfo_dataset.setParameter("assusort","Z");
		JYLoanPerCollatInfo_dataset.flushData(JYLoanPerCollatInfo_dataset.pageIndex);
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
        		//$("fieldset[name=box16]").hide();
        	}else{
        		//var editFields=["opinion"];
        		//setPageCanWriteFun(editFields);
        	}
        	if(y.ctrlMeas!=null && y.ctrlMeas=="hide"){
        		//���ؿ��ƴ�ʩ
        		$("fieldset[name=box15]").hide();
        	}
        	if(y.ctrlMeasReadOnly!=null && y.ctrlMeasReadOnly=="false"){
        		//�����ֶο�д
        		var editFields=["riskCtrl","otherCtrlDesc","appendCtrl","applyOpin","lmtCtrl","frequency"];
        		setPageCanWriteFun(editFields);
        	}
        	if(y.measDate==null || y.measDate=="hide"){
        		//��ʾ��ʩ���ʱ��
        		$("fieldset[name=box17]").hide();
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
						JYMonitorReportWin_dataset.setValue("otherCtrlDesc",obj.otherCtrlDesc);
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
				JYMonitorReportWin_dataset.setValue("appendCtrl",apdCtrl);
				JYMonitorReportWin_dataset.setValue("lmtCtrl",lmtCtrl);
				JYMonitorReportWin_dataset.setValue("riskCtrl",othCtrl);
			}
		});
		var surveyDate=JYMonitorReportWin_dataset.getValue("surveyDate");
		var mainSurvPer=JYMonitorReportWin_dataset.getValue("mainSurvPer");
		if(surveyDate==null || surveyDate==""){
			TaskVariable.getSystemCurrentDate(null,function(y){
				JYMonitorReportWin_dataset.setValue("surveyDate",y);
			});
		}
		if(mainSurvPer==null || mainSurvPer==""){
			JYMonitorReportWin_dataset.setValue("mainSurvPer",user_info.userId);
		}
		
		var accountId=JYMonitorReportWin_dataset.getValue("loanAcct");
		MonitorReportCtrl.dwrGetReportWarnInfo(accountId,function(y){
			if(y && y.length>0){
				for(var i=0;i<y.length;i++){
					if(y[i].WARN_LEVEL==redWarnLevel){
						$("#redWarnCount").text(y[i].COUNT_);
					}else if(y[i].WARN_LEVEL==orangeWarnLevel){
						$("#orangeWarnCount").text(y[i].COUNT_);
					}else if(y[i].WARN_LEVEL==yellowWarnLevel){
						$("#yellowWarnCount").text(y[i].COUNT_);
					}
				}
			}
		});
		MonitorReportCtrl.dwrFindFrequency(businessId,function(y){
			if(y && y[0]!=""){
				JYMonitorReportWin_dataset.setValue("frequency",y[0]);
				JYMonitorReportWin_dataset.setValue("frequencyName",y[1]);
				JYMonitorReportWin_dataset.setFieldHidden("frequency",false);
			}else{
				JYMonitorReportWin_dataset.setFieldHidden("frequency",true);
			}
		});
		$("#fldlabel_opinion").html($("#fldlabel_opinion").text()+"<span style='color:red;'>*</span>");
		$("#fldlabel_measCompleteDate").html($("#fldlabel_measCompleteDate").text()+"<span style='color:red;'>*</span>");
		var pageReadOnly='${pageReadOnly}';
		if(pageReadOnly=="1"){
			JYMonitorReportWin_dataset.setReadOnly(true);
			$("a[id=btnSave]").hide();
			$("a[id=btnSubmit]").hide();
			$("a[id=btnBack]").hide();
		}
	}
	//ֵ�ı�����������ʾ�������ֶ�
	function JYMonitorReportWin_dataset_onSetValue(ds,curretField,val){
		for(var i=0;i<fields.length;i++){
			if(curretField.name=='appendctrl'){
				appendCtrl_selectedFun(val);
			}else if(curretField.name==fields[i][0].toLowerCase()){
				_jyMonitorReport_selectedFun(val,fields[i][1],fields[i][2]);
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
			JYMonitorReportWin_dataset.setFieldHidden("otherCtrlDesc",false);
		}else{
			JYMonitorReportWin_dataset.setFieldHidden("otherCtrlDesc",true);
			JYMonitorReportWin_dataset.setValue("otherCtrlDesc",null);
		}
	}
	function appendCtrl_selectedFun(val){
		if(val && val!="" && val.indexOf("1")>-1){
			JYMonitorReportWin_dataset.setFieldHidden("frequency",false);
		}else{
			JYMonitorReportWin_dataset.setFieldHidden("frequency",true);
			JYMonitorReportWin_dataset.setValue("frequency",null);
			JYMonitorReportWin_dataset.setValue("frequencyName",null);
		}
	}
	function _jyMonitorReport_selectedFun(val,show,fieldName){
		if(null!=val && val!="" && val==show){
			JYMonitorReportWin_dataset.setFieldHidden(fieldName,false);
		}else {
			JYMonitorReportWin_dataset.setFieldHidden(fieldName,true);
			JYMonitorReportWin_dataset.setValue(fieldName,null);
		}
	}
	//��ѡ��ť�����������¼�------end
	
	//ȡ��
	function cancelFun(){
		JYMonitorReportWin_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		JYMonitorReportWin_dataset.setParameter("taskAssignee",taskAssignee);
		btnSubmitTrue.click();
	}
	function btnSubmitTrue_onClickCheck(button){
		var op="submit";
		JYMonitorReportWin_dataset.setParameter("op",op);
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
		var appendCtrl=JYMonitorReportWin_dataset.getValue("appendCtrl");
		var lmtCtrl=JYMonitorReportWin_dataset.getValue("lmtCtrl");
		var riskCtrl=JYMonitorReportWin_dataset.getValue("riskCtrl");
		var frequency=JYMonitorReportWin_dataset.getValue("frequency");
		var opinion=JYMonitorReportWin_dataset.getValue("opinion");
		var rptStatus='${rptStatus}';
		if(appendCtrl.indexOf('1')>-1 && (frequency==null || frequency=="")){
			top.easyMsg.info("�����Ӵ�����ʩ��ѡ���ǿ���Ƶ�ʱ���ѡ���ǿ��ļ��Ƶ�ʣ�");
			return false;
		}
		if(opinion==null || opinion==""){
			top.easyMsg.info("�������Ϊ�գ�");
			return false;
		}
		var vd=JYMonitorReportWin_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var measCompleteDate=JYMonitorReportWin_dataset.getValue("measCompleteDate");
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
		JYMonitorReportWin_dataset.setParameter("op",op);
		var appendCtrl=JYMonitorReportWin_dataset.getValue("appendCtrl");
		var frequency=JYMonitorReportWin_dataset.getValue("frequency");
		var opinion=JYMonitorReportWin_dataset.getValue("opinion");
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
		//warnUpd.disable(true);
		//���������ֶ�ֻ��,�����ֶο�д
		var fieldName="";
		for(var i=0;i<JYMonitorReportWin_dataset.fields.length;i++){
			fieldName=JYMonitorReportWin_dataset.fields[i].name;
			if(fieldName.substring(0,1)!="_"){
				JYMonitorReportWin_dataset.setFieldReadOnly(fieldName,true);
			}
		}
	}
	//����ҳ���ֶο�д
	function setPageCanWriteFun(editFields){
		for(var i=0;i<editFields.length;i++){
			JYMonitorReportWin_dataset.setFieldReadOnly(editFields[i],false);
		}
	}
	
	//�鿴Ԥ����Ϣ
	function readWarnInfoFun(color){
		subwindow_MonitorReportWarnInfoFW.show();
		var accountId=JYMonitorReportWin_dataset.getValue("loanAcct");
		MonitorReportWarnInfo_dataset.setParameter("accountId",accountId);
		MonitorReportWarnInfo_dataset.setParameter("color",color);
		MonitorReportWarnInfo_dataset.flushData(MonitorReportWarnInfo_dataset.pageIndex);
	}
	
	function btnSave_onClickCheck(button){
		JYMonitorReportWin_dataset.setParameter("op",null);
		var appendCtrl=JYMonitorReportWin_dataset.getValue("appendCtrl");
		var frequency=JYMonitorReportWin_dataset.getValue("frequency");
		if(appendCtrl.indexOf('1')>-1 && (frequency==null || frequency=="")){
			top.easyMsg.info("�����Ӵ�����ʩ��ѡ���ǿ���Ƶ�ʱ���ѡ���ǿ��ļ��Ƶ�ʣ�");
			return false;
		}
		var measCompleteDate=JYMonitorReportWin_dataset.getValue("measCompleteDate");
		if(measCompleteDateHide==false && (measCompleteDate==null || measCompleteDate=="")){
			top.easyMsg.info("��ʩ���ʱ�䲻��Ϊ�գ�");
			return false;
		}
	}
	//�����
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

	function stockAdd_onClick(button) {
		JYStockStruInfo_dataset.insertRecord("end");
		subwindow_stockStruFW.show();
	}
	function stockUpd_onClick(button){
		subwindow_stockStruFW.show();
	}
	function stockConfirm_onClick(button){
		subwindow_stockStruFW.close();
	}
	
	function btnOpinion_onClick(){
		subwindow_taskApprovalHistoryFW.show();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/MonitorReportCtrl.js'></script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'></script>
</@CommonQueryMacro.page>