<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign warningId=RequestParameters["warningId"]?default("")>

<@CommonQueryMacro.page title="企业征信信息">
<table>
	<@CommonQueryMacro.CommonQuery id="L11" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="L11Table" nowrap="true" height="305" readonly="true" fitColumns="false"
		fieldStr="fdNosettTbal[200],fdNosettTnum[200],fdNosettGzTbal[200],fdNosettGzTnum[200],fdNosettTloanbal[200],fdNosettTloannum[200],fdNosettBlTbal[200],fdNosettBlTnum[200],fdNosettBlTloanbal[200],fdNosettBlTloannum[200],fdSettGzTnum[230],fdSettTnum[230],fdSettTloannum[230],fdSettGzTloannum[230],fdSettBlTnum[230],fdSettBlTloannum[230],fdHisBlTnum[230],fdHisBlTloannum[230],fdGuatTnum[160],fdGuatTamt[160],fdGuatGzTbal[200],fdGuatBlTbal[200],fdLoancardno[100],fdRegistAmt,fdCapitalCent,fdCapitalAvg,fdCapitalNum" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	//页面初始化
	function initCallGetter_post(){
		var warningId='${warningId}';
		L11_dataset.setParameter("warningId",warningId);
	}
</script>
</@CommonQueryMacro.page>