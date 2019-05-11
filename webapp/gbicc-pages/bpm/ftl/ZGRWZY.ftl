<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<#assign brCode=RequestParameters["brCode"]?default("")>
<#assign ids=RequestParameters["ids"]?default("")>
<#assign taskType=RequestParameters["taskType"]?default("")>
<#assign brClass=RequestParameters["brClass"]?default("")>


<@CommonQueryMacro.page title="����Ա����">

<@CommonQueryMacro.LayoutPanel id="cc" >
    <@CommonQueryMacro.LayoutCenter title="����Ա�б�">
		<@CommonQueryMacro.CommonQuery id="TlrInfoForZGRWZYGetter" init="false" submitMode="current">
			<@CommonQueryMacro.DataTable id ="datatable1" 
				toolbar="mytoolbar" 
				paginationbar="btDivert"
				fieldStr="tlrNo[80],tlrName[100]"  
				readonly="true" width="100%" height="100%" />
		</@CommonQueryMacro.CommonQuery>
		<@CommonQueryMacro.ToolBar id="mytoolbar">
			<div style="text-align:right">
				<@CommonQueryMacro.InterfaceElement elId="tlrNo" />
				<@CommonQueryMacro.InterfaceElement elId="tlrName" />
				<@CommonQueryMacro.InterfaceButton desc="btQuery" />
			</div>
		</@CommonQueryMacro.ToolBar>
    </@CommonQueryMacro.LayoutCenter>
    <@CommonQueryMacro.LayoutWest title="������" width="200" split="true" >
    	<@CommonQueryMacro.CommonQuery id="brTree" init="true" 
    		submitMode="current" navigate="false">
			<@CommonQueryMacro.DynamicTree id="tree1" />
		</@CommonQueryMacro.CommonQuery>
    </@CommonQueryMacro.LayoutWest>
</@CommonQueryMacro.LayoutPanel>
<script>
	//������ѡ��Ļ�����
	var selectBrCode='';
	var currBrCode="${brCode}";
	var ids="${ids}";
	var taskType="${taskType}";
	var brClass="${brClass}";
	var selectorBrClass='';
	//��ʼ����Ϣ��
	function initCallGetter_post(){
		//DynamicTree_tree1.expandAll();
		selectRoot();
	}
	//ѡ�и�
	function selectRoot(){
		var foo = DynamicTree_tree1.getRoot();
		if(foo){
			DynamicTree_tree1.select(foo.id);
		}
	}
	//������������ڵ��ˢ���Ҳ���Ա�б�
	function DynamicTree_tree1_onSelect(e,node){
		TlrInfoForZGRWZYGetter_dataset.setParameter('brCode',node.id);
		TlrInfoForZGRWZYGetter_interface_dataset.setParameter('brCode',node.id);
		TlrInfoForZGRWZYGetter_dataset.flushData(1);
		selectBrCode=node.id;
		//��ȡ��ǰѡ������ĵȼ�
		selectorBrClass=node.attributes.record.getValue("brclass");
	}
	//����ת��ǰ���ж��û��Ƿ�ȷ��ת��
	function btDivert_onClickCheck(){
		//�ж��Ƿ�Ϊͬһ�ȼ�����
//		if(brClass!=selectorBrClass){
//			top.easyMsg.info("����ֻ��ת��ͬһ�ȼ��Ļ�����");
//			return false;
//		}
		//�����Ի����ж��Ƿ����ת��
		if(window.confirm('ȷ��Ҫת������(ת�ƺ�������Ч)')){
			var selectTlrNo=TlrInfoForZGRWZYGetter_dataset.getValue("tlrNo");
			TlrInfoForZGRWZYGetter_dataset.setParameter('currBrCode',currBrCode);
			TlrInfoForZGRWZYGetter_dataset.setParameter('ids',ids);
			TlrInfoForZGRWZYGetter_dataset.setParameter('taskType',taskType);
			TlrInfoForZGRWZYGetter_dataset.setParameter('selectTlrNo',selectTlrNo);
			TlrInfoForZGRWZYGetter_dataset.setParameter('selectBrCode',selectBrCode);
		}else{
			return false;
		}
	}
	//����ɹ���ˢ�¸�ҳ������
	function btDivert_postSubmit(){
		window.parent.TaskDivertP_flush_data();
		
	}
</script>
</@CommonQueryMacro.page>