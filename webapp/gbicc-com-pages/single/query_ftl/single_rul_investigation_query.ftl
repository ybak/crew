<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="Э�������ѯ">
<@CommonQueryMacro.CommonQuery id="SingleRulInvestigationQuery" init="true" submitMode="current">
	<table>
		<tr>
			<td>
				<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" showButton="false" labelwidth="100" colNm=8/>
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
			<td>
				<@CommonQueryMacro.DataTable id="SingleRulInvestigationQueryTable" readonly="false" paginationbar="btn_Read" remoteSort="true" sortable="true"
				fieldStr="inveCode[100],inveName[100],matureDt[100],inveFeedDt[100],inveOrgName[150],status[100],inveConc[200],inveUserId[100],inveUser[100],inveNumb[100]" width="100%" hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script>
	function SingleRulInvestigationQueryTable_onDbClick(){
		btn_Read_onClick();
	}
	function btn_Read_onClick(){
		var casesId=SingleRulInvestigationQuery_dataset.getValue("casesId");
		var inveId=SingleRulInvestigationQuery_dataset.getValue("id");
		var warningIds="";
		InveRelWarning.dwrFindWarningIds(inveId,function(y){
			if(y.length>0){
				for(var i=0;i<y.length;i++){
					warningIds=warningIds+y[i]+",";
				}
			}else{
				warningIds="0";
			}
			openInvestigationWin(casesId,warningIds,inveId,"read");
		});
	}
	var investigationWin=null;
	function investigationWin_close(){
		investigationWin.close();
		flushCurrentPage();
	}
	//������Э�鴰��
	function openInvestigationWin(casesId,warningIds,inveId,oper){
		investigationWin=openSubWin("investigationWin","����Э��","/gbicc-com-pages/single/ftl/single_rul_investigation.ftl?casesId="+casesId+"&warningIds="+warningIds+"&inveId="+inveId+"&oper="+oper,"950","700");
	}
	function btnReset_onClick(){
		SingleRulInvestigationQuery_interface_dataset.clearData();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/InveRelWarning.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>