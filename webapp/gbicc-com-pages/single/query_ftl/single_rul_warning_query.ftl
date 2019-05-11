<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="����Ԥ�������ѯ�б�">

<@CommonQueryMacro.CommonQuery id="SingleRulWarningQuery" init="true" submitMode="current">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" showButton="false"  colNm=8/>
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
			<@CommonQueryMacro.DataTable id="SingleRulWarningQueryTable" readonly="false" paginationbar="btnRead"  remoteSort="true" sortable="true"
			fieldStr="rulCode,taskCode,rulName,rulType,warnLevel,fcettypecode,fcetname,warnStatus,mainOrg,warnDt" width="100%" hasFrame="true"/>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script>
	var readWin=null;
	//ҳ���ʼ��
	function initCallGetter_post(){
		
	}
	function SingleRulWarningQueryTable_onDbClick(){
		btnRead_onClick();
	}
	function btnRead_onClick(){
		var businessId=SingleRulWarningQuery_dataset.getValue("id");
		readWin=openSubWin("readWin","������Ԥ���ź���ϸ��Ϣ","/gbicc-com-pages/single/query_ftl/single_rul_warning_read_win.ftl?businessId="+businessId,"1200","700");
	}
	function btnReset_onClick(){
		SingleRulWarningQuery_interface_dataset.clearData();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>