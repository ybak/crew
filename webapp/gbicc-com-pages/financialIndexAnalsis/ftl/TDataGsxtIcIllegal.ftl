<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign typeId="${RequestParameters['typeId']?default('')}" />
<#assign fdDate="${RequestParameters['fdDate']?default('')}" />
<#assign customerNum="${RequestParameters['customerNum']?default('')}" />
<@CommonQueryMacro.page title="��������Υ��">
<@CommonQueryMacro.CommonQuery id="TDataGsxtIcIllegal" init="false" submitMode="selected" navigate="false">

<table align="left" width="100%">
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="companyName,registorNo,legalName,certNo,fdInIllegalReson,fdInIllegalDate,fdOutIllegalReson,fdOutIllegalDate,fdDecisionOrg,enterStatus,busstartDate,busendDate,busscope,registorAmt,enterOrg,address,checkDate,shareHolder"  readonly="true" width="100%"/></br>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var customerNum='${customerNum}';
function initCallGetter_post(){
	var typeId='${typeId}';
	var fdDate='${fdDate}';
	TDataGsxtIcIllegal_dataset.setParameter("typeid",typeId);
	TDataGsxtIcIllegal_dataset.setParameter("data",fdDate);
	TDataGsxtIcIllegal_dataset.setParameter("relaId",customerNum);
	TDataGsxtIcIllegal_dataset.flushData();
}

function datatable1_fdinillegalreson_onRefresh(cell,value,record){
	if (record) {//�����ڼ�¼ʱ
		var id=record.getValue("id");
		if(!!id){
			cell.innerHTML='<a href="JavaScript:aclick(\''+record.getValue("id")+'\',\'fdinillegalreson\')">�鿴��ϸ����</a>';
		}
	}
}

function datatable1_fdoutillegalreson_onRefresh(cell,value,record){
	if (record) {//�����ڼ�¼ʱ
		var id=record.getValue("id");
		if(!!id){
			cell.innerHTML='<a href="JavaScript:aclick(\''+record.getValue("id")+'\',\'fdoutillegalreson\')">�鿴��ϸ����</a>';
		}
	}
}

function datatable1_busscope_onRefresh(cell,value,record){
	if (record) {//�����ڼ�¼ʱ
		var id=record.getValue("id");
		if(!!id){
			cell.innerHTML='<a href="JavaScript:aclick(\''+record.getValue("id")+'\',\'fdbusinessscope\')">�鿴��ϸ����</a>';
		}
	}
}

function aclick(id,type){
	if(type&&type=='fdinillegalreson'){
		contentWin=openSubWin('fdInIllegalReson','��ϸ����','/gbicc-com-pages/financialIndexAnalsis/ftl/fdInIllegalReson.ftl?id='+id+"&type="+type,800,600);
	}else if(type&&type=='fdoutillegalreson'){
		contentWin=openSubWin('fdOutIllegalReson','��ϸ����','/gbicc-com-pages/financialIndexAnalsis/ftl/fdOutIllegalReson.ftl?id='+id+"&type="+type,800,600);
	}else if(type&&type=='fdbusinessscope'){
		contentWin=openSubWin('TDataGsxtIcIllegalscop','��ϸ����','/gbicc-com-pages/financialIndexAnalsis/ftl/TDataGsxtIcIllegalscop.ftl?id='+id+"&type="+type,800,600);
	}
}

</script>
</@CommonQueryMacro.page>