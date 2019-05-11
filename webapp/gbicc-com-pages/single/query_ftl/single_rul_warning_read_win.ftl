<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign businessId=RequestParameters["businessId"]?default("")>

<@CommonQueryMacro.page title="����Ԥ�������ѯ�б�">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="SingleRulWarningQuery" init="true" submitMode="current">
				<@CommonQueryMacro.Group id="SingleRulWarningQueryGroup" label="" colNm=4 labelwidth="150"
				fieldStr="fcettypecode,fcetname,rulCode,rulType,warnStatus,rulName,warnDt,mainOrg,warnDesc,eliminateDesc"/>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.DynamicTabSet id="BusinInfoTab" hasMenu="false" fit="false" height="350" selected="A01">
		    </@CommonQueryMacro.DynamicTabSet>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="false" submitMode="all">
				<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ" expand="false" >
					<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable" paginationbar="btnOpinion"
					fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
					<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="�鿴���" position="center" 
						closure="true" show="false" defaultZoom="normal">
						<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
					</@CommonQueryMacro.FloatWindow>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
</table>
<script>
	var businessId='${businessId}';
	//ҳ���ʼ��
	function initCallGetter_post(){
		SingleRulWarningQuery_dataset.setParameter("id",businessId);
		SingleRulWarningQuery_dataset.flushData(1);
		//�������TABҳ
		var OUTPUT={
			A01:{id:"A01",title:"��������ˮ",url:"/gbicc-com-pages/single/output_ftl/a01.ftl?warningId="+businessId},
			A30:{id:"A30",title:"�鶳�۵Ǽǲ�",url:"/gbicc-com-pages/single/output_ftl/a30.ftl?warningId="+businessId},
			A38:{id:"A38",title:"�жһ�Ʊ��Ϣ",url:"/gbicc-com-pages/single/output_ftl/a38.ftl?warningId="+businessId},
			B01:{id:"B01",title:"��Ȼ�˽����Ϣ",url:"/gbicc-com-pages/single/output_ftl/b01.ftl?warningId="+businessId},
			C01:{id:"C01",title:"�Թ���������ϸ",url:"/gbicc-com-pages/single/output_ftl/c01.ftl?warningId="+businessId},
			C02:{id:"C02",title:"�Թ��������ϸ",url:"/gbicc-com-pages/single/output_ftl/c02.ftl?warningId="+businessId},
			C03:{id:"C03",title:"�Ŵ���ͬ",url:"/gbicc-com-pages/single/output_ftl/c03.ftl?warningId="+businessId},
			C05:{id:"C05",title:"�Թ����ֵǼǲ�",url:"/gbicc-com-pages/single/output_ftl/c05.ftl?warningId="+businessId},
			C06:{id:"C06",title:"�Ŵ�֧��������ϸ",url:"/gbicc-com-pages/single/output_ftl/c06.ftl?warningId="+businessId},
			C08:{id:"C08",title:"�Թ�����Ѻ�����������ˮ",url:"/gbicc-com-pages/single/output_ftl/c08.ftl?warningId="+businessId},
			C09:{id:"C09",title:"Ʊ����Ϣ",url:"/gbicc-com-pages/single/output_ftl/c09.ftl?warningId="+businessId},
			C11:{id:"C11",title:"����������Ϣ",url:"/gbicc-com-pages/single/output_ftl/c11.ftl?warningId="+businessId},
			C12:{id:"C12",title:"����Ʊ����ת��Ϣ",url:"/gbicc-com-pages/single/output_ftl/c12.ftl?warningId="+businessId},
			C13:{id:"C13",title:"��������Ϣ",url:"/gbicc-com-pages/single/output_ftl/c13.ftl?warningId="+businessId},
			C14:{id:"C14",title:"����Ȧ��Ϣ",url:"/gbicc-com-pages/single/output_ftl/c14.ftl?warningId="+businessId},
			C15:{id:"C15",title:"�ͻ�ָ����Ϣ",url:"/gbicc-com-pages/single/output_ftl/c15.ftl?warningId="+businessId},
			C16:{id:"C16",title:"��Ȼ���˻���Ϣ",url:"/gbicc-com-pages/single/output_ftl/c16.ftl?warningId="+businessId},
			J02:{id:"J02",title:"�Թ��ͻ���Ϣ",url:"/gbicc-com-pages/single/output_ftl/j02.ftl?warningId="+businessId},
			J04:{id:"J04",title:"��˽�ͻ���Ϣ",url:"/gbicc-com-pages/single/output_ftl/j04.ftl?warningId="+businessId},
			J09:{id:"J09",title:"Ա����Ϣ",url:"/gbicc-com-pages/single/output_ftl/j09.ftl?warningId="+businessId},
			J16:{id:"J16",title:"�����˻���Ϣ",url:"/gbicc-com-pages/single/output_ftl/j16.ftl?warningId="+businessId},
			J17:{id:"J17",title:"�Ӻ�ͬ��Ϣ",url:"/gbicc-com-pages/single/output_ftl/j17.ftl?warningId="+businessId},
			J18:{id:"J18",title:"�Ŵ���˾�ͻ���Ϣ",url:"/gbicc-com-pages/single/output_ftl/j18.ftl?warningId="+businessId},
			L01:{id:"L01",title:"�ⲿ������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l01.ftl?warningId="+businessId},
			L02:{id:"L02",title:"���̱����ϸ",url:"/gbicc-com-pages/single/output_ftl/l02.ftl?warningId="+businessId},
			L03:{id:"L03",title:"���̴�����ϸ",url:"/gbicc-com-pages/single/output_ftl/l03.ftl?warningId="+businessId},
			L04:{id:"L04",title:"��ͥ������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l04.ftl?warningId="+businessId},
			L05:{id:"L05",title:"�о�������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l05.ftl?warningId="+businessId},
			L11:{id:"L11",title:"��ҵ������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l11.ftl?warningId="+businessId},
			L12:{id:"L12",title:"����������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l12.ftl?warningId="+businessId},
			L13:{id:"L13",title:"�����ļ���Ϣ",url:"/gbicc-com-pages/single/output_ftl/l13.ftl?warningId="+businessId},
			L14:{id:"L14",title:"��������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l14.ftl?warningId="+businessId},
			L15:{id:"L15",title:"���ܺ���Ϣ",url:"/gbicc-com-pages/single/output_ftl/l15.ftl?warningId="+businessId},
			L16:{id:"L16",title:"��ҵ����δ���������Ϣ",url:"/gbicc-com-pages/single/output_ftl/l16.ftl?warningId="+businessId},
			L17:{id:"L17",title:"��ҵ����δ����жһ�Ʊ��Ϣ",url:"/gbicc-com-pages/single/output_ftl/l17.ftl?warningId="+businessId}
		}
		/*
		BusinInfoTab_tabset.add(OUTPUT["A01"]);
		BusinInfoTab_tabset.add(OUTPUT["A30"]);
		BusinInfoTab_tabset.add(OUTPUT["A38"]);
		BusinInfoTab_tabset.add(OUTPUT["C01"]);
		BusinInfoTab_tabset.add(OUTPUT["C02"]);
		BusinInfoTab_tabset.add(OUTPUT["C03"]);
		BusinInfoTab_tabset.add(OUTPUT["C05"]);
		BusinInfoTab_tabset.add(OUTPUT["C06"]);
		BusinInfoTab_tabset.add(OUTPUT["C08"]);
		BusinInfoTab_tabset.add(OUTPUT["C09"]);
		BusinInfoTab_tabset.add(OUTPUT["C11"]);
		BusinInfoTab_tabset.add(OUTPUT["C12"]);
		BusinInfoTab_tabset.add(OUTPUT["C13"]);
		BusinInfoTab_tabset.add(OUTPUT["C14"]);
		BusinInfoTab_tabset.add(OUTPUT["C15"]);
		BusinInfoTab_tabset.add(OUTPUT["C16"]);
		BusinInfoTab_tabset.add(OUTPUT["J02"]);
		BusinInfoTab_tabset.add(OUTPUT["J04"]);
		BusinInfoTab_tabset.add(OUTPUT["J09"]);
		BusinInfoTab_tabset.add(OUTPUT["J16"]);
		BusinInfoTab_tabset.add(OUTPUT["J17"]);
		BusinInfoTab_tabset.add(OUTPUT["J18"]);
		BusinInfoTab_tabset.add(OUTPUT["L01"]);
		BusinInfoTab_tabset.add(OUTPUT["L02"]);
		BusinInfoTab_tabset.add(OUTPUT["L03"]);
		BusinInfoTab_tabset.add(OUTPUT["L04"]);
		BusinInfoTab_tabset.add(OUTPUT["L05"]);
		BusinInfoTab_tabset.add(OUTPUT["L11"]);
		BusinInfoTab_tabset.add(OUTPUT["L12"]);
		BusinInfoTab_tabset.add(OUTPUT["L13"]);
		BusinInfoTab_tabset.add(OUTPUT["L14"]);
		BusinInfoTab_tabset.add(OUTPUT["L15"]);
		BusinInfoTab_tabset.add(OUTPUT["L16"]);
		BusinInfoTab_tabset.add(OUTPUT["L17"]);
		*/
		var halfresult=SingleRulWarningQuery_dataset.getValue("halfresult");
		if(halfresult!=null && halfresult!=""){
			var ids=halfresult.split("|");
			for(var i=0;i<ids.length;i++){
				if(ids[i] && OUTPUT[ids[i]]!=null){
					BusinInfoTab_tabset.add(OUTPUT[ids[i]]);
				}
			}
		}
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.flushData(TaskApprovalHistory_dataset.pageIndex);
	}
	function taskApprovalHistoryTable_onDbClick(){
		btnOpinion_onClick();
	}
	//�鿴���
	function btnOpinion_onClick(button){
		subwindow_taskApprovalHistoryFW.show();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>