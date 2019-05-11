<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign warningId=RequestParameters["warningId"]?default("")>

<@CommonQueryMacro.page title="关联人信息">
<table>
	<@CommonQueryMacro.CommonQuery id="C13" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="C13Table" nowrap="true" height="305" readonly="true" fitColumns="false"
		fieldStr="customerNum,affiCustIdTpCd,affiCustIdNum,affiCustNum,affiCustCoreNum,affiTpCd,affiCustTpCd" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	//页面初始化
	function initCallGetter_post(){
		var warningId='${warningId}';
		C13_dataset.setParameter("warningId",warningId);
	}
</script>
</@CommonQueryMacro.page>