<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<#assign brCode=RequestParameters["brCode"]?default("")>
<#assign ids=RequestParameters["ids"]?default("")>
<#assign taskType=RequestParameters["taskType"]?default("")>
<#assign brClass=RequestParameters["brClass"]?default("")>


<@CommonQueryMacro.page title="操作员管理">

<@CommonQueryMacro.LayoutPanel id="cc" >
    <@CommonQueryMacro.LayoutCenter title="操作员列表">
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
    <@CommonQueryMacro.LayoutWest title="机构树" width="200" split="true" >
    	<@CommonQueryMacro.CommonQuery id="brTree" init="true" 
    		submitMode="current" navigate="false">
			<@CommonQueryMacro.DynamicTree id="tree1" />
		</@CommonQueryMacro.CommonQuery>
    </@CommonQueryMacro.LayoutWest>
</@CommonQueryMacro.LayoutPanel>
<script>
	//机构树选择的机构号
	var selectBrCode='';
	var currBrCode="${brCode}";
	var ids="${ids}";
	var taskType="${taskType}";
	var brClass="${brClass}";
	var selectorBrClass='';
	//初始化信息表
	function initCallGetter_post(){
		//DynamicTree_tree1.expandAll();
		selectRoot();
	}
	//选中根
	function selectRoot(){
		var foo = DynamicTree_tree1.getRoot();
		if(foo){
			DynamicTree_tree1.select(foo.id);
		}
	}
	//左侧机构树点击节点后刷新右侧人员列表
	function DynamicTree_tree1_onSelect(e,node){
		TlrInfoForZGRWZYGetter_dataset.setParameter('brCode',node.id);
		TlrInfoForZGRWZYGetter_interface_dataset.setParameter('brCode',node.id);
		TlrInfoForZGRWZYGetter_dataset.flushData(1);
		selectBrCode=node.id;
		//获取当前选择机构的等级
		selectorBrClass=node.attributes.record.getValue("brclass");
	}
	//任务转移前，判断用户是否确定转移
	function btDivert_onClickCheck(){
		//判断是否为同一等级机构
//		if(brClass!=selectorBrClass){
//			top.easyMsg.info("任务只能转移同一等级的机构！");
//			return false;
//		}
		//弹出对话框，判断是否继续转移
		if(window.confirm('确定要转移任务？(转移后将立即生效)')){
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
	//请求成功后刷新父页面数据
	function btDivert_postSubmit(){
		window.parent.TaskDivertP_flush_data();
		
	}
</script>
</@CommonQueryMacro.page>