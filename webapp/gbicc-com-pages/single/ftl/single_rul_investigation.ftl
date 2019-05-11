<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign casesId=RequestParameters["casesId"]?default("")>
<#assign warningIds=RequestParameters["warningIds"]?default("")>
<#assign inveId=RequestParameters["inveId"]?default("")>
<#assign oper=RequestParameters["oper"]?default("")>
<#assign userId = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTlrno()>
<@CommonQueryMacro.page title="������Ԥ��-Э������">
<script type='text/javascript' src='${contextPath}/dwr/interface/upLoadNumsAjax.js'> </script>
<table>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulWarningSelectBox" label="����Ԥ����Ϣ" expand="true">
				<@CommonQueryMacro.CommonQuery id="SingleRulWarningSelect" init="false" submitMode="current">
					<@CommonQueryMacro.DataTable id="SingleRulWarningSelectTable" readonly="true" paginationbar="btnShow" 
					fieldStr="warnCode[80],rulType[100],rulName[150],rulDesc[150],warnStatus[100],warnDt[100],mainOrg[100]" width="100%" hasFrame="true"/>
				</@CommonQueryMacro.CommonQuery>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<@CommonQueryMacro.CommonQuery id="SingleRulInvestigation" init="true" submitMode="current">
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox" label="Э��������Ϣ" expand="true">
					<@CommonQueryMacro.Group id="SingleRulInvestigationGroup" label="" colNm=4 labelwidth="150"
					fieldStr="inveCode,inveName,matureDt,inveOrg,status,inveUser,inveCont"/>
					Э������˵����<a id="fupload" href="javascript:void()">�����<font id="Nums1"></font>��</a>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox2" label="����˲����" expand="true">
					<@CommonQueryMacro.Group id="SingleRulInvestigationGroup2" label="" colNm=2 labelwidth="150"
					fieldStr="inveFeedDt,inveConc" />
					Э�鷴�����棺<a id="fupload2" href="javascript:void()">�����<font id="Nums2"></font>��</a>
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	</@CommonQueryMacro.CommonQuery>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="SingleRulInveHist" init="true" submitMode="current">
				<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox4" label="ǰһ���ص�������" expand="true">
						<@CommonQueryMacro.Group id="SingleRulInvestigationGroup4" label="" colNm=2 labelwidth="150"
						fieldStr="inveFeedDt,inveConc" />
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<@CommonQueryMacro.CommonQuery id="SingleRulInvestigation" mode="1" init="true" submitMode="current">
	<tr>
		<td>
			<@CommonQueryMacro.GroupBox id="SingleRulInvestigationBox3" label="�ص������" expand="true">
					<@CommonQueryMacro.Group id="SingleRulInvestigationGroup3" label="" colNm=4 labelwidth="150"
					fieldStr="againCreateDt,againMatureDt,againCreateUserName,againOpinion" />
			</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td>
			<br/><center>
				<@CommonQueryMacro.Button id="btnSave" />
				<@CommonQueryMacro.Button id="btnSubmit" />
				<@CommonQueryMacro.Button id="btnAgainInveSubmit" />
				<@CommonQueryMacro.Button id="btCancel" />
			</center>
		</td>
	</tr>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	var oper='${oper}';
	$("#fupload").linkbutton({"iconCls":"icon-upload"}).click(function(){
		openUploadWin(1,"taskDesc");
	});
	$("#fupload2").linkbutton({"iconCls":"icon-upload"}).click(function(){
		if(oper=="waitInve" || oper=="waitAgainInve"){
			openUploadWin(0,"feedRept");
		}else{
			openUploadWin(1,"feedRept");
		}
	});
	
	//�鿴
	function btnShow_onClick(){
		var businessId=SingleRulWarningSelect_dataset.getValue("id");
		if(businessId==null || businessId==""){
			top.easyMsg.info("��ѡ��һ�����ݣ�");
			return false;
		}
		if(businessId!=null && businessId!=""){
			parent.parent.parent.GTab.addTab('SingleRulWarning',"��ϸ��Ϣ",'/gbicc-com-pages/single/ftl/single_rul_warning_info.ftl?businessId='+businessId);
		}
	};
	function openUploadWin(readOnlyFlag,fileType){
		var businessId=SingleRulInvestigation_dataset.getValue("id");
		if(businessId){
			openSubWin("uploadFile", "��������","/gbicc-pages/upload/commonupload.ftl?relaID="+businessId+"&relaType="+fileType+"&readOnly="+readOnlyFlag,null,400);
		}else{
			top.easyMsg.info("�뱣�������Ϣ�����ϴ�������");
			return;
		}
	}
	//ҳ���ʼ��
	function initCallGetter_post(){
		var warningIds='${warningIds}';
		var inveId='${inveId}';
		SingleRulWarningSelect_dataset.setParameter("warningIds",warningIds);
		SingleRulWarningSelect_dataset.flushData(SingleRulWarningSelect_dataset.pageIndex);
		if(inveId!=""){
			SingleRulInvestigation_dataset.setParameter("id",inveId);
			SingleRulInvestigation_dataset.flushData(SingleRulInvestigation_dataset.pageIndex);
		}
		//����ҳ��ֻ��
		var fields=["inveCode","inveName","matureDt","inveOrg","status","inveUser","inveCont","inveFeedDt"];
		setPageReadOnlyFieldsFun(fields);
		//Э����Ա��ֵ
		var inveUserId=SingleRulInvestigation_dataset.getValue("inveUserId");
		var userId='${userId}';
		var userName='${Session["USER_SESSION_INFO"].tlrName}';
		if(inveUserId==null || inveUserId=="" && (oper!="read")){
			SingleRulInvestigation_dataset.setValue("inveUserId",userId);
			SingleRulInvestigation_dataset.setValue("inveUser",userName);
		}
		var inveFeedDt=SingleRulInvestigation_dataset.getValue("inveFeedDt");
		if(inveFeedDt==null || inveFeedDt=="" && (oper!="read")){
			TaskVariable.getSystemCurrentDate(null,function(y){
				SingleRulInvestigation_dataset.setValue("inveFeedDt",y);
			});
		}else if(inveFeedDt!=null && oper=="waitAgainInve"){
			TaskVariable.getSystemCurrentDate(null,function(y){
				SingleRulInvestigation_dataset.setValue("inveFeedDt",y);
			});
		}
		var againCreateDt=SingleRulInvestigation_dataset.getValue("againCreateDt");
		if(againCreateDt==null || againCreateDt=="" && (oper!="read" && oper!="waitInve" && oper!="waitAgainInve")){
			TaskVariable.getSystemCurrentDate(null,function(y){
				SingleRulInvestigation_dataset.setValue("againCreateDt",y);
			});
		}
		var againCreateUserId=SingleRulInvestigation_dataset.getValue("againCreateUserId");
		if(againCreateUserId==null || againCreateUserId=="" && (oper!="read" && oper!="waitInve" && oper!="waitAgainInve")){
			SingleRulInvestigation_dataset.setValue("againCreateUserId",userId);
			SingleRulInvestigation_dataset.setValue("againCreateUserName",userName);
		}
		//�����ص��顢����˲����BOXֻ��
		var againFields=["againCreateDt","againMatureDt","againCreateUserName","againOpinion"];
		var taskCheckFields=["inveFeedDt","inveConc"];
		SingleRulInveHist_dataset.setParameter("inveId",inveId);
		SingleRulInveHist_dataset.flushData(1);
		if(oper=="read"){
			setPageReadOnlyFieldsFun(againFields);
			setPageReadOnlyFieldsFun(taskCheckFields);
			$("a[id=btCancel]").hide();
			$("a[id=btnSave]").hide();
			$("a[id=btnSubmit]").hide();
			$("a[id=btnAgainInveSubmit]").hide();
		}else if(oper=="againInve"){
			SingleRulInvestigation_dataset.setFieldRequired("againOpinion",true);
			setPageReadOnlyFieldsFun(taskCheckFields);
			$("a[id=btnSubmit]").hide();
			setPageRequiredFieldsFun(againFields);
		}else if(oper=="waitInve"){
			$("fieldset[name=SingleRulInvestigationBox3]").hide();
			$("fieldset[name=SingleRulInvestigationBox4]").hide();
			$("a[id=btnAgainInveSubmit]").hide();
		}else if(oper=="waitAgainInve"){
			$("a[id=btnAgainInveSubmit]").hide();
			if(SingleRulInvestigation_dataset.getValue('saveFlag')!='1'){
				SingleRulInvestigation_dataset.setValue('inveConc',null);
			}
			setPageReadOnlyFieldsFun(againFields);
		}
		var inveNumb=SingleRulInvestigation_dataset.getValue("inveNumb");
		if(inveNumb<2){
			$("fieldset[name=SingleRulInvestigationBox4]").hide();
		}
		if(!SingleRulInveHist_dataset.getValue("id") || SingleRulInveHist_dataset.getValue("id")==null){
			$("fieldset[name=SingleRulInvestigationBox4]").hide();
		}
		//��ʾ�ϴ��ļ�������
		showNums1();
		showNums2();
	}
	//ҳ����ʾ�ϴ�����
	function showNums1(){
		var numsDom=document.getElementById('Nums1');
		numsDom.innerHTML="0";
		numsDom.setAttribute('color','black');
		var realId=SingleRulInvestigation_dataset.getValue("id");
		var relaType="taskDesc";
		upLoadNumsAjax.getRuleNums(realId,relaType,function(result){
			if(result.flag=="true"){
				if(parseInt(result.nums)>0){
					numsDom.innerHTML=result.nums;
					numsDom.setAttribute('color','red');
				}
			}
		});
		var inveConc=SingleRulInvestigation_dataset.getValue("inveConc");
		SingleRulInvestigation_dataset.flushData();
		SingleRulInvestigation_dataset.setValue("inveConc",inveConc);
	}
	//ҳ����ʾ�ϴ�����
	function showNums2(){
		var numsDom=document.getElementById('Nums2');
		numsDom.innerHTML="0";
		numsDom.setAttribute('color','black');
		var realId=SingleRulInvestigation_dataset.getValue("id");
		var relaType="feedRept";
		upLoadNumsAjax.getRuleNums(realId,relaType,function(result){
			if(result.flag=="true"){
				if(parseInt(result.nums)>0){
					numsDom.innerHTML=result.nums;
					numsDom.setAttribute('color','red');
				}
			}
		});
		var inveConc=SingleRulInvestigation_dataset.getValue("inveConc");
		SingleRulInvestigation_dataset.flushData();
		SingleRulInvestigation_dataset.setValue("inveConc",inveConc);
	}
	//����ҳ���ֶ�ֻ��
	function setPageReadOnlyFieldsFun(fields){
		for(var i=0;i<fields.length;i++){
			SingleRulInvestigation_dataset.setFieldReadOnly(fields[i],true);
		}
	}
	//����ҳ���ֶα���
	function setPageRequiredFieldsFun(fields){
		for(var i=0;i<fields.length;i++){
			SingleRulInvestigation_dataset.setFieldRequired(fields[i],true);
		}
	}
	//����Э����Ա
	function partUser_DropDown_beforeOpen(dropDown){
		var qServerType =SingleRulInvestigation_dataset.getValue("inveOrg");//��ȡЭ�����
		if(!qServerType){
			return "��ѡ����������!";
		}
		subAutoUserTree_DropDownDataset.setParameter("orgId",qServerType);
		partUser_DropDown.cached=false;//��qGroupId�����뻺��
	}
	//����Э����Ա���������¼�
	function partUser_DropDown_onKeyup(val){
		if(val.length>=0){
			return true;
		}
		return false;
	}
	//�ص����ύ
	function btnAgainInveSubmit_onClickCheck(){
		var casesId='${casesId}';
		var warningIds='${warningIds}';
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.setParameter("warningIds",warningIds);
		SingleRulInvestigation_dataset.setParameter("op","againInveSubmit");
	}
	function btnAgainInveSubmit_postSubmit(button){
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		window.parent.investigationWin_and_parWin_close();
	}
	//����
	function btnSave_onClickCheck(){
		var casesId='${casesId}';
		var warningIds='${warningIds}';
		if(oper=="againInve"){
			SingleRulInvestigation_dataset.setValue("saveFlag","2");
		}else{
			SingleRulInvestigation_dataset.setValue("saveFlag","1");
		}
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.setParameter("warningIds",warningIds);
		SingleRulInvestigation_dataset.setParameter("op","saveInve");
	}
	function btnSave_postSubmit(button){
		top.easyMsg.info("����ɹ���");
	}
	//�ύ
	function btnSubmit_onClickCheck(){
		var casesId='${casesId}';
		var warningIds='${warningIds}';
		SingleRulInvestigation_dataset.setParameter("casesId",casesId);
		SingleRulInvestigation_dataset.setParameter("warningIds",warningIds);
		SingleRulInvestigation_dataset.setParameter("op","inveComplete");
	}
	function btnSubmit_postSubmit(button){
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		window.parent.investigationWin_close();
	}
	//ȡ��
	function btCancel_onClick(){
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		if(window && window.parent){
			window.parent.investigationWin_close();
		}
	}
	
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>