<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="�ҵĹ���̨">
<@CommonQueryMacro.DynamicTabSet id="resourceMonitor_tabs" hasMenu="false" height="400px" selected="sysTab">
	<@CommonQueryMacro.DynamicTab id="dbgzTab" title="����Ԥ������" url="/gbicc-com-pages/single/ftl/single_rul_warning_task_desk_2.ftl">
	</@CommonQueryMacro.DynamicTab>
	<@CommonQueryMacro.DynamicTab id="gzpcTab" title="����Э������" url="/gbicc-com-pages/single/ftl/single_rul_investigation_task_desk.ftl">
	</@CommonQueryMacro.DynamicTab>
</@CommonQueryMacro.DynamicTabSet>
 <script>
 GTab = parent.GTab;
 var ajMonitorReportWin;
 function p_openSubWin(id,title,reportUrl,businessId,rptStatus){
    ajMonitorReportWin = openSubWin(id,title,reportUrl+"?businessId="+businessId+"&rptStatus="+rptStatus,"1000","700");
 }
 function p_closeSubWin(){
    ajMonitorReportWin.close();
 }
 </script>
</@CommonQueryMacro.page>