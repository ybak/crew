<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign warningId=RequestParameters["warningId"]?default("")>

<@CommonQueryMacro.page title="电子票据流转信息">
<table>
	<@CommonQueryMacro.CommonQuery id="C12" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="C12Table" nowrap="true" height="305" readonly="true" fitColumns="false"
		fieldStr="electricDraftId[200],msgType,reqName[200],reqBrchCode[120],reqAccount[120],reqBankId[120],rcvName[200],rcvBrchCode[120],rcvAccount[150],rcvBankId,signDate,onlStlmFlag,transferFlag,rate,amount,discountType,reqDate,promptPayAmt,rejectCode,rejectInfo,overdueReason,lastUpdTxnOprid" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	//页面初始化
	function initCallGetter_post(){
		var warningId='${warningId}';
		C12_dataset.setParameter("warningId",warningId);
	}
</script>
</@CommonQueryMacro.page>