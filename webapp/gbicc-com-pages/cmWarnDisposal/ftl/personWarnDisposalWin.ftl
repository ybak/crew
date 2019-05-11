<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign taskId=RequestParameters["taskId"]?default("")>
<#assign customerId=RequestParameters["customerId"]?default("")>
<@CommonQueryMacro.page title="Ԥ������  &gt;  �ҵ�����">
<script type="text/javascript" src="${contextPath}/gbicc-pages/regular/comm/common.js"></script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TCmWarnDisposalAjax.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TCmWarnTaskRelAjax.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/upLoadNumsAjax.js'> </script>

	<table style="width: 100%">
		<tr>
			<td>
			<center>
				<span style="padding:7px 0 0  0;">
					<a id="readFinaAnal" onclick="readFinaAnal_onClick()"  href="javascript:void(0)">�鿴������ͼ</a>
					<a id="readFinaInte" onclick="readFinaInte_onClick()" href="javascript:void(0)">�鿴�������</a>
					<a id="readFundMoni" onclick="readFundMoni_onClick()" href="javascript:void(0)">�鿴������Ŷ�</a>
					<a id="readZHReport" onclick="readZHReport_onClick()" href="javascript:void(0)">������ͼ</a>
				</span>
				</center>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="TCmCustomer" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="group2" label="������Ϣ" colNm=4
					fieldStr="taskCode,custcode,custname,loanAmount,loanBalance,businessCode,legalRep,operBankNam,operatorNam"/>
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TCmWarnTaskRel" init="true" submitMode="all">	
					<@CommonQueryMacro.GroupBox id="box1" label="Ԥ����Ϣ">
						<@CommonQueryMacro.DataTable id="warnSignalTabled" paginationbar="addWarnBtn,delDisposalBtn,lookBtn" pagination="true" 
			             fieldStr="warnCode,warnLevel,warnSubject,warnName,warnStatus,warnDate,riskDesc" width="100%" hasFrame="true"/>
		           <@CommonQueryMacro.FloatWindow id="warnSignalFW" modal="true" label="Ԥ�����"  position="center" 
							resize="true" minimize="false" maximize="true" closure="true" show="false" defaultZoom="normal">
								<table style="width: 100%"><tr><td>
								<@CommonQueryMacro.Group id="group3" label="" colNm=4
								fieldStr="warnCode,warnLevel,warnSubject,warnName,warnDate,riskDesc,dddd,dddd"/>
							<center>
							<@CommonQueryMacro.Button id="warnSignalConfirm" />
							</center>
							</td></tr></table>
					    </@CommonQueryMacro.FloatWindow>
		           </@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TRulDefinitionList" init="true" submitMode="all">	
						<@CommonQueryMacro.FloatWindow id="TRulDefinitionWin" modal="true" label="���Թ���ѡ��"  position="center"
							resize="true" minimize="false" maximize="true" closure="true" show="false" defaultZoom="normal">
							<table style="width: 100%"><tr><td>
							<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" />
					<@CommonQueryMacro.DataTable id="TRulDefinitionTable" paginationbar="ruleAddBtn" pagination="true" 
			             fieldStr="ruleCode,ruleName" width="100%" hasFrame="true"/>
					    </@CommonQueryMacro.FloatWindow>	
							</td></tr></table>
					
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="group4" label="Ԥ���˲���Ϣ" colNm=4 fieldStr="inspectorsNam,inspeCitDate,inspeMethod,inspeDate,inspeInfo,contMeasure,contOth,contDesc"/>
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="group5" label="Ԥ��������Ϣ" colNm=4 fieldStr="disposalPerNam,disposalDate,dispoCitDate,disposalInfo"/>
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group6" label="������Ϣ" colNm=4 fieldStr="isContinue,overRc,dddd,dddd"/>
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="group7" label="�����˻�/�ύ" colNm=4 fieldStr="opinionResult,backPerson,isSubmitNext,opinion,dddd,dddd"/>
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<div name="group9" class="group" noextra="true">
				<h5 noextra="true">����</h5>
				<center style="padding-top: 5px;padding-bottom: 10px;">
					<a id="fupload" href="javascript:void()">�ϴ�/���أ�<font id="Nums"></font>��</a>
				</center>
			</div>
			</td>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
				<center>
					<@CommonQueryMacro.Button id= "warnTaskSubmit" />
					<@CommonQueryMacro.Button id= "btnSubmit" />
					<@CommonQueryMacro.Button id= "warnTaskSave" />
					<span name="warnTaskEnd">
					<@CommonQueryMacro.Button id= "warnTaskEnd" />
					</span>
				</center>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TaskApprovalHistorySelectAll" init="true" submitMode="all">
					<@CommonQueryMacro.GroupBox id="box2" label="������ʷ">
						<@CommonQueryMacro.DataTable id="TaskApprovalHistorySelectAllTable" paginationbar="btnOpinion"
						fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
						<@CommonQueryMacro.FloatWindow id="TaskApprovalHistorySelectAllFW" modal="true" label="�鿴���" position="center" 
							closure="true" show="false" defaultZoom="normal">
							<table style="width: 100%"><tr><td>
							<@CommonQueryMacro.Group id="TaskApprovalHistorySelectAllGroup" label="" colNm=4 fieldStr="opinion"/>
							</td></tr></table>
						</@CommonQueryMacro.FloatWindow>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		
	</table>

<script language="JavaScript">
var roleName="aa";
var readOnly="0";//Ĭ�ϲ����ļ� �ϴ�
var isShowSubmitNext=false;
var nextRole="";
var taskType="DC";
var submitWindow=null;
/**
 * 20160825
 */
function cancelFun(){
	submitWindow.close();
}
function initCallGetter_post(dataset) {
	$("a[id=warnTaskSubmit]").hide();
    var businessId='${taskId}';
  //���ݽ�ɫ����ʾ�������ذ�ť
	TaskVariable.findTaskVariable(businessId,function(y){
		taskType=TCmWarnTask_dataset.getValue("taskType");
		roleName=y.nowRole;
		nextRole=y.nextRole;
		if(roleName=="khjl"){//�ͻ�����
			setAllReadOnlyFun()
			if(taskType){
				if(taskType=="RC"){
					setPageReadOnlyFun();
					TCmWarnTask_dataset.setFieldHidden("isContinue",true);
					TCmWarnTask_dataset.setFieldReadOnly("overRc",false);
				}else{
					$("div[name=group6]").hide();
					$("div[name=group5]").hide();
				}
			}else{
				$("div[name=group6]").hide();
			}
			$("span[name=warnTaskEnd]").hide();
			$("div[name=group7]").hide();
			TCmWarnTask_dataset.setFieldReadOnly("disposalDate",false);
			TCmWarnTask_dataset.setFieldReadOnly("dispoCitDate",false);
			TCmWarnTask_dataset.setFieldReadOnly("disposalInfo",false);
		}else{
			setPageReadOnlyFun();
			if(taskType=="RC"){
				TCmWarnTask_dataset.setFieldHidden("isContinue",true);
				$("span[name=warnTaskEnd]").hide();
			}else{
				TCmWarnTask_dataset.setFieldHidden("overRc",true);
				$("div[name=group5]").hide();
			}
		}
		if(taskType=="DC"){
			if(y.canAddProcess=="false"){
				TCmWarnTask_dataset.setFieldReadOnly("isContinue",true);
			}else{
				TCmWarnTask_dataset.setFieldReadOnly("isContinue",false);
			}
			if(y.showAP=="false"){
				$("div[name=group6]").hide();
			}
			if(roleName=="fhfxjczg"){
				TCmWarnDisposalAjax.isSubmitNext(businessId,function(re){
					 if(re.showSubmitNext=="true"){//
						 isShowSubmitNext=true;
						 TCmWarnTask_dataset.setFieldHidden("isSubmitNext",false);
						 TCmWarnTask_dataset.setFieldReadOnly("isSubmitNext",false);
					 }else{
						 TCmWarnTask_dataset.setFieldHidden("isSubmitNext",true);
					 }
				});
				TCmWarnTask_dataset.setFieldReadOnly("isContinue",true);
			}else{
				TCmWarnTask_dataset.setFieldHidden("isSubmitNext",true);
			}
			if(roleName=="zhfxjc"){
				TCmWarnTask_dataset.setFieldReadOnly("isContinue",true);
			}
		}else{
			TCmWarnTask_dataset.setFieldHidden("isContinue",true);
			TCmWarnTask_dataset.setFieldHidden("isSubmitNext",true);
		}
		
		if(roleName=="khjlqr"){//�ͻ�����ȷ��
			$("div[name=group7]").hide();
			$("span[name=warnTaskEnd]").hide();
			$(btnSubmit).context.innerHTML="<span class=\"l-btn-left\"><span class=\"l-btn-text icon-default\" style=\"padding-left:20px\">ȷ�����</span></span>";
			$(warnTaskSubmit).context.innerHTML="<span class=\"l-btn-left\"><span class=\"l-btn-text icon-default\" style=\"padding-left:20px\">ȷ�����</span></span>";
			warnTaskSave.disable(true);
			readOnly="1";//Ĭ�ϲ����ļ� �ϴ�
		}
		if(roleName!="zhfxjc"&&roleName!="zhfxjczg"){
		  	$("a[id=readZHReport]").hide();
	  	}
	});
	
	var contMeasure=TCmWarnTask_dataset.getValue("contMeasure");
	if(contMeasure){
		if(contMeasure.indexOf("SS")>-1){
			TCmWarnTask_dataset.setFieldHidden("contOth",false);
		}else{
			TCmWarnTask_dataset.setFieldHidden("contOth",true);
		}
	}else{
		TCmWarnTask_dataset.setFieldHidden("contOth",true);
	}
	
	TCmWarnTask_dataset.setFieldHidden("backperson",true);
	
	//������2016-06-30
	//ҳ����ʾ�ϴ�����
	showNums();
	
}
//������2016-06-30
//ҳ����ʾ�ϴ�����
var showNums = function (){
	var numsDom=document.getElementById('Nums');
	numsDom.innerHTML="0";
	numsDom.setAttribute('color','black');
	var realId='${taskId}';
	upLoadNumsAjax.getNums(realId,function(result){
		if(result.flag=="true"){
			if(parseInt(result.nums)>0){
				numsDom.innerHTML=result.nums;
				numsDom.setAttribute('color','red');
			}
		}
	});
}
function setAllReadOnlyFun(){
	var fieldName="";
	TCmWarnTask_dataset.setFieldReadOnly("taskCode",true);
	TCmWarnTask_dataset.setFieldReadOnly("warnLevel",true);
	TCmWarnTask_dataset.setFieldReadOnly("inspectors",true);
	TCmWarnTask_dataset.setFieldReadOnly("inspeCitDate",true);
	//���ÿͻ�����
	for(var i=0;i<TCmCustomer_dataset.fields.length;i++){
		fieldName=TCmCustomer_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmCustomer_dataset.setFieldReadOnly(fieldName,true);
		}
	}
}
//����ҳ�������ֶ�ֻ��
function setPageReadOnlyFun(){
	var fieldName="";
	for(var i=0;i<TCmWarnTask_dataset.fields.length;i++){
		fieldName=TCmWarnTask_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmWarnTask_dataset.setFieldReadOnly(fieldName,true);
		}
	}
	//���ÿͻ�����
	for(var i=0;i<TCmCustomer_dataset.fields.length;i++){
		fieldName=TCmCustomer_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmCustomer_dataset.setFieldReadOnly(fieldName,true);
		}
	}
	//����Ԥ����Ϣ
	for(var i=0;i<TCmWarnTaskRel_dataset.fields.length;i++){
		fieldName=TCmWarnTaskRel_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmWarnTaskRel_dataset.setFieldReadOnly(fieldName,true);
		}
	}
	//���ذ�ť
	addWarnBtn.disable(true);
	delDisposalBtn.disable(true);
	TCmWarnTask_dataset.setFieldReadOnly("opinionResult",false);
	TCmWarnTask_dataset.setFieldReadOnly("backPerson",false);
	TCmWarnTask_dataset.setFieldReadOnly("opinion",false);
}
function initSel(val,selId){
    if(val!=null && val.length>0){
        var obj = document.getElementById(selId);
        var vals = val.split(";");
        for(var i=0;i<vals.length;i++){
            var tmp = vals[i];
            if(tmp!=null && tmp.length>0){
                var tmps = tmp.split("=");
                var opt = null;
                if(tmps.length>1){
                    opt = new Option(tmps[1],tmps[0]);
                }else{
                    opt = new Option(tmps[0],tmps[0]);
                }
                obj.options.add(opt);
            }
        }
    }
}
function moveOption(obj1, obj2){
	for(var i = obj1.options.length - 1 ; i >= 0 ; i--){
		if(obj1.options[i].selected){
			var opt = new Option(obj1.options[i].text,obj1.options[i].value);
			obj2.options.add(opt);
			obj1.remove(i);
		}
	}
}

function TCmWarnTask_dataset_onSetValue(ds,curretField,val){
	if((curretField.name=="contmeasure"||curretField.name=="contmeasurename")){
		if(val.indexOf("SS")>-1){
			TCmWarnTask_dataset.setFieldHidden("contOth",false);
		}else{
			TCmWarnTask_dataset.setFieldHidden("contOth",true);
		}
	}else if(curretField.name=="opinionresult"){
		if(val=="0"){
			TCmWarnTask_dataset.setFieldHidden("backperson",false);
			TCmWarnTask_dataset.setFieldHidden("isSubmitNext",true);
		}else{
			TCmWarnTask_dataset.setFieldHidden("backperson",true);
			if(isShowSubmitNext){
				TCmWarnTask_dataset.setFieldHidden("isSubmitNext",false);
			}
		}
	}
	return val;
}
//�ύ��ť�����¼�
function btnSubmit_onClick(button){
	/**
	 * ������20160804
	 * ˵����
	 * ����û��Ľ�ɫ�ǿͻ���������������һ������
	 */
	var record=TCmWarnTaskRel_dataset.getFirstRecord();
	if((!record||record==null)&&("khjl"==roleName)){
		top.easyMsg.info("��������һ��Ԥ����Ϣ��");
		return;
	}
	var flg=false;
	var op="submit";	
	if("khjl"==roleName||"khjlqr"==roleName){//�ͻ�����ʱ�������أ������ж�
		flg=true;
	}else{
		var opinionResult = TCmWarnTask_dataset.getValue("opinionResult");
		if(opinionResult){
			if(opinionResult=="0"){//�˻�
				if("khjlzg"==roleName){
					var op="backStart";
				}else{
					var backPerson = TCmWarnTask_dataset.getValue("backPerson");
					if(backPerson){
						if(backPerson=="0"){
							var op="backStart";
						}else{
							var op="backUp";
						}
					}else{
						top.easyMsg.info("��ѡ���˻ؽڵ㣡");
						return false;
					}
				}
				flg=false;
			}else{//ͬ��
				flg=true;
			}
		}else{
			top.easyMsg.info("����д��˽����");
			return false;
		}
	}
	TCmWarnTask_dataset.setParameter("op",op);
	if(flg){
		var orgId=user_info.orgId;
		var roleId="";
		var businessId='${taskId}';
		var params=[businessId,orgId];
		TCmWarnDisposalAjax.isOpenNextUserWin(params,function(sy){
			var isSubmitNext=TCmWarnTask_dataset.getValue("isSubmitNext");
			
			if(sy.success=="true"){
				if(sy.showWin=="true"){
					TaskVariable.findTaskVariable(businessId,function(y){
						if(y && y.nextRole && roleName!="fhfxjczg"){//��ȡ����ɫID�򿪴��ڡ�
							submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+sy.orgId+"&roleId="+y.nextRole,"600","400");
						}else{//��ȡ������ֱ���ύ
							if(isSubmitNext=='1'&&roleName=="fhfxjczg"){
								submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+sy.orgId+"&roleId="+y.nextRole,"600","400");
							}else{
								warnTaskSubmit.click();
							}
						}
					});
				}else{//��ȡ������ֱ���ύ
					if(isSubmitNext=='1'&&roleName=="fhfxjczg"){
						submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId=00001&roleId=560","600","400");
					}else{
						warnTaskSubmit.click();
					}
				}
			}else{
				top.easyMsg.info("ϵͳ����������ϵ����Ա��");
				return false;
			}
		});
	}else{
		warnTaskSubmit.click();
	}
}
function submitFun(taskAssignee){
	TCmWarnTask_dataset.setParameter("taskAssignee",taskAssignee);
	warnTaskSubmit.click();
}
//�ύ_����
function warnTaskSubmit_onClickCheck(button){
	var opinion=TCmWarnTask_dataset.getValue("opinion");
	TCmWarnTask_dataset.setParameter("opinion",opinion);
}
function warnTaskEnd_onClickCheck(button){
	if(confirm("�Ƿ�ȷ���ܾ�?")){
		var op="end";	
		var opinion=TCmWarnTask_dataset.getValue("opinion");
		TCmWarnTask_dataset.setParameter("opinion",opinion);
		TCmWarnTask_dataset.setParameter("op",op);
	}else{
		return false;
	}
}
//�ύ�ɹ�
function warnTaskEnd_postSubmit(button) {
	button.url="#";
	top.easyMsg.info("�ύ�ɹ���");
	if(parent.parent){
		if(parent.parent.GTab){parent.parent.GTab.closeTab('warnDisposalWin');}
	}
	window.parent.warnDisposalWin_close();
}
//�ύ�ɹ�
function warnTaskSubmit_postSubmit(button) {
	button.url="#";
	top.easyMsg.info("�ύ�ɹ���");
	if(window.parent.warnDisposalWin){
		window.parent.warnDisposalWin_close();
	}
	if(parent.parent.GTab){
		parent.parent.GTab.closeTab('warnDisposalWin');
	}
}
//����ɹ�
function warnTaskSave_postSubmit(button) {
	button.url="#";
}
//�鿴���
function btnOpinion_onClick(button){
	subwindow_TaskApprovalHistorySelectAllFW.show();
}
var selectWarnWin;
function selectCustomerWin_close(){
	selectWarnWin.close();
}
function addWarnBtn_onClick(button) {
	var businessId='${taskId}';
	selectWarnWin=openSubWin("selectWarnWin","�˹�����Ԥ�������Թ���","/gbicc-com-pages/cmWarnDisposal/ftl/TCmRulDefinitionWin.ftl?businessId="+businessId,"900","700");
}
function delDisposalBtn_onClick(button) {
	var warnId = TCmWarnTaskRel_dataset.getValue("id");
	if(warnId){
		
	}else{
		top.easyMsg.info("��ѡ��һ����¼��");
		return;
	}
	top.easyMsg.confirm("�Ƿ�ȷ��ɾ����Ԥ��?", function(){
		TCmWarnTaskRelAjax.removeTCmWarnTaskRel(warnId,function(f){
			if(f.success=="true"){
				TCmWarnTaskRel_dataset.flushData(TCmWarnTaskRel_dataset.pageIndex);
			}else{
				top.easyMsg.info(f.message);
			}
		});
	}, function(){
	    top.easyMsg.info("ȡ��");
	} );
}
function ruleAddBtn_onClick(button) {
	var record=TRulDefinitionList_dataset.firstUnit;
	while(record){
		if(record.getValue("select")=="true"){
			TCmWarnControlmeasure_dataset.insertRecord("end");
			TCmWarnControlmeasure_dataset.setValue("conmeasDesc",record.getValue("dataNo"));
			TCmWarnControlmeasure_dataset.setValue("conmeasName",record.getValue("dataName"));
		}
		record=record.nextUnit;
	}
}

function disposalBtn_onClick(button){
	var fieldName="";
	//����Ԥ����Ϣ
	for(var i=0;i<TCmWarnTaskRel_dataset.fields.length;i++){
		fieldName=TCmWarnTaskRel_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmWarnTaskRel_dataset.setFieldReadOnly(fieldName,true);
		}
	}
	TCmWarnTaskRel_dataset.setFieldReadOnly("riskDesc",false);
	subwindow_warnSignalFW.show();
}
function lookBtn_onClick(button){
	var fieldName="";
	//����Ԥ����Ϣ
	for(var i=0;i<TCmWarnTaskRel_dataset.fields.length;i++){
		fieldName=TCmWarnTaskRel_dataset.fields[i].name;
		if(fieldName.substring(0,1)!="_"){
			TCmWarnTaskRel_dataset.setFieldReadOnly(fieldName,true);
		}
	}
	if("khjl"==roleName){
		TCmWarnTaskRel_dataset.setFieldReadOnly("riskDesc",false);
	}
	subwindow_warnSignalFW.show();
}
function warnSignalConfirm_onClick(button){
	subwindow_warnSignalFW.close();
}


function openUploadWin(){
	openSubWin("uploadFile", "��������", 
		"/gbicc-pages/upload/commonupload.ftl?relaID=${taskId}&relaType=11&readOnly="+readOnly,
	null,400,true,true,function(){
		showNums();
	},false);
}
$("#fupload").linkbutton({"iconCls":"icon-upload"}).click(openUploadWin);
function readFinaAnal_onClick(){
	var customerNum =TCmCustomer_dataset.getValue("custcode");
	var chineseName =TCmCustomer_dataset.getValue("custname");
	var loanCardNum =TCmCustomer_dataset.getValue("loanAccount");
	var paramMap=new Map();
	paramMap.put("customerNum",customerNum);
	paramMap.put("chineseName",chineseName);
	parent.parent.GTab.addTab("warninfoWin", "�ͻ�������ͼ\t&nbsp;&nbsp;&nbsp;�ͻ���ţ�"+customerNum+"   �ͻ����ƣ�"+chineseName, "/gbicc-com-pages/riskview/ftl/riskView.ftl?customerNum="+customerNum+"&chineseName="+encodeURI(encodeURI(chineseName))+"&loanCardNum="+loanCardNum);
}
function readFinaInte_onClick(){
	var customerNum =TCmCustomer_dataset.getValue("custcode");
	var chineseName =TCmCustomer_dataset.getValue("custname");
	var paramMap=new Map();
	paramMap.put("customerNum",customerNum);
	paramMap.put("chineseName",chineseName);
	parent.parent.GTab.addTab("warninfoWin2", "�������\t&nbsp;&nbsp;&nbsp;�ͻ���ţ�"+customerNum+"   �ͻ����ƣ�"+chineseName, "/gbicc-com-pages/FinanciaAnalysis/ftl/FinanceAnalysis.ftl?customerNum="+customerNum+"&chineseName="+chineseName);
}
function readFundMoni_onClick(){
	var customerNum =TCmCustomer_dataset.getValue("custcode");
	var chineseName =TCmCustomer_dataset.getValue("custname");
	parent.parent.GTab.addTab("warninfoWin3", "������Ŷ�\t&nbsp;&nbsp;&nbsp;�ͻ���ţ�"+customerNum+"   �ͻ����ƣ�"+chineseName,"/gbicc-com-pages/financialIndexAnalsis/ftl/financialIndexAnalsis.ftl?customerNum="+customerNum+"&chineseName="+chineseName);
}
function readZHReport_onClick(){
	alert("�˹�����δ������");
}
function TaskApprovalHistorySelectAllTable_onDbClick(){
	btnOpinion.click();
}
</script>
</@CommonQueryMacro.page>