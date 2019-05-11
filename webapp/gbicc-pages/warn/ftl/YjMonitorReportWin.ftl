<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>


<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign businessId=RequestParameters["businessId"]?default("")>
<#assign rptStatus=RequestParameters["rptStatus"]?default("")>
<#assign pageReadOnly=RequestParameters["pageReadOnly"]?default('0')>
<@CommonQueryMacro.page title="����Ԥ�����ü�ر���">
<script type="text/javascript" src="${contextPath}/gbicc-pages/regular/comm/common.js"></script>


	<table>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="YjMonitorReportWin" init="true" submitMode="current">
					<@CommonQueryMacro.GroupBox id="box1" label="���������Ϣ">
						<@CommonQueryMacro.Group id="group1" label="" colNm=4
						fieldStr="fdLoanAccount,fdCustCode,fdCustName,fdIndustry,custPhone,custAddress,fdProductName,fdLoanAmt,fdLoanBalance,fdGuarWay,fdSlidingScales,fdAcctStatus,fdRiskClass,fdVisitWay,fdVisitAdd,fdLeadInvestigator,fdAssInvestigator,fdSurveyDate"/>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="plWarnSignal" init="true" submitMode="all">	

					<@CommonQueryMacro.GroupBox id="box2" label="Ԥ���ź��봦�ô�ʩ">
			
						<@CommonQueryMacro.DataTable id="warnSignalTable" paginationbar="warnSignalUpd" pagination="true" 
			             fieldStr="warnCode,affPerDesc,warnLEvel,checkStatus,checkDesc" width="100%" hasFrame="true"/>
							<@CommonQueryMacro.FloatWindow id="warnSignalFW" modal="true" label="Ԥ�����"  position="top"
							resize="true" minimize="false" maximize="true" closure="true" show="false" defaultZoom="normal">
								<@CommonQueryMacro.Group id="group2" label="" colNm=2
								fieldStr="warnCode,affPerDesc,warnLEvel,checkStatus,checkDesc"/>
								<center>
								<@CommonQueryMacro.Button id="warnSignalConfirm" />
								</center>
					       </@CommonQueryMacro.FloatWindow>	
									
		           </@CommonQueryMacro.GroupBox>
</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>

		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="YjMonitorReportWin" init="true" submitMode="current">		
				<@CommonQueryMacro.GroupBox id="box3" label="���ƴ�ʩ">
				
				<@CommonQueryMacro.Group id="group3_1" label="���տ��ƴ�ʩ" colNm=2 labelwidth="350"
						fieldStr="fdCreLimconMeasures,fdOtherConMeasures,fdOtherConMeasuresDesc,tempEmpty,tempEmpty"/>
				<@CommonQueryMacro.Group id="group3_2" label="" colNm=4 labelwidth="350"
						fieldStr="fdAddConMeasures,frequency,tempEmpty,tempEmpty"/>						
				</@CommonQueryMacro.GroupBox>
				
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td>
			<@CommonQueryMacro.CommonQuery id="YjMonitorReportWin"  init="true" submitMode="current">		
				<@CommonQueryMacro.GroupBox id="box3_1" label="���">
				
				<@CommonQueryMacro.Group id="group3_1_1" labelwidth="350" label="" colNm=4
						fieldStr="fdApplyOpin,tempEmpty,tempEmpty,tempEmpty"/>						
				</@CommonQueryMacro.GroupBox>
				
			</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td><@CommonQueryMacro.CommonQuery id="YjMonitorReportWin" init="true" submitMode="current">	
					
					<@CommonQueryMacro.GroupBox id="box5" label="���ƴ�ʩ���ʱ��">
							<@CommonQueryMacro.Group id="group5" label="" colNm=2
							fieldStr="fdCompleteDate"/>
					</@CommonQueryMacro.GroupBox>

				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
	<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="TaskApprovalHistory" init="true" submitMode="all">
					<@CommonQueryMacro.GroupBox id="taskApprovalHistoryBox" label="������ʷ">
						<@CommonQueryMacro.DataTable id="taskApprovalHistoryTable" paginationbar="btnOpinion"
						fieldStr="taskName,assignee,startTime,endTime,operation,opinionGrid" width="100%" hasFrame="true"/>
						<@CommonQueryMacro.FloatWindow id="taskApprovalHistoryFW" modal="true" label="�鿴���" position="top" 
							closure="true" show="false" defaultZoom="normal">
							<@CommonQueryMacro.Group id="taskApprovalHistoryGroup" label="" colNm=4 fieldStr="opinion"/>
						</@CommonQueryMacro.FloatWindow>
					</@CommonQueryMacro.GroupBox>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>	
		<tr>
		<td><@CommonQueryMacro.CommonQuery id="YjMonitorReportWin" init="true" submitMode="current">	
				
			<center>
			<@CommonQueryMacro.Button id="yjReportUpd" />	
			<@CommonQueryMacro.Button id="yjReportSubmit" />	
			<@CommonQueryMacro.Button id="yjReportSubmitTrue" />	
			<@CommonQueryMacro.Button id="yjReportBack" />	
			<@CommonQueryMacro.Button id= "contractBtn" />
			</center>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	</table>
<script>
    var submitWindow=null;  
    var ctrlMeasReadOnly='true';
   
    //ҳ���ʼ��
	function initCallGetter_post(){
	
		var businessId='${businessId}';
		var rptStatus='${rptStatus}';
		var pageReadOnly='${pageReadOnly}';
		
		YjMonitorReportWin_dataset.setParameter("businessId",businessId);
		plWarnSignal_dataset.setParameter("businessId",businessId);
		TaskApprovalHistory_dataset.setParameter("businessId",businessId);
		
		//�ж��Ƿ���Դ������� ����ֻ��pageReadOnly=1
		if(pageReadOnly=='1'){
			//����ҳ��ֻ��
			setPageReadOnlyFun();
			$("a[id=yjReportBack]").hide();	//�����˻ذ�ť
			$("a[id=yjReportUpd]").hide();	//���ر��水ť
			$("a[id=yjReportSubmit]").hide();	//�����ύ��ť
			//$("a[id=contractBtn]").hide();	//���ش�ӡ��ť
			$("a[id=warnSignalUpd]").hide();	//���ز�֤��ť
			//����ҳ��ֻ��
			 $("fieldset[name=box3_1]").hide(); //����������
			
		}
		if(YjMonitorReportWin_dataset.getValue('fdVisitWay')=="0"){
			YjMonitorReportWin_dataset.setFieldRequired("fdVisitAdd",false);
		}else{
			YjMonitorReportWin_dataset.setFieldRequired("fdVisitAdd",true);
		}
		//������ʵ�ύ��ť
		$("a[id=yjReportSubmitTrue]").hide();
		
		
		TaskVariable.findTaskVariable(businessId,function(y){
		  if(y.pageReadOnly!=null&&y.pageReadOnly=="true"){
			//����ҳ��ֻ��
			setPageReadOnlyFun();			
		  }
		   if(y.backBtn!=null&&y.backBtn=="hide"){
		    $("a[id=yjReportBack]").hide();	//�����˻ذ�ť	  		      
		  }
		  if(y.ctrlMeas!=null&&y.ctrlMeas=="hide"){
		  $("fieldset[name=box3]").hide();//���ؿ��ƴ�ʩGroupBox
		  }
		  if(y.ctrlMeasReadOnly!=null&&(y.ctrlMeasReadOnly=="false")&&pageReadOnly!='1'){//���ƴ�ʩ��д
			ctrlMeasReadOnly='false';
		    var editFields=["fdCreLimconMeasures","fdOtherConMeasures","fdOtherConMeasuresDesc","fdAddConMeasures","frequency"];
		    setPageCanWriteFun(editFields);		
		   // YjMonitorReportWin_dataset.setFieldHidden("frequency",true);//Ĭ�����ؼ��Ƶ��
		    YjMonitorReportWin_dataset.setFieldHidden("fdOtherConMeasuresDesc",true);
		  }
//		   if(y.ctrlOpinion!=null&&y.ctrlOpinion=="hide"){
//		    $("fieldset[name=box3_1]").hide(); //����������		      		   
//		  }
//		   if(y.ctrlOpinReadOnly!=null&&y.ctrlOpinReadOnly=="false"){
		    var editFields=["fdApplyOpin"];
		    setPageCanWriteFun(editFields);	
//		  }
		     
		  if((y.measDate==null||y.measDate=="hide")&&pageReadOnly!='1'){			 
		      $("fieldset[name=box5]").hide();//���� ��ʩ��ɴ�ʩ
		  }else  if((y.length==undefined)&&(pageReadOnly=='1')){
			
			  $("fieldset[name=box5]").show();//���� ��ʩ��ɴ�ʩ
		  }else {
		     var editFields=["fdCompleteDate"];
		     YjMonitorReportWin_dataset.setFieldRequired("fdCompleteDate",true);
		    setPageCanWriteFun(editFields);	
		  }
		  //Ϊ����д���Ӻ�ɫ�Ǻž�ʾ
		  $("#fldlabel_fdApplyOpin").html($("#fldlabel_fdApplyOpin").text()+"<span style='color:red;'>*</span>");
		  var warnCode=plWarnSignal_dataset.getValue("warnCode");//Ԥ���ź� 
		  warnCode=$.trim(warnCode);
		  
		  if(warnCode.length>0){
			  $("#fldlabel_checkStatus").html($("#fldlabel_checkStatus").text()+"<span style='color:red;'>*</span>"); 
		  }
		 

		  
		
		});
		
		//��ѯ ���ƴ�ʩ
				MonitorReportCtrl.dwrFindCtrl(businessId,function(y){					       
									if(y && y.length>0){
										var apdCtrl="";
										for(var i=0;i<y.length;i++){
											var obj=eval("("+y[i]+")");
											if(obj.ctrlType=="1"){
												YjMonitorReportWin_dataset.setValue("fdCreLimconMeasures",obj.conmeasCode);
											}else if(obj.ctrlType=="2"){
												YjMonitorReportWin_dataset.setValue("fdOtherConMeasures",obj.conmeasCode);
												YjMonitorReportWin_dataset.setValue("fdOtherConMeasuresDesc",obj.otherCtrlDesc);
											}else if(obj.ctrlType=="3"){
												apdCtrl=apdCtrl+obj.conmeasCode+",";
											}
										}
										if(apdCtrl!=""){
											apdCtrl=apdCtrl.substring(0,apdCtrl.length-1);
										}
										YjMonitorReportWin_dataset.setValue("fdAddConMeasures",apdCtrl);
									}
								});
				//�жϼ��Ƶ���Ƿ�Ϊ�� ��Ϊ������ʾ
				var frequency=$.trim(YjMonitorReportWin_dataset.getValue("frequency"));
				
//	        	if(frequency.length>0){
//	        		YjMonitorReportWin_dataset.setFieldHidden("frequency",false);
//	        	}else{
//	        		YjMonitorReportWin_dataset.setFieldHidden("frequency",true);
//	        	}
	        	
				var  fdOtherConMeasures= YjMonitorReportWin_dataset.getValue("fdOtherConMeasures");
				
	        	if( fdOtherConMeasures &&  fdOtherConMeasures!="" &&  fdOtherConMeasures.indexOf("SS")>-1){
					  YjMonitorReportWin_dataset.setFieldHidden("fdOtherConMeasuresDesc",false);
			    	}
	
	        	
				MonitorReportCtrl.dwrFindFrequency(businessId,function(y){	
					if(y){		
						
						YjMonitorReportWin_dataset.setValue("frequency",y[0]);
						YjMonitorReportWin_dataset.setValue("frequencyName",y[1]);
						if(frequency.length>0){
							YjMonitorReportWin_dataset.setFieldHidden("frequency",false);
						}else{
							YjMonitorReportWin_dataset.setFieldHidden("frequency",true);
						}
						
						
					}
				});
		
		
	
		
	}
	
	function YjMonitorReportWin_dataset_onSetValue(ds,curretField,val){
//		console.log("curretField.name----��"+curretField.name);
		 if(curretField.name=='fdaddconmeasures'){
			appendCtrl_selectedFun(val);
		}else if(curretField.name=='fdotherconmeasures'){
//			console.log("2222");
			fdOtherConMeasures_selectedFun(val);
		}
		return val;
	}
	function appendCtrl_selectedFun(val){
		
		var frequency=YjMonitorReportWin_dataset.getValue("frequency");
		
		frequency=$.trim(frequency);
//		console.log("frequency---"+frequency);
		if(val && val!="" && val.indexOf("1")==0){
			YjMonitorReportWin_dataset.setFieldHidden("frequency",false);
			if(frequency==""){
				YjMonitorReportWin_dataset.setValue("frequency","0.5");
				YjMonitorReportWin_dataset.setValue("frequencyName","0.5��");
			}			
		}else{
			YjMonitorReportWin_dataset.setFieldHidden("frequency",true);
			YjMonitorReportWin_dataset.setValue("frequency",null);
			YjMonitorReportWin_dataset.setValue("frequencyName",null);
		}
	}
	function  fdOtherConMeasures_selectedFun(val){
//		console.log("fdOtherConMeasures_selectedFun___>"+val);
		if(val && val!="" && val.indexOf("SS")>-1){
			 YjMonitorReportWin_dataset.setFieldHidden("fdOtherConMeasuresDesc",false);
		}else{
			 YjMonitorReportWin_dataset.setFieldHidden("fdOtherConMeasuresDesc",true);
			 YjMonitorReportWin_dataset.setValue("fdOtherConMeasuresDesc",null);
		}
	}
	function frequency_DropDown_beforeOpen(dropDown){
		var businessId='${businessId}';
		subAutoDataDic_DropDownDataset.setParameter("businessId",businessId);
		subAutoDataDic_DropDownDataset.setParameter("dicCode",703);
		frequency_DropDown.cached=false;//��qGroupId�����뻺��
	}
	//����ҳ�������ֶ�ֻ��
	function setPageReadOnlyFun(){
		 warnSignalUpd.disable(true);
		 //warnSignalDel.disable(true);
		var fieldName="";
		for(var i=0;i<YjMonitorReportWin_dataset.fields.length;i++){
			fieldName=YjMonitorReportWin_dataset.fields[i].name;
			if(fieldName.substring(0,1)!="_"){				
				YjMonitorReportWin_dataset.setFieldReadOnly(fieldName,true);
			}
		}
	}
	//����ҳ���ֶο�д
	function setPageCanWriteFun(editFields){
		for(var i=0;i<editFields.length;i++){
			YjMonitorReportWin_dataset.setFieldReadOnly(editFields[i],false);
		}
	}
	function YjMonitorReportWin_dataset_afterChange(dataset,field){
		if(field.fieldName=='fdVisitWay'){
			if(YjMonitorReportWin_dataset.getValue('fdVisitWay')=="0"){
				YjMonitorReportWin_dataset.setFieldRequired("fdVisitAdd",false);
			}else{
				YjMonitorReportWin_dataset.setFieldRequired("fdVisitAdd",true);
			}
			
		}
	}	
	
		//�ύ��ť�ύ����¼�
	function yjReportSubmit_onClick(button){
//		var rptStatus='${rptStatus}';
//		var op="submit";
//		var fdOtherConMeasures;
//		var fdOtherConMeasuresDesc;
//		//������֤
//		//submitCheck();
//		
//		
//		
//		YjMonitorReportWin_dataset.setParameter("op",op);
		var orgId=user_info.orgId;
		var roleId="";
		var businessId='${businessId}';
		var fdApplyOpin=YjMonitorReportWin_dataset.getValue("fdApplyOpin");//���
		var checkStatus=plWarnSignal_dataset.getValue("checkStatus");//��֤���
		var warnCode=plWarnSignal_dataset.getValue("warnCode");//Ԥ���ź� 
		warnCode=$.trim(warnCode);
		//console.log("warnCode--->"+warnCode.length);
		var fdCreLimconMeasures=YjMonitorReportWin_dataset.getValue("fdCreLimconMeasures");//���Ŷ��
		var fdOtherConMeasures=YjMonitorReportWin_dataset.getValue("fdOtherConMeasures");//�������ƴ�ʩ
		var fdAddConMeasures=YjMonitorReportWin_dataset.getValue("fdAddConMeasures");//���ӿ��ƴ�ʩ
		if(fdApplyOpin==""){
			top.easyMsg.info("������д�����");
			return false;
		}else if(checkStatus==""&&warnCode.length>0){
			top.easyMsg.info("����ѡ��Ԥ���źš��в�֤�����");
			return false;
		}
		
		TaskVariable.findTaskVariable(businessId,function(y){			
			if(y && y.nextRole&&(ctrlMeasReadOnly=='true'||ctrlMeasReadOnly=='false'&&(fdCreLimconMeasures!=""||fdOtherConMeasures!=""||fdAddConMeasures!=""))){//��ȡ����ɫID�ң�����ʾ���ƴ�ʩ����ʾ���Ǳ���һ����ƴ�ʩ��Ϊ�գ� �򿪴��ڡ�
				submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+y.nextRole,"600","400");
			}else{//��ȡ������ֱ���ύ
				yjReportSubmitTrue.click();
			}
		});
	}
	//------����ѡ�� ��һ������start
	//ȡ��
	function cancelFun(){
		YjMonitorReportWin_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		YjMonitorReportWin_dataset.setParameter("taskAssignee",taskAssignee);
		yjReportSubmitTrue.click();
	}
	function yjReportSubmitTrue_onClickCheck(button){
		var op="submit";
		YjMonitorReportWin_dataset.setParameter("op",op);
	}
	function yjReportSubmitTrue_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		top.easyMsg.info("�ύ�ɹ���");
		if(parent.parent.GTab){
			parent.parent.GTab.closeTab();
		}
		if(window && window.parent){
			window.parent.ajMonitorReportWin_close();
		}
	}

	
	//--------����ѡ�� ��һ������end
	
	//�˻ذ�ť�ύ����¼�
	function yjReportBack_onClickCheck(button){
		var rptStatus='${rptStatus}';
		var op="back";	
		var fdApplyOpin=YjMonitorReportWin_dataset.getValue("fdApplyOpin");
		if(fdApplyOpin==""){
			top.easyMsg.info("������д�����");
			return false;
		}
		YjMonitorReportWin_dataset.setParameter("op",op);
	}
	

	
	//function warnSignalAdd_onClick(button) {
	//	plWarnSignal_dataset.insertRecord("end");
	//	subwindow_warnSignalFW.show();
	//}
	function warnSignalUpd_onClick(button){
		subwindow_warnSignalFW.show();
	}
	function warnSignalConfirm_onClick(button){
		subwindow_warnSignalFW.close();
	}
	
	
	//�����ر�ҳ�棬ˢ�±���
	function yjReportUpd_postSubmit(button) {
		button.url="#";
//		var fdApplyOpin=YjMonitorReportWin_dataset.getValue("fdApplyOpin");
//		if(fdApplyOpin==""){
//			top.easyMsg.info("������д�����");
//		return false;
//		}
		top.easyMsg.info("����ɹ���");
//������ɺ�رյ�ǰҳ��	
//		if(parent.parent.GTab)
//		 {parent.parent.GTab.closeTab();}
//		window.parent.ajMonitorReportWin_close();
	}
	//�ύ��ر�ҳ�棬ˢ�±���
//	function yjReportSubmit_postSubmit(button) {
//		button.url="#";
//		top.easyMsg.info("�����ɹ���");
//		
//		if(parent.parent.GTab)
//		 {parent.parent.GTab.closeTab();}
//		window.parent.ajMonitorReportWin_close();
//	}
	//�˻غ�ر�ҳ�棬ˢ�±���
	function yjReportBack_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		
		if(parent.parent.GTab)
		 {parent.parent.GTab.closeTab();}
		window.parent.ajMonitorReportWin_close();
	}
	
	//�ύ��֤
	function submitCheck(){
	      var fdIsZdzqzwjfflss; 
	      var  fdIsZdzqzwjfflssDesc;  
	     
      
      
      
         fdIsZdzqzwjfflss=YjMonitorReportWin_dataset.getValue("fdIsZdzqzwjfflss"); //������Ƿ��漰���߼����漰�ش�ծȨծ����ס���������:�����ϣ�
		    
		    fdIsZdzqzwjfflssDesc=YjMonitorReportWin_dataset.getValue("fdIsZdzqzwjfflssDesc");
		  
	        if(fdIsZdzqzwjfflss!=""&&fdIsZdzqzwjfflssDesc==""){
	         $('#fdIsZdzqzwjfflssDesc').focus();
			       top.easyMsg.warn("ѡ���������ƴ�ʩ��������д������Ƿ��漰���߼����漰�ش�ծȨծ����ס���������˵����");
			       return false;
			    }
		    if(fdIsZdzqzwjfflss==""&&fdIsZdzqzwjfflssDesc!=""){
		    $('#fdIsZdzqzwjfflss').focus();
		       top.easyMsg.warn("��д������Ƿ��漰���߼����漰�ش�ծȨծ����ס���������˵��������ѡ���ѡ�");
		       return false;
		    }
        
	}
	//��ӡ
	function contractBtn_onClickCheck(button){
		var businessId='${businessId}';
		var reportId=YjMonitorReportWin_dataset.getValue("fdId");
		window.open("${contextPath}/common/donloadWord?reportType=YJ&reportId="+reportId+'&businessId='+businessId);
		/*
		
		$('#uploadForm').ajaxSubmit({
			type:"post", 
			success:function(data){
			}
		});
		*/
	}
	
	//�鿴���
	function btnOpinion_onClick(button){
		subwindow_taskApprovalHistoryFW.show();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/MonitorReportCtrl.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
</@CommonQueryMacro.page>