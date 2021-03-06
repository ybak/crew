<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign taskType=RequestParameters["taskType"]?default("")>
<#assign userInfo_=Session["USER_SESSION_INFO"] />

<@CommonQueryMacro.page title="单规则预警处置任务列表">
<table>
	<@CommonQueryMacro.CommonQuery id="SingleRulWarning" init="true" submitMode="current">
		<tr>
			<td>
				<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" showButton="false" labelwidth="250" colNm=6/>
			</td>
		</tr>
		<tr>
			<td>
				<div align="center" style="margin-bottom:5px">
					<@CommonQueryMacro.InterfaceButton desc="查询" />
					<@CommonQueryMacro.SimpleButton id="btnReset" desc="重置" icon="icon-reload" />
				</div>
			</td>
		</tr>
		<@CommonQueryMacro.DataTable id="SingleRulWarningTable" readonly="false" paginationbar="btHandle,btPiHandle,btPiJoinCases,btPiAgree,btPiBack" remoteSort="true" sortable="true"
		fieldStr="select,rulCode[150],taskCode[150],rulName[400],rulType[200],fcettypecode,fcetname[450],warnDt,warnLevel[150],warnStatus,mainOrg[400]" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
	
	<@CommonQueryMacro.FloatWindow id="BatchRiskEliminateFW" modal="true" label="批量风险排除说明" 
		resize="true" minimize="false" width="850" height="250" maximize="true" closure="true" show="false" defaultZoom="normal">
		<@CommonQueryMacro.CommonQuery id="SingleRulWarningElimDesc" init="true" submitMode="current">
			<tr>
				<td>
					<@CommonQueryMacro.Group id="BatchRiskEliminateGroup" label="" colNm=2 labelwidth="100"
					fieldStr="taskAssignee,eliminateDesc_"/>
					<center>
					<@CommonQueryMacro.Button id="btnRiskSubmit" />
					<@CommonQueryMacro.Button id="btRiskCancel" />
					</center>
				</td>
			</tr>
		</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.FloatWindow>
	
	<@CommonQueryMacro.FloatWindow id="BatchOpinionFW" modal="true" label="批量审核意见" 
		resize="true" minimize="false" width="850" height="250" maximize="true" closure="true" show="false" defaultZoom="normal">
		<@CommonQueryMacro.CommonQuery id="SingleRulWarningElimDesc" init="true" submitMode="current">
			<tr>
				<td>
					<@CommonQueryMacro.Group id="BatchOpinionGroup" label="" colNm=2 labelwidth="100"
					fieldStr="opinion_"/>
					<center>
					<@CommonQueryMacro.Button id="btnOpinionSubmit" />
					<@CommonQueryMacro.Button id="btRiskCancel" />
					</center>
				</td>
			</tr>
		</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.FloatWindow>
	
	<@CommonQueryMacro.FloatWindow id="PiJoinCasesFW" modal="true" label="批量归入案例" position="center" 
				closure="true" show="false" defaultZoom="normal" width="1200">
	
				<@CommonQueryMacro.CommonQuery id="SingleRulBatchCasesSelect" init="true" submitMode="current">
				<tr>
					<td>
						<@CommonQueryMacro.Interface id="intface" label="请输入查询条件" showButton="false" colNm=4/>
					</td>
				</tr>
				<tr>
					<td>
						<div align="center" style="margin-bottom:5px">
							<@CommonQueryMacro.InterfaceButton desc="查询" />
							<@CommonQueryMacro.SimpleButton id="btnBatchReset" desc="重置" icon="icon-reload" />
						</div>
					</td>
				</tr>
					<@CommonQueryMacro.DataTable id ="SingleRulCasesSelectTable" paginationbar=""
					fieldStr="casesCode,casesName,createOrg,casesDesc,casesStatus,createDt" readonly="true" width="100%"/></br>
					<center>
						<@CommonQueryMacro.Button id="btnBatchSubmit" />
						<@CommonQueryMacro.Button id="btnBatchCancel" />
					</center>
				</@CommonQueryMacro.CommonQuery>
	</@CommonQueryMacro.FloatWindow>
	
	
	<@CommonQueryMacro.FloatWindow id="SingleRulWarningFW" modal="true" label="单规则预警处理" 
	resize="true" minimize="false" width="1200" height="700" maximize="true" closure="true" show="false" defaultZoom="normal">
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="SingleRulWarning" mode="1" init="true" submitMode="current">
					<@CommonQueryMacro.Group id="SingleRulWarningGroup" label="" colNm=4 labelwidth="150"
					fieldStr="fcettypecode,fcetname,rulCode,rulType,warnStatus,rulName,warnDt,mainOrg,warnDesc,eliminateDesc,opinion"/>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.DynamicTabSet id="BusinInfoTab" hasMenu="false" fit="false" height="200" selected="A01">
			    </@CommonQueryMacro.DynamicTabSet>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="true" submitMode="all">
					<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="审批历史">
						<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable" paginationbar="btnOpinion"
						fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
						<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="查看意见" position="center" 
							closure="true" show="false" defaultZoom="normal">
							<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
						</@CommonQueryMacro.FloatWindow>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="SingleRulWarning" init="true" mode="1" submitMode="current">
					<center>
						<span style="margin-right:-250px">
						<@CommonQueryMacro.Button id="btAddCases" />
						<@CommonQueryMacro.Button id="btJoinCases" />
						<@CommonQueryMacro.Button id="btRiskElim" />
						<@CommonQueryMacro.Button id="btnAgree" />
						<@CommonQueryMacro.Button id="btnBack" /></span>
						<span style="float:right;padding:7px 0 0  0;">
						<a id="readFinaAnal" onclick="readFinaAnal_onClick()"  href="javascript:void(0)">查看财务分析</a>
						<a id="readFinaInte" onclick="readFinaInte_onClick()" href="javascript:void(0)">查看财务诚信</a>
						<a id="readFundMoni" onclick="readFundMoni_onClick()" href="javascript:void(0)">查看资金流向监控</a>
						</span>
					</center>
					<@CommonQueryMacro.FloatWindow id="RiskEliminateFW" modal="true" label="风险排除" 
					resize="true" minimize="false" width="700" height="320" maximize="true" closure="true" show="false" defaultZoom="normal">
						<@CommonQueryMacro.Group id="RiskEliminateGroup" label="" colNm=2 labelwidth="250"
						fieldStr="rulCode,rulType,rulDesc,rulName,eliminateDesc"/>
						<center>
						<@CommonQueryMacro.Button id="btnSubmit" />
						<@CommonQueryMacro.Button id="warnTaskSubmit" />
						<@CommonQueryMacro.Button id="btCancel" />
					</center>
					</@CommonQueryMacro.FloatWindow>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
	</@CommonQueryMacro.FloatWindow>
</table>
<script>
	var submitWindow=null;
	function btnReset_onClick(button){
		SingleRulWarning_interface_dataset.clearData();
	}
	//页面初始化
	function initCallGetter_post(){
		var tlrno='${userInfo_.tlrNo}';
		$("a[id=warnTaskSubmit]").hide();
		TaskVariable.dwrGetUserCurrentRoleId(tlrno,function(y){
			if(y!=null && (y=="560" || y=="603")){
				//只有总行风险监测岗跟分支行监测岗有批量处理按钮。
				$("a[id=btPiHandle]").show();
				$("a[id=btPiJoinCases]").show();
				$("a[id=btPiAgree]").hide();
				$("a[id=btPiBack]").hide();
			}else{
				$("a[id=btPiAgree]").show();
				$("a[id=btPiBack]").show();
				$("a[id=btPiHandle]").hide();
				$("a[id=btPiJoinCases]").hide();
			}
		})
		
		var taskType='${taskType}';
		SingleRulWarning_dataset.setParameter("taskType",taskType);
		var handleOrgFlag=SingleRulWarning_dataset.getValue("handleOrgFlag");
		if(handleOrgFlag=="head"){
			$("a[id=readFundMoni]").show();
		}else{
			$("a[id=readFundMoni]").hide();
		}
	}
	function SingleRulWarningTable_onDbClick(){
		btHandle_onClick();
	}
	//处理
	function btHandle_onClick(){
		var businessId=SingleRulWarning_dataset.getValue("id");
		if(businessId==null||businessId==""){
			top.easyMsg.info("请选择一条数据！");
			return false;
		}
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
		//添加输出TAB页
		var OUTPUT={
			A01:{id:"A01",title:"帐务交易流水",url:"/gbicc-com-pages/single/output_ftl/a01.ftl?warningId="+businessId},
			A30:{id:"A30",title:"查冻扣登记簿",url:"/gbicc-com-pages/single/output_ftl/a30.ftl?warningId="+businessId},
			A38:{id:"A38",title:"承兑汇票信息",url:"/gbicc-com-pages/single/output_ftl/a38.ftl?warningId="+businessId},
			B01:{id:"B01",title:"自然人借据信息",url:"/gbicc-com-pages/single/output_ftl/b01.ftl?warningId="+businessId},
			C01:{id:"C01",title:"对公贷款借据明细",url:"/gbicc-com-pages/single/output_ftl/c01.ftl?warningId="+businessId},
			C02:{id:"C02",title:"对公贷款还款明细",url:"/gbicc-com-pages/single/output_ftl/c02.ftl?warningId="+businessId},
			C03:{id:"C03",title:"信贷合同",url:"/gbicc-com-pages/single/output_ftl/c03.ftl?warningId="+businessId},
			C05:{id:"C05",title:"对公贴现登记簿",url:"/gbicc-com-pages/single/output_ftl/c05.ftl?warningId="+businessId},
			C06:{id:"C06",title:"信贷支用申请明细",url:"/gbicc-com-pages/single/output_ftl/c06.ftl?warningId="+businessId},
			C08:{id:"C08",title:"对公抵质押物出入库操作流水",url:"/gbicc-com-pages/single/output_ftl/c08.ftl?warningId="+businessId},
			C09:{id:"C09",title:"票据信息",url:"/gbicc-com-pages/single/output_ftl/c09.ftl?warningId="+businessId},
			C11:{id:"C11",title:"跟单背书信息",url:"/gbicc-com-pages/single/output_ftl/c11.ftl?warningId="+businessId},
			C12:{id:"C12",title:"电子票据流转信息",url:"/gbicc-com-pages/single/output_ftl/c12.ftl?warningId="+businessId},
			C13:{id:"C13",title:"关联人信息",url:"/gbicc-com-pages/single/output_ftl/c13.ftl?warningId="+businessId},
			C14:{id:"C14",title:"担保圈信息",url:"/gbicc-com-pages/single/output_ftl/c14.ftl?warningId="+businessId},
			C15:{id:"C15",title:"客户指标信息",url:"/gbicc-com-pages/single/output_ftl/c15.ftl?warningId="+businessId},
			C16:{id:"C16",title:"自然人账户信息",url:"/gbicc-com-pages/single/output_ftl/c16.ftl?warningId="+businessId},
			J02:{id:"J02",title:"对公客户信息",url:"/gbicc-com-pages/single/output_ftl/j02.ftl?warningId="+businessId},
			J04:{id:"J04",title:"对私客户信息",url:"/gbicc-com-pages/single/output_ftl/j04.ftl?warningId="+businessId},
			J09:{id:"J09",title:"员工信息",url:"/gbicc-com-pages/single/output_ftl/j09.ftl?warningId="+businessId},
			J16:{id:"J16",title:"理财账户信息",url:"/gbicc-com-pages/single/output_ftl/j16.ftl?warningId="+businessId},
			J17:{id:"J17",title:"从合同信息",url:"/gbicc-com-pages/single/output_ftl/j17.ftl?warningId="+businessId},
			J18:{id:"J18",title:"信贷公司客户信息",url:"/gbicc-com-pages/single/output_ftl/j18.ftl?warningId="+businessId},
			L01:{id:"L01",title:"外部工商信息",url:"/gbicc-com-pages/single/output_ftl/l01.ftl?warningId="+businessId},
			L02:{id:"L02",title:"工商变更明细",url:"/gbicc-com-pages/single/output_ftl/l02.ftl?warningId="+businessId},
			L03:{id:"L03",title:"工商处罚明细",url:"/gbicc-com-pages/single/output_ftl/l03.ftl?warningId="+businessId},
			L04:{id:"L04",title:"开庭公告信息",url:"/gbicc-com-pages/single/output_ftl/l04.ftl?warningId="+businessId},
			L05:{id:"L05",title:"判决文书信息",url:"/gbicc-com-pages/single/output_ftl/l05.ftl?warningId="+businessId},
			L11:{id:"L11",title:"企业征信信息",url:"/gbicc-com-pages/single/output_ftl/l11.ftl?warningId="+businessId},
			L12:{id:"L12",title:"个人征信信息",url:"/gbicc-com-pages/single/output_ftl/l12.ftl?warningId="+businessId},
			L13:{id:"L13",title:"征信文件信息",url:"/gbicc-com-pages/single/output_ftl/l13.ftl?warningId="+businessId},
			L14:{id:"L14",title:"黑名单信息",url:"/gbicc-com-pages/single/output_ftl/l14.ftl?warningId="+businessId},
			L15:{id:"L15",title:"高能耗信息",url:"/gbicc-com-pages/single/output_ftl/l15.ftl?warningId="+businessId},
			L16:{id:"L16",title:"企业征信未结清贷款信息",url:"/gbicc-com-pages/single/output_ftl/l16.ftl?warningId="+businessId},
			L17:{id:"L17",title:"企业征信未结清承兑汇票信息",url:"/gbicc-com-pages/single/output_ftl/l17.ftl?warningId="+businessId}
		}
		var halfresult=SingleRulWarning_dataset.getValue("halfresult");
		if(halfresult!=null && halfresult!=""){
			var ids=halfresult.split("|");
			for(var i=0;i<ids.length;i++){
				if(ids[i] && OUTPUT[ids[i]]!=null){
					BusinInfoTab_tabset.add(OUTPUT[ids[i]]);
				}
			}
		}
		
		//查找流程图每一节点变量，初始化页面
		TaskVariable.findTaskVariable(businessId,function(y){
			if(y.pageReadOnly!=null && y.pageReadOnly=="true"){
				$("a[id=btAddCases]").hide();
				$("a[id=btJoinCases]").hide();
				$("a[id=btRiskElim]").hide();
				$("#SingleRulWarningFW").css("height","650px");
				$("#editor_eliminateDesc").css("width","722px");
				$("a[id=btnAgree]").show();
				$("a[id=btnBack]").show();
				SingleRulWarning_dataset.setFieldHidden("eliminateDesc",false);
				SingleRulWarning_dataset.setFieldHidden("opinion",false);
				SingleRulWarning_dataset.setFieldReadOnly("eliminateDesc",true);
			}else{
				$("a[id=btAddCases]").show();
				$("a[id=btJoinCases]").show();
				$("a[id=btRiskElim]").show();
				$("a[id=btnAgree]").hide();
				$("a[id=btnBack]").hide();
				SingleRulWarning_dataset.setFieldHidden("eliminateDesc",true);
				SingleRulWarning_dataset.setFieldHidden("opinion",true);
			}
			subwindow_SingleRulWarningFW.show();
		})
	}
	//窗口关闭事件
	function SingleRulWarningFW_floatWindow_beforeClose(){
		BusinInfoTab_tabset.closeAll();
		return true;
	}
	function SingleRulWarningFW_floatWindow_beforeHide(){
		BusinInfoTab_tabset.closeAll();
		return true;
	}
	var casesWin=null;
	function casesWin_close(){
		casesWin.close();
	}
	function caseWin_and_parWin_close(){
		casesWin.close();
		subwindow_SingleRulWarningFW.close();
		flushCurrentPage();
	}
	//新增案例
	function btAddCases_onClick(){
		var warningId=SingleRulWarning_dataset.getValue("id");
		casesWin=openSubWin("casesWin","新增案例","/gbicc-com-pages/single/ftl/single_rul_cases_add.ftl?warningId="+warningId,"950","500");
	}
	//归入案例
	function btJoinCases_onClick(){
		var warningId=SingleRulWarning_dataset.getValue("id");
		casesWin=openSubWin("casesWin","归入案例","/gbicc-com-pages/single/ftl/single_rul_cases_join.ftl?warningId="+warningId,"950","350");
	}
	//批量归入案例
	var warningIds="";
	function btPiJoinCases_onClick(){
		warningIds="";
		var record=SingleRulWarning_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
			}
			record=record.getNextRecord();
		}
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		if(warningIds.length>0){
			warningIds=warningIds.substring(0,warningIds.length-1);
		}else{
			top.easyMsg.info("请勾选预警任务！");
			warningIds="0";
			return false;
		}
		var casesId=SingleRulBatchCasesSelect_dataset.getValue("id");
		subwindow_PiJoinCasesFW.show(); 
	}
	//批量风险排除
	
	function btPiHandle_onClick(){
		warningIds="";
		var record=SingleRulWarning_dataset.getFirstRecord();
		var records=[];
		var handleOrgFlags=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
				handleOrgFlags.push(record.getValue("handleOrgFlag"));
			}
			record=record.getNextRecord();
		}
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		if(warningIds.length>0){
			warningIds=warningIds.substring(0,warningIds.length-1);
		}else{
			top.easyMsg.info("请勾选预警任务！");
			warningIds="0";
			return false;
		}
		var handleOrgFlag=handleOrgFlags[0];
		for(var i=0;i<handleOrgFlags.length;i++){
			if(handleOrgFlag!=handleOrgFlags[i]){
				top.easyMsg.info("请选择同等级处理机构的预警任务！");
				return false;
			}
		}
		var id=SingleRulWarning_dataset.getValue("id");
		SingleRulWarningElimDesc_dataset.setParameter("id",id);
		subwindow_BatchRiskEliminateFW.show(); 
	}
	//风险排除
	function btRiskElim_onClick(){
		subwindow_RiskEliminateFW.show();
	}
	//提交检查事件
	function btnSubmit_onClickCheck(button){
		var op="riskEliminate";
		var eliminateDesc=SingleRulWarning_dataset.getValue("eliminateDesc");
		if(!eliminateDesc){
			top.easyMsg.info("请填写排除说明！");
			return false;
		}
		SingleRulWarning_dataset.setParameter("op",op);
		var orgId=user_info.orgId;
		var roleId="";
		
		if("00001"==orgId){
			roleId="559";
		}else{
			roleId="561";
		}
		submitWindow=openSubWin("submitWindow","任务发送至","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	//退回检查事件
	function btnBack_onClickCheck(button){
		var op="back";
		SingleRulWarning_dataset.setParameter("op",op);
	}
	//同意检查事件
	function btnAgree_onClickCheck(button){
		var op="agree";
		SingleRulWarning_dataset.setParameter("op",op);
	}
	//取消
	function btCancel_onClick(){
		subwindow_RiskEliminateFW.close();
	}
	function readFinaAnal_onClick(){
		var customerNum =SingleRulWarning_dataset.getValue("fcettypecode");
		var chineseName =SingleRulWarning_dataset.getValue("fcetname");
		var paramMap=new Map();
		paramMap.put("customerNum",customerNum);
		paramMap.put("chineseName",chineseName);
		windows = openSubWin("warninfoWin", "财务分析\t&nbsp;&nbsp;&nbsp;客户编号："+customerNum+"   客户名称："+chineseName, "/gbicc-com-pages/FinanciaAnalysis/ftl/FinanceAnalysis.ftl?customerNum="+customerNum+"&chineseName="+chineseName,"1150","600",false,true,windows_close,true);
		//btHandle.disable(true);
	}
	function readFinaInte_onClick(){
		var customerNum =SingleRulWarning_dataset.getValue("fcettypecode");
		var chineseName =SingleRulWarning_dataset.getValue("fcetname");
		var industryCd =SingleRulWarning_dataset.getValue("pbcIndustryCd");
		windows = openSubWin("warninfoWin", "财务诚信度\t&nbsp;&nbsp;&nbsp;客户编号："+customerNum+"   客户名称："+chineseName,"/gbicc-com-pages/financialIndexAnalsis/ftl/financialIndexAnalsis.ftl?customerNum="+customerNum+"&industryCd="+industryCd,"1150","600",false,true,windows_close,true);
	}
	//添加链接
	function readFundMoni_onClick(){
		var customerNum =SingleRulWarning_dataset.getValue("fcettypecode");
		windows = openSubWin('1',"账户帐页","/gbicc-com-pages/accountpage/ftl/TAccountPage.ftl"+"?customerNum="+customerNum,"1200","700");
	}
	function windows_close(){
		//btHandle.disable(false);
	}
	//提交后关闭页面，刷新表格
	function btnSubmit_postSubmit(button) {
		button.url="#";
		//top.easyMsg.info("操作成功！");
		subwindow_RiskEliminateFW.close();
		subwindow_SingleRulWarningFW.close();
		flushCurrentPage();
	}
	//退回后关闭页面，刷新表格
	function btnBack_postSubmit(button){
		button.url="#";
		top.easyMsg.info("操作成功！");
		subwindow_SingleRulWarningFW.close();
		flushCurrentPage();
	}
	//同意后关闭页面，刷新表格
	function btnAgree_postSubmit(button){
		button.url="#";
		top.easyMsg.info("操作成功！");
		subwindow_SingleRulWarningFW.close();
		flushCurrentPage();
	}
	//刷新当前页
	function flushCurrentPage() {
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	function taskApprovalHistoryTable_onDbClick(){
		btnOpinion_onClick();
	}
	//查看意见
	function btnOpinion_onClick(button){
		subwindow_taskApprovalHistoryFW.show();
	}
	//批量归入案例提交
	function btnBatchSubmit_onClickCheck(){
		if(warningIds=="0"){
			top.easyMsg.info("请选择要归入的预警任务！");
			subwindow_PiJoinCasesFW.close(); 
			return false;
		}
		var id=SingleRulBatchCasesSelect_dataset.getValue("id");
		if(!id){
			top.easyMsg.info("请选择要归入的案例！");
			return false;
		}
		SingleRulBatchCasesSelect_dataset.setParameter("casesId",id);
		SingleRulBatchCasesSelect_dataset.setParameter("warningIds",warningIds);
		SingleRulBatchCasesSelect_dataset.setParameter("op","joinCases");
	}
	function btnBatchSubmit_postSubmit(button){
		button.url="#";
		top.easyMsg.info("操作成功！");
		subwindow_PiJoinCasesFW.close(); 
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	//批量归入案例取消
	function btnBatchCancel_onClick(){
		subwindow_PiJoinCasesFW.close(); 
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	//批量归入案例查询重置
	function btnBatchReset_onClick(button){
		SingleRulBatchCasesSelect_interface_dataset.clearData();
	}
	//选人的下拉列表
	function taskAssignee_DropDown_beforeOpen(dropDown){
		var orgId=user_info.orgId;
		var roleId="";
		if("00001"==orgId){
			roleId="559";
		}else{
			roleId="561";
		}
		subAutoTaskAssignee_DropDownDataset.setParameter("orgId",orgId);
		subAutoTaskAssignee_DropDownDataset.setParameter("roleId",roleId);
		taskAssignee_DropDown.cached=false;//让qGroupId不存入缓存
	}
	//批量风险排除提交
	function btnRiskSubmit_onClickCheck(){
		if(warningIds=="0"){
			top.easyMsg.info("请选择要风险排除的预警任务！");
			subwindow_BatchRiskEliminateFW.close(); 
			return false;
		}
		var eliminateDesc=SingleRulWarningElimDesc_dataset.getValue("eliminateDesc_");
		var taskAssignee=SingleRulWarningElimDesc_dataset.getValue("taskAssignee");
		if(!taskAssignee){
			top.easyMsg.info("请填写风险排除接收人！");
			return false;
		}
		if(eliminateDesc==null ||eliminateDesc==""){
			top.easyMsg.info("请填写风险排除说明！");
			return false;
		}
		SingleRulWarningElimDesc_dataset.setParameter("eliminateDesc",eliminateDesc);
		SingleRulWarningElimDesc_dataset.setParameter("op","riskEliminate");
		SingleRulWarningElimDesc_dataset.setParameter("taskAssignee",taskAssignee);
		SingleRulWarningElimDesc_dataset.setParameter("warningIds",warningIds);
	}
	
	//批量风险排除取消
	function btRiskCancel_onClick(){
		subwindow_BatchRiskEliminateFW.close(); 
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	//批量排除成功
	function btnRiskSubmit_postSubmit(button){
		button.url="#";
		top.easyMsg.info("操作成功！");
		subwindow_BatchRiskEliminateFW.close(); 
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}

	//批量审核同意
	function btPiAgree_onClick(){
		warningIds="";
		var record=SingleRulWarning_dataset.getFirstRecord();
		var records=[];
		var handleOrgFlags=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
				handleOrgFlags.push(record.getValue("handleOrgFlag"));
			}
			record=record.getNextRecord();
		}
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		if(warningIds.length>0){
			warningIds=warningIds.substring(0,warningIds.length-1);
		}else{
			top.easyMsg.info("请勾选预警任务！");
			warningIds="0";
			return false;
		}
		var handleOrgFlag=handleOrgFlags[0];
		for(var i=0;i<handleOrgFlags.length;i++){
			if(handleOrgFlag!=handleOrgFlags[i]){
				top.easyMsg.info("请选择同等级处理机构的预警任务！");
				return false;
			}
		}
		var id=SingleRulWarning_dataset.getValue("id");
		SingleRulWarningElimDesc_dataset.setParameter("id",id);
		subwindow_BatchOpinionFW.show(); 
		SingleRulWarningElimDesc_dataset.setParameter("op","agree");
	}
	//批量审核退回
	function btPiBack_onClick(){
		warningIds="";
		var record=SingleRulWarning_dataset.getFirstRecord();
		var records=[];
		var handleOrgFlags=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
				handleOrgFlags.push(record.getValue("handleOrgFlag"));
			}
			record=record.getNextRecord();
		}
		for(var i=0;i<records.length;i++){
			warningIds=warningIds+records[i].getValue("id")+",";
		}
		if(warningIds.length>0){
			warningIds=warningIds.substring(0,warningIds.length-1);
		}else{
			top.easyMsg.info("请勾选预警任务！");
			warningIds="0";
			return false;
		}
		var handleOrgFlag=handleOrgFlags[0];
		for(var i=0;i<handleOrgFlags.length;i++){
			if(handleOrgFlag!=handleOrgFlags[i]){
				top.easyMsg.info("请选择同等级处理机构的预警任务！");
				return false;
			}
		}
		var id=SingleRulWarning_dataset.getValue("id");
		SingleRulWarningElimDesc_dataset.setParameter("id",id);
		subwindow_BatchOpinionFW.show(); 
		SingleRulWarningElimDesc_dataset.setParameter("op","back");
	}
	//审核提交
	function btnOpinionSubmit_onClickCheck(){
		if(warningIds=="0"){
			top.easyMsg.info("请选择同意的预警任务！");
			subwindow_BatchOpinionFW.close(); 
			return false;
		}
		var opinion=SingleRulWarningElimDesc_dataset.getValue("opinion_");
		if(opinion==null ||opinion==""){
			top.easyMsg.info("请填写审核意见！");
			return false;
		}
		SingleRulWarningElimDesc_dataset.setParameter("opinion",opinion);
		SingleRulWarningElimDesc_dataset.setParameter("warningIds",warningIds);
	}
	//批量审核成功回调
	function btnOpinionSubmit_postSubmit(button){
		button.url="#";
		top.easyMsg.info("操作成功！");
		subwindow_BatchOpinionFW.close(); 
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	function submitFun(userId){
		SingleRulWarning_dataset.setParameter("userId",userId);
		warnTaskSubmit.click();
	}
	function cancelFun(){
		submitWindow.close();
	}
	function submitFun(userId){
		SingleRulWarning_dataset.setParameter("userId",userId);
		warnTaskSubmit.click();
	}
	function warnTaskSubmit_postSubmit(){
		submitWindow.close();
		subwindow_RiskEliminateFW.hide();
		subwindow_SingleRulWarningFW.hide();
		top.easyMsg.info("操作成功！");
		SingleRulWarning_dataset.flushData(SingleRulWarning_dataset.pageIndex);
	}
	
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>