<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="Ԥ������  &gt;  �ҵ�����">
<table align="left"><tr><td>
<@CommonQueryMacro.CommonQuery id="TCmWarnTask" init="true" submitMode="current">
<table width="100%">
	<tr>
		<td colspan="2" valign="top">
			<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" showButton="false"/>
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
		<td><@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="15" showArrow="true" pageCache="false"/></td>
	</tr>
	<tr>
		<#assign roleId = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getWorkflowRoleId()>
		<td colspan="2">
	 	<#if (roleId == "601")>
			<@CommonQueryMacro.DataTable  frozens="20" id="datatable1" paginationbar="btHandle,perStartDC,perStartRC" fieldStr="taskCode[100],taskType[70],custcode[100],custname[200],warnCunt[70],status[70],taskCreatDate[100],taskMatureDate[100],startType[80],taskOverran[70]"  width="100%" hasFrame="true"/>
		<#else>
			<@CommonQueryMacro.DataTable  frozens="20" id="datatable1" paginationbar="btHandle" fieldStr="taskCode[100],taskType[70],custcode[100],custname[200],warnCunt[70],status[70],taskCreatDate[100],taskMatureDate[100],startType[80],taskOverran[70]"  width="100%" hasFrame="true"/>
		</#if>
		</td>
	</tr>
	<tr>
      	<td colspan="2">
  		</td>
  	</tr>
  		
</table>
</@CommonQueryMacro.CommonQuery>

</td></tr>
</table>
<script language="JavaScript">
//���ò�ѯ����
function btnReset_onClick(button){
	TCmWarnTask_interface_dataset.clearData();
}
var warnDisposalWin;
function warnDisposalWin_close(){
	warnDisposalWin.close();
	TCmWarnTask_dataset.flushData(TCmWarnTask_dataset.pageIndex);
}


function datatable1_onDbClick(){
	btHandle.click();
}

function btHandle_onClick(button) {
	var taskId=TCmWarnTask_dataset.getValue("id");
	if(taskId){
		var customerId=TCmWarnTask_dataset.getValue("customerId");
		var taskType=TCmWarnTask_dataset.getValue("taskType");
		var rptStatus=TCmWarnTask_dataset.getValue("status");
		var startType=TCmWarnTask_dataset.getValue("startType");
		var title="������";
		if(taskType=="RC"){
			title=title+"�����÷�����";
		}else{
			title="��Ԥ�����á�";
		}
		if(rptStatus=="1"||rptStatus=="2"){//���
			title=title+">����ˡ�";
		}else if(rptStatus=="3"){
			title=title+">�����ȷ�ϡ�";
		}
		var path="/gbicc-com-pages/cmWarnDisposal/ftl/warnDisposalWin.ftl";
		if(startType=="1"){//�������������Ϊ�ֹ�
			path="/gbicc-com-pages/cmWarnDisposal/ftl/personWarnDisposalWin.ftl";
		}
	    warnDisposalWin=openSubWin("warnDisposalWin",title,path+"?taskId="+taskId+"&customerId="+customerId+"&businessId="+taskId,"1000","700");
	}else{
		top.easyMsg.info("��ѡ��һ�����ݣ�");
		return false;
	}
}

var selectCustomerWin;
function perStartDC_onClick(button) {
	selectCustomerWin=openSubWin("selectCustomerWin","�˹�����Ԥ����Ԥ���ͻ�","/gbicc-com-pages/cmWarnDisposal/ftl/TCmCustomer.ftl","1000","500");
}
function selectCustomerWin_close(){
	selectCustomerWin.close();
}

var selectWarnTaskWin;
function perStartRC_onClick(button) {
	selectWarnTaskWin=openSubWin("selectWarnTaskWin","�˹������÷������ɷ�������","/gbicc-com-pages/cmWarnDisposal/ftl/TCmWarnTaskReport.ftl?selectType=TCmWarnTaskReport","1000","500");
}
function selectWarnTaskWin_close(){
	selectWarnTaskWin.close();
}
	
</script>
</@CommonQueryMacro.page>