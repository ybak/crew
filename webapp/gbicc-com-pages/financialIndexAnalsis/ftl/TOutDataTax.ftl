<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign typeId="${RequestParameters['typeId']?default('')}" />
<#assign fdDate="${RequestParameters['fdDate']?default('')}" />
<#assign customerNum="${RequestParameters['customerNum']?default('')}" />
<@CommonQueryMacro.page title="˰��">
<@CommonQueryMacro.CommonQuery id="TOutDataTax" init="true" submitMode="selected" navigate="false">

<table align="left" width="100%">
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="paytexUser,paytexDistcode,orgcode,registorAddress,legalName,mainName,secondmName,caseType,itemContent,rowDate" readonly="true" width="100%"/></br>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var customerNum='${customerNum}';
function initCallGetter_post(){
	var typeId='${typeId}';
	var fdDate='${fdDate}';
	TOutDataTax_dataset.setParameter("typeid",typeId);
	TOutDataTax_dataset.setParameter("data",fdDate);
	TOutDataTax_dataset.setParameter("relaId",customerNum);
	TOutDataTax_dataset.flushData();
}
</script>
</@CommonQueryMacro.page>
