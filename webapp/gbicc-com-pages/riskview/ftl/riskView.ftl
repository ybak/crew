<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign customerNum="${RequestParameters['customerNum']?default('')}" />
<#assign chineseName="${RequestParameters['chineseName']?default('')}" />
<#assign loanCardNum="${RequestParameters['loanCardNum']?default('')}" />
<@CommonQueryMacro.page title="��ǩҳ">
	<@CommonQueryMacro.DynamicTabSet id="demotab" hasMenu="true" height="" selected="t1">
		<@CommonQueryMacro.DynamicTab id="t1" title="���ո���"
			url="/gbicc-com-pages/riskoverview/ftl/riskoverview.ftl?customerNum="+customerNum+"&chineseName="+chineseName>
		</@CommonQueryMacro.DynamicTab>
	</@CommonQueryMacro.DynamicTabSet>
	<script>
		var loanCardNum='${loanCardNum}';
		var customerNum='${customerNum}';
		var chineseName='${chineseName}';
		chineseName=decodeURI(chineseName);
		function initCallGetter_post(){
			try{
				if(loanCardNum==undefined||loanCardNum==null||loanCardNum==""){
					loanCardNum='${Session["loanCardNum"]}';
				}
				if(customerNum==undefined||customerNum==null||customerNum==""){
					customerNum='${Session["customerNum"]}';
				}
			}catch(e){
			}
			demotab_tabset.add({id:"t21",title:"������Ϣ",url:"/gbicc-com-pages/warning_baseinfo/ftl/warning_baseinfo.ftl?customerNum="+customerNum+"&chineseName="+encodeURI(encodeURI(chineseName))});
			demotab_tabset.add({id:"t22",title:"�˻���ҳ",url:"/gbicc-com-pages/accountpage/ftl/TAccountPage.ftl?customerNum="+customerNum+"&chineseName="+encodeURI(encodeURI(chineseName))});
			demotab_tabset.add({id:"t23",title:"������Ϣ",url:"/gbicc-com-pages/FinanciaAnalysis/ftl/FinanceAnalysis.ftl?customerNum="+customerNum+"&chineseName="+chineseName});
			demotab_tabset.add({id:"t24",title:"������Ϣ",url:"/gbicc-com-pages/zxinfo/ftl/zxinfo.ftl?customerNum="+customerNum+"&chineseName="+chineseName+"&loanCardNum="+loanCardNum});
			demotab_tabset.add({id:"t25",title:"������Ϣ",url:"/gbicc-com-pages/relevance/ftl/relevance.ftl?customerNum="+customerNum+"&chineseName="+chineseName});
			demotab_tabset.add({id:"t26",title:"�ⲿ��������",url:"/gbicc-com-pages/externaldata/ftl/externaldata.ftl?customerNum="+customerNum+"&chineseName="+chineseName});
			
			demotab_tabset.select("t1");
		}
	</script>
</@CommonQueryMacro.page>