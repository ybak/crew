<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="Ԥ���������񴥷�����">
<@CommonQueryMacro.CommonQuery id="TPlTaskRuleTrigAll" init="true" submitMode="current" navigate="false">
			<@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9" showArrow="true" pageCache="false"/>
	    <@CommonQueryMacro.Interface id="interface1" label="�������ѯ����" colNm=6 showButton="false"/>
			<center>
				<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
				<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
			</center>
			<@CommonQueryMacro.DataTable id ="datatable1"  height="560"  paginationbar="rgyjReportUpd"  fieldStr="accId[150],custname,productName[180],loanPeriod[80],operator[100],operBank[150],ruleName[190],ruleRank,ruleType,trigDate,trigType"     readonly="true" width="100%"/></br>
</@CommonQueryMacro.CommonQuery>
<script language="JavaScript">
	//���ò�ѯ����
	function btnReset_onClick(button){
		TPlTaskRuleTrigAll_interface_dataset.clearData();
	}
   //����ȷ��
  	function rgyjReportUpd_onClickCheck(button) {
  	    var accId=TPlTaskRuleTrigAll_dataset.getValue("accId");
  	    var ruleCode=TPlTaskRuleTrigAll_dataset.getValue("ruleCode");
  	    var trigId=TPlTaskRuleTrigAll_dataset.getValue("id");
  	    
  	    DWREngine.setAsync(false);//����ͬ��
  	    if(accId==null){
  	      top.easyMsg.info("��ѡ����Ҫ�˹�����Ԥ�����ñ����ļ�¼��");	             
  	      return false;
  	      
  	    }
  	    bool=true;
  	    //�ж��Ƿ���������
//		TaskVariable.isProcessingByAccid(accId,ruleCode,trigId,function(y){
//			
//		   if(y){
//			  bool=false;	      
//		   }
//		});
//		if(!bool){
//			 top.easyMsg.error("�ü�¼�ѳ���Ԥ�����ñ��沢���������У�");	
//			return false;
//		}else{
			 return confirm("ȷ���Ƿ��˹�����������¼��ӦԤ�����ñ��棿");
//		}
       DWREngine.setAsync(true);		
	}
	//ɾ����ˢ�µ�ǰҳ
	function rgyjReportUpd_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�˹�����Ԥ������ɹ���");
		flushCurrentPage();
	}
	//ˢ�µ�ǰҳ
	function flushCurrentPage() {
		TPlTaskRuleTrigAll_dataset.flushData(TPlTaskRuleTrigAll_dataset.pageIndex);
	}


</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
</@CommonQueryMacro.page>