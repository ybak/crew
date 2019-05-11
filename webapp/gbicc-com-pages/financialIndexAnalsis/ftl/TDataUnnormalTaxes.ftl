<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign typeId="${RequestParameters['typeId']?default('')}" />
<#assign fdDate="${RequestParameters['fdDate']?default('')}" />
<#assign customerNum="${RequestParameters['customerNum']?default('')}" />
<@CommonQueryMacro.page title="˰��">
<@CommonQueryMacro.CommonQuery id="TDataUnnormalTaxes" init="true" submitMode="selected" navigate="false">

<table align="left" width="100%">
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="mngOrg,distcode,companyName,legalName,legalCertNo,decideDate,fdIdCard,fdIdCardNum,busAddress,rowDate" readonly="true" width="100%"/></br>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
var customerNum='${customerNum}';
function initCallGetter_post(){
	var typeId='${typeId}';
	var fdDate='${fdDate}';
	TDataUnnormalTaxes_dataset.setParameter("typeid",typeId);
	TDataUnnormalTaxes_dataset.setParameter("data",fdDate);
	TDataUnnormalTaxes_dataset.setParameter("relaId",customerNum);
	TDataUnnormalTaxes_dataset.flushData();
}
</script>
</@CommonQueryMacro.page>
