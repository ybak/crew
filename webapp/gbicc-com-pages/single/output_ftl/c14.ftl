<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign warningId=RequestParameters["warningId"]?default("")>

<@CommonQueryMacro.page title="����Ȧ��Ϣ">
<table>
	<@CommonQueryMacro.CommonQuery id="C14" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="C14Table" nowrap="true" height="305" readonly="true" fitColumns="false"
		fieldStr="customerNum,gcCustNum[150],gcCustCoreNum[150],gcircleCd,gcCustIdTpCd[150],gcCustIdNum[150],gcCustTpCd" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
</table>
<script>
	//ҳ���ʼ��
	function initCallGetter_post(){
		var warningId='${warningId}';
		C14_dataset.setParameter("warningId",warningId);
	}
</script>
</@CommonQueryMacro.page>