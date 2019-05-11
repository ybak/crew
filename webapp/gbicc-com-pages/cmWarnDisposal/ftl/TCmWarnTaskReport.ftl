<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="Ԥ������  &gt;  �ҵ�����">
<script type='text/javascript' src='${contextPath}/dwr/interface/TCmWarnDisposalAjax.js'> </script>
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
		<td colspan="2">
			<@CommonQueryMacro.DataTable id="datatable1" frozens="20" paginationbar="selectTheTask" fieldStr="taskCode[100],taskType[70],custcode[100],custname[200],warnCunt[70],startType[80],nextStartTaskDate[100]"  width="100%" hasFrame="true"/>
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
function selectTheTask_onClick(button) {
	var taskId = TCmWarnTask_dataset.getValue("id");
	if(taskId){
		
	}else{
		top.easyMsg.info("��ѡ��һ����¼��");
		return;
	}
	top.easyMsg.confirm("�Ƿ�ȷ�Ϸ���������÷�������?", function(){
		TCmWarnDisposalAjax.personStartRC(taskId,function(y){
			 if(y.success=="true"){//
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
				parent.parent.parent.GTab.addTab("warnDisposalWin","�ͻ�Ԥ����������",path+"?taskId="+taskId+"&customerId="+customerId+"&businessId="+taskId);
			 }else{
				 top.easyMsg.info(y.message);
			 }
			   
			
		});
	}, function(){
	    top.easyMsg.info("ȡ��");
	} );
}
	
</script>
</@CommonQueryMacro.page>