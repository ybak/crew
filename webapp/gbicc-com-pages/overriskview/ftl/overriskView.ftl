<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign customerNum="${RequestParameters['customerNum']?default('')}" />
<#assign chineseName="${RequestParameters['chineseName']?default('')}" />
<#assign loanCardNum="${RequestParameters['loanCardNum']?default('')}" />
<@CommonQueryMacro.page title="��ǩҳ">
	<@CommonQueryMacro.DynamicTabSet id="demotab1" hasMenu="true" height="" selected="t11">
		<@CommonQueryMacro.DynamicTab id="t11" title="�ͻ����Ԥ���ȼ�"
			url="/gbicc-com-pages/overriskview/ftl/overview1.ftl">
		</@CommonQueryMacro.DynamicTab>
		</@CommonQueryMacro.DynamicTabSet>
	<script>
		var loanCardNum='${loanCardNum}';
		var customerNum='${customerNum}';
		var chineseName='${chineseName}';
		chineseName=decodeURI(chineseName);
		function initCallGetter_post(){
			demotab1_tabset.add({id:"t211",title:"�����ͻ�����ͳ�Ʒ���",url:"/gbicc-com-pages/overriskview/ftl/overview2.ftl"});

			
			demotab1_tabset.select("t11");
			
		}
	</script>
</@CommonQueryMacro.page>