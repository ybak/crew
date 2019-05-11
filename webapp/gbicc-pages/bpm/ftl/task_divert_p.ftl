<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign userInfo_=Session["USER_SESSION_INFO"] />
<@CommonQueryMacro.page title="���̹���  &gt;  ����ת��">
<!-- �Թ������б� -->
<@CommonQueryMacro.CommonQuery id="TaskDivertP" init="false" submitMode="selected">
	<div>
		<div>
			<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" showButton="false" labelwidth="100" colNm=6 
				fieldStr="taskCode,taskType,custCode,custName,createTimeStart,createTimeEnd,tlrInfo,brName" />
		</div>
		<div style="text-align:center;">
			<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
			<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
		</div>
		<div>
			<@CommonQueryMacro.DataTable id="taskAfreshAssignTable" remoteSort="true" 
				nowrap="true"
				sortable="true" 
				toolbar="mytoolbar" readonly="false" 
				paginationbar="btAdd" 
				remoteSort="true" sortable="true"
				fieldStr="select[20],taskCode[150],taskTypeName[90],custCode[120],custName[200],brName[150],taskStatus[80],createTime[120],tlrInfo[200]" width="100%" hasFrame="true" />
		</div>
	<div>
</@CommonQueryMacro.CommonQuery>
<script>
	var DGRWZYWin=null;
	//��ʼ������
	function initCallGetter_post(){
		var brCode=user_info.orgId;
		var roleId=user_info.roleId;
		var tlrNo=user_info.userId;
		var roleType=user_info.roleType;
		TaskDivertP_dataset.setParameter('brCode',brCode);
		TaskDivertP_dataset.flushData();
	};
	//ˢ������
	function TaskDivertP_flush_data(){
		var brCode=user_info.orgId;
		var roleId=user_info.roleId;
		var tlrNo=user_info.userId;
		var roleType=user_info.roleType;
		TaskDivertP_dataset.setParameter('brCode',brCode);
		TaskDivertP_dataset.flushData(TaskDivertP_dataset.pageIndex);
		DGRWZYWin.close();
		top.easyMsg.info("����ת�Ƴɹ���");
	};
	//���ò�ѯ����
	function btnReset_onClick(){
		TaskDivertP_interface_dataset.clearData();
	};
	//��ʾ�Թ�����ת�Ƶ���ҳ��
	function btAdd_onClick(){
		//�ж��Ƿ�ͬһ��������
		//�������ͬһ�������񣬸�����ʾ������ת������
		var sl=[];
		var record=TaskDivertP_dataset.getFirstRecord();
		while(record){
			if(record.getValue("select")==true){
				sl.push(record);
			}
			record=record.getNextRecord();
		}
		var sl2=[];
		for(var i=0;i<sl.length;i++){
			sl2.push(sl[i]);
		}
		for(var i=0;i<sl.length;i++){
			for(var k=0;k<sl2.length;k++){
				if(sl[i].getValue("taskType")!=sl2[k].getValue("taskType")){
					top.easyMsg.info("ֻ��ͬʱת��ͬһ���͵�����");
					return;
				}
				if(sl[i].getValue("brClass")!=sl2[k].getValue("brClass")){
					top.easyMsg.info("ֻ��ͬʱת�ƻ����ȼ�Ϊͬһ�ȼ�������");
					return;
				}
			}
		}
		var taskType=sl.length>0?sl[0].getValue("taskType"):null;
		//�ж������Ƿ�����ʼ�ڵ�
		//���������ʼ�ڵ㣬������ѡ�ڵ��еĲ�����ʼ�ڵ������id������ת���������ʾ
		var wrongTasks='';
		for(var i=0;i<sl.length;i++){
			if(sl[i].getValue('rootFlag')!='true'){
				wrongTasks+=sl[i].getValue('custCode');
				if(i!=sl.length-1){
					wrongTasks+=',';
				}
			}
		}
		if(wrongTasks!=''){
			top.easyMsg.info("������ѡ�ļ�¼�в������񡾿ͻ���ţ�"+wrongTasks+"���Ѿ��ڴ����У��޷���������ת�ƣ������¹�ѡ�������˻���ԭʼ�����˺��������ת�ƣ�");
			return;
		}
		//���û�й�ѡת�����񣬸�����ʾ
		if(sl.length==0){
			top.easyMsg.info("�빴ѡҪת�Ƶ�����");
			return;
		}
		//id��Ӧ������ر���FD_ID
		//ids�Ƕ��idƴ�������ַ������ָ���Ϊ';'
		//��ids���غ�̨�������id�����������´���
		var ids='';
		for(var i=0;i<sl.length;i++){
			ids+=sl[i].getValue("id");
			if(i!=sl.length-1){
				ids+=";";
			}
		}
		//��ȡ��ǰ�û��������Ϣ
		//����ǰ�û��Ļ������غ�̨�����Ҹ��û����ڻ����Լ����ڻ������ӻ�������������
		var brCode=user_info.orgId;
		var roleId=user_info.roleId;
		var tlrNo=user_info.userId;
		var roleType=user_info.roleType;
		var brClass=sl[0].getValue("brClass");
		//����"�Թ�����ת��"�Ի���
		DGRWZYWin=openSubWin("DGRWZY",
				"�Թ�����ת��",
				"/gbicc-pages/bpm/ftl/ZGRWZY.ftl?brCode="+brCode+"&ids="+ids+"&taskType="+taskType+"&brClass="+brClass,
				"1200","600",false,true,function(){
			
		},false);
	};
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>