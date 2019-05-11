<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>

<@CommonQueryMacro.page title="����Ա����">
<@CommonQueryMacro.LayoutPanel id="cc" >
    <@CommonQueryMacro.LayoutCenter title="����Ա�б�">
		<@CommonQueryMacro.CommonQuery id="operMngEntry" init="false" submitMode="current">
			<@CommonQueryMacro.DataTable id ="datatable1" toolbar="mytoolbar" paginationbar="-,btAdd,-,btModify,-,btResetPwd2,-,btStatus,-,btLoginStatus,-,unLock,-,btExport" fieldStr="tlrno[80],tlrName[100],flag[80],status[80],isLock[75],brname[180],roles[200],lastaccesstm[100],lastlogouttm[100],st[80]"  readonly="true" width="100%" height="100%" />
		</@CommonQueryMacro.CommonQuery>
		<@CommonQueryMacro.ToolBar id="mytoolbar">
		<div style="display:none">
			<@CommonQueryMacro.Button id="btResetPwd" />
		</div>
		<div style="text-align:right">
			<@CommonQueryMacro.InterfaceElement elId="qtlrno" />
			<@CommonQueryMacro.InterfaceElement elId="qtlrnoName" />
			<@CommonQueryMacro.InterfaceButton desc="btQuery" />
		</div>
		</@CommonQueryMacro.ToolBar>
    </@CommonQueryMacro.LayoutCenter>
    <@CommonQueryMacro.LayoutWest title="������" width="200" split="true" >
    	<@CommonQueryMacro.CommonQuery id="branchTree" init="true" submitMode="current" navigate="false">
			<@CommonQueryMacro.DynamicTree id="tree1" />
		</@CommonQueryMacro.CommonQuery>
    </@CommonQueryMacro.LayoutWest>
</@CommonQueryMacro.LayoutPanel> 
<script language="javascript">
	var brcode=null;
	function btExport_onClick(){
		//����·��
		var proPath="${contextPath}"
		var reqPath=proPath+"/common/downloadTlrInfoExcel";
		//����form����
		var form=$("<form>");//����һ��form����
		form.attr("style","display:none");
		form.attr("method","post");
		form.attr("action",reqPath);
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","brcode");
		input1.attr("value",brcode);
		form.append(input1);
		$("body").append(form);
		//
		if(window.confirm('ȷ��Ҫ����Excel������')){
			form.submit();
		}else{
			return;
		}
	}
	var currentTlrno = "${statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstanceWithoutException().getTlrno()}";
	
	function initCallGetter_post(){
		//DynamicTree_tree1.expandAll();
		selectRoot();
	}
	//��λһ����¼
	function locate(id) {
		var record = operMngEntry_dataset.find(["tlrno"],[id]);
		if (record) {
			operMngEntry_dataset.setRecord(record);
		}
	}

	function datatable1_opr_onRefresh(cell, value, record)
	{
		if(record&&record!=null){

			var id = record.getValue("tlrno");
			var branchId = record.getValue("tlrno");
			var st = record.getValue("st");
			var innerStr = "<PRE>";
			if (st == "1" || st == "2" || st == "3") {
				innerStr = innerStr + "<a style=\"color:#666666\" title=\"��¼�����������ܲ���\">�޸�</a> " +
		    		" <a style=\"color:#666666\" title=\"��¼�����������ܲ���\">��������</a>" +"</PRE>";
		    } else {
		    	innerStr = innerStr + " <a href=\"JavaScript:btModifyShow('"+id+"')\">�޸�</a>"  +
			    " <a href=\"JavaScript:resetPwd('"+id+"')\">��������</a>" +"</PRE>";
		    }
		    cell.innerHTML = innerStr;
		}else{
			cell.innerHTML = "";
		}
	}
	function btModify_onClickCheck(){
		var foo = operMngEntry_dataset.getValue("tlrno");
		var st = operMngEntry_dataset.getValue("st");
		if(foo==currentTlrno){
			alert('�������޸��Լ���');
			return false;
		}
		
		if(foo==""){
			alert("����ѡ��Ҫ�޸ĵļ�¼��");
			return;
		}
		if(st!='4'){
			alert("�û��޸��У����ܻ�δȷ�ϣ�");
			return;
		}
		btModifyShow(foo);
	}
	function btResetPwd2_onClick(){
		resetPwd();
	}
	
	function btStatus_onClickCheck(button) {
		var status = operMngEntry_dataset.getValue("flag");
		if(status == '0'){
			if(confirm("ȷ�Ͻ��ò���Ա����Ϊ��Ч?")){
			    operMngEntry_dataset.setParameter("statu", "1");
				return true;
			}else{
				return false;
			}
		} else {
			if(confirm("ȷ�Ͻ��ò���Ա����Ϊ��Ч?")){
				operMngEntry_dataset.setParameter("statu", "0");
				return true;
			}else{
				return false;
			}
		}
	}
	function btStatus_postSubmit(button) {
		alert("���óɹ�");
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
	}

	function btLoginStatus_onClickCheck(button){
		if(confirm("ȷ�Ͻ��ò���Աǿ��ǩ��?")){
			operMngEntry_dataset.setParameter("statu","logout");
			return true;
		}else{
			return false;
		}
	}
	function btLoginStatus_postSubmit(button){
		alert("ǩ�˳ɹ�");
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
	}

	function operMngEntry_dataset_dataset_afterScroll(dataset){
		unLock.disable(dataset.getValue("isLock") != '1' || dataset.getValue("tlrno") == currentTlrno);
		var st = dataset.getValue("st");
		if(st == "1" || st == "2" || st == "3"){
			btModify.disable(true);
			btResetPwd.disable(true);
		} else {
			btModify.disable(false);
			btResetPwd.disable(false);
		}
	}

	//����
	function btAdd_onClick(){
		//window.location.href = "${contextPath}/fpages/regonization/ftl/OperMngRoleInfo.ftl?op=new";
		var foo = DynamicTree_tree1.getSelected();
		if(foo == null || foo.id == ""){
			alert("û���ҵ�ѡ���Ļ����ţ�������������ѡ��");
			return;
		}
		currentSubWin = openSubWin("pageWinId1", "", "/fpages/regonization/ftl/OperMngRoleInfo.ftl?op=new&brcode="+foo.id,"950","640");
	}

	//ˢ������
	function flushPage(){
		bopAccDsRecordAD_dataset.flushData();
	}

	function winZone_onCloseCheck(){
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
		return true;
	}

	function btModifyShow(tlrno){
		//debugger;
	  	//window.location.href = "${contextPath}/fpages/regonization/ftl/OperMngRoleInfo.ftl?op=modify&tlrno=" + tlrno;
	  	var foo = operMngEntry_dataset.getValue("tlrno");
	  	//debugger;
		if(foo!=""){
			currentSubWin = openSubWin("pageWinId1", "", "/fpages/regonization/ftl/OperMngRoleInfo.ftl?op=modify&tlrno="+foo+"&brcode="+DynamicTree_tree1.getSelected().id,"950","640");
		}else{
			alert("����ѡ��Ҫ�޸ĵļ�¼��");
		}
	}

	function btAuthShow(tlrno){
		var paramMap = new Map();
		var op = "auth";
	  	paramMap.put("tlrno",tlrno);
	  	paramMap.put("op",op);
	  	loadPageWindows("userWin", "��ɫ�趨", "/fpages/regonization/ftl/OperMngRoleInfo.ftl", paramMap, "winZone");
	}

	function resetPwd() {
		var tlrno = operMngEntry_dataset.getValue("tlrno");
		if (tlrno == currentTlrno) {
			alert("���������Լ�������");
		} else {
			top.easyMsg.confirm("ȷ��Ҫ���øò���Ա��?",handleOK,handleCancel); 
		}
	}
	
	function handleOK(){
		var tlrno = operMngEntry_dataset.getValue("tlrno");
		locate(tlrno);
		btResetPwd.click();
	}
	
	function handleCancel(){
	
	}
	
	
	var currentSubWin;
	
	function closeSubWin(){
		currentSubWin.close();
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
	}

	function btResetPwd_postSubmit(button){
		var retParam = button.returnParam;

		alert("�������óɹ�,��ʼ��Ϊ"+retParam.DefaultPWD);
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
	}

	function unLock_onClickCheck(button) {
		operMngEntry_dataset.setParameter("tlrno",operMngEntry_dataset.getValue("tlrno"));
	}
	function unLock_postSubmit(button) {
		alert("�����ɹ���");
		operMngEntry_dataset.flushData(operMngEntry_dataset.pageIndex);
	}


	function operMngEntry_dataset_afterScroll(dataset){
		unLock.disable(dataset.getValue("isLock") != '1');
		btLoginStatus.disable(dataset.getValue("status") != '1');
		btStatus.disable(false);
		if(dataset.getValue("tlrno") == currentTlrno){
			btStatus.disable(true);
			unLock.disable(true);
			btLoginStatus.disable(true);
		}
		var st = dataset.getValue("st");
		if (st == "1" || st == "2" || st == "3") {
			btStatus.disable(true);
			unLock.disable(true);
			btLoginStatus.disable(true);
		}
	}

	//չʾ�Աȹ��ܵ�js
	function datatable1_tlrno_onRefresh(cell, value, record){
		if(record!=null){
			var sta = record.getValue("st");
			var tlrno=record.getValue("tlrno");


			cell.innerHTML = "<a href=\"Javascript:showDetail('"+tlrno+"','"+sta+"')\">"+tlrno+"</a>";

		} else {
			cell.innerHTML = ""
		}
	}


	function showDetail(tlrno,sta){
		showWin("�û���ϸ��Ϣ","/fpages/regonization/ftl/OperMngRoleCompare.ftl?id=" + tlrno + "&st=" + sta + "&flag=0","","",window);
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
		operMngEntry_dataset.setParameter('brcode1',node.id);
		operMngEntry_interface_dataset.setParameter('brcode1',node.id);
		operMngEntry_dataset.flushData(1);
		brcode=node.id;
	}
</script>
</@CommonQueryMacro.page>