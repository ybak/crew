<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="���չ���  &gt;  �ҵ�����">
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<table align="left"><tr><td>
<@CommonQueryMacro.CommonQuery id="TCollectionInfo" init="true" submitMode="current">
<table width="100%">
	<tr>
		<td colspan="2" valign="top">
			<@CommonQueryMacro.Interface id="interface" label="�������ѯ����"  showButton="false"/>
		</td>
	</tr>
	<tr>
		<td>
			<center>
				<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
				<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
			</center>
		</td>
	</tr>
	
	<tr>
		<td><@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="15" showArrow="true" pageCache="false"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<@CommonQueryMacro.DataTable id="datatable1"  frozens="20" paginationbar="registInfoBtn" fieldStr="loanAccount[120],custCode[100],custName[60],productName[140],riskStatus[70],loanBalance[70],arrearAmt[70],arrearInterests[70],arrearCount[80],matureDate[90],collectionType[140],status[60]"  width="100%" hasFrame="true"/>
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
		TCollectionInfo_interface_dataset.clearData();
	}
	//��λһ�м�¼
	function locate(id) {
		var record = TCollectionInfo_dataset.find(["id"],[id]);
		if(record) {
			TCollectionInfo_dataset.setRecord(record);
		}
	}
	
	 function btCancel_onClickCheck(button){
	     jobschedulermanage_dataset.cancelRecord();
	     subwindow_detailFW.close();
	  }  
	var tCollectionInfoWin;
	var tCollectionInfoCheckWin;
	function registInfoBtn_onClick(button) {
		var businessId=TCollectionInfo_dataset.getValue("id");
		if(businessId){
			TaskVariable.findTaskVariable(businessId,function(y){
				var title="���";
					var custName=TCollectionInfo_dataset.getValue("custName");
					var loanAccount=TCollectionInfo_dataset.getValue("loanAccount");
				if(y.nowRoleName=="ejzhhz"){
					title="���";
					//tCollectionInfoCheckWin=openSubWin("TCollectionInfoCheckWin",title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoCheckWin.ftl?id="+businessId,"1000","700");
					//tCollectionInfoWin=openSubWin("TCollectionInfoWin",title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoWin.ftl?id="+businessId+"&businessId="+businessId,"1000","700");
					parent.parent.GTab.addTab('ajMonitorReportWin',title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoWin.ftl?id="+businessId+"&businessId="+businessId);
				}else{
					title="���յǼ�";
					//tCollectionInfoWin=openSubWin("TCollectionInfoWin",title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoWin.ftl?queryType=registBtn&id="+businessId+"&businessId="+businessId,"1000","700");
					parent.parent.GTab.addTab('ajMonitorReportWin',title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoWin.ftl?queryType=registBtn&id="+businessId+"&businessId="+businessId);
				}
				
			});
		
		}else{
			top.easyMsg.info("��ѡ��һ�У�");
		}
	}
	function datatable1_onDbClick(){
		registInfoBtn.click();
	}

	function checkBtn_onClick(button) {
		
		var businessId=TCollectionInfo_dataset.getValue("id");
		var custName=TCollectionInfo_dataset.getValue("custName");
		var title="���";
		//tCollectionInfoCheckWin=openSubWin("TCollectionInfoWin",title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoCheckWin.ftl?id="+businessId,"1000","700");
		parent.parent.GTab.addTab('ajMonitorReportWin',title,"/gbicc-pages/collectionManage/ftl/TCollectionInfoWin.ftl?id="+businessId+"&businessId="+businessId);
	}
	
	//ˢ�µ�ǰҳ
	function flushCurrentPage() {
		TCollectionInfo_dataset.flushData(TCollectionInfo_dataset.pageIndex);
	}
	
</script>
</@CommonQueryMacro.page>