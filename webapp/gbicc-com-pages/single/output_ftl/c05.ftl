<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign warningId=RequestParameters["warningId"]?default("")>

<@CommonQueryMacro.page title="对公贴现登记簿">
<table>
	<@CommonQueryMacro.CommonQuery id="C05" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="C05Table" nowrap="true" height="305" readonly="true" fitColumns="false"
		fieldStr="id,customerCustno,customerName[150],customerBankNo,customerAccount[150],businessNo,appno,branchId,centralBankflg,draftType,rate,buyDate,innerFlag,payType,payerName,agentName,managerId" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	//页面初始化
	function initCallGetter_post(){
		var warningId='${warningId}';
		C05_dataset.setParameter("warningId",warningId);
	}
</script>
</@CommonQueryMacro.page>