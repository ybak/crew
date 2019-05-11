<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="������ҵ��ֵ�����б�">

<@CommonQueryMacro.CommonQuery id="TPubRulIndustryValue" init="true" submitMode="current">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.Interface id="intface" label="�������ѯ����" showButton="false" labelwidth="100" colNm=8/>
		</td>
	</tr>
	<tr>
		<td>
			<div align="center" style="margin-bottom:5px">
				<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
				<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id="TPubRulIndustryValueDataTable"  height="555" readonly="true" paginationbar="btnAdd,btnUpd,btnDel,btnRead" remoteSort="true" sortable="true" 
			fieldStr="rulCode[100],rulName[300],industryCode[100],industryName[300],valueType[150]" width="100%" hasFrame="true"/>
			<@CommonQueryMacro.FloatWindow id="SelectRulAndIndustryFW" modal="true" label="����ѡ��Ҫ�����Ĺ�������ҵ" 
			resize="true" minimize="false" width="700" height="200" maximize="true" closure="true" show="false" defaultZoom="normal">
				<div name='group1' class="group" style="width:99%">
					<table width="100%" class="grouptable" height="100%" style="table-layout: auto;">
				    	<tr>
				    		<td class="labeltd" align="center" width="width:20%">
								����:
							</td>
							<td align="left" nowrap style="width:80%">
								<@CommonQueryMacro.SingleField fId="addRulCode"/>
							</td>
				    	</tr>
				        <tr>
				    		<td class="labeltd" align="center" width="width:20%">
								��ҵ:
							</td>
							<td align="left" nowrap style="width:80%">
								<@CommonQueryMacro.SingleField fId="addIndustryName"/>
								<@CommonQueryMacro.SimpleButton id="btnSelect" desc="ѡ��" onclick="selectIndustry();" icon="" plain="false" />
							</td>
				    	</tr>
				    </table>
				</div>
				<br/>
				<center>
					<@CommonQueryMacro.Button id="btnSave" />
				</center>
			</@CommonQueryMacro.FloatWindow>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script>
	var selectWin=null;
	var addWin=null;
	var readWin=null;
	function btnUpd_onClick(){
		var rulCode=TPubRulIndustryValue_dataset.getValue("rulCode");
		var industryCode=TPubRulIndustryValue_dataset.getValue("industryCode");
		if(!rulCode || rulCode==""){
			top.easyMsg.info("��ѡ��Ҫ�޸ĵ����ݣ�");
			return;
		}
		addWin=openSubWin("addWin","�޸���ҵ���÷�ֵ��˫��������з�ֵ���޸ģ�","/gbicc-pages/rule/TPubRulIndustryValueAdd.ftl?flag=update&rulCode="+rulCode+"&industryCode="+industryCode,"1200","600",null,true,function(){
			TPubRulIndustryValue_dataset.flushData(TPubRulIndustryValue_dataset.pageIndex);
		});
	}
	function btnSave_onClick(){
		var addRulCode=TPubRulIndustryValue_dataset.getValue("addRulCode");
		var addIndustryCode=TPubRulIndustryValue_dataset.getValue("addIndustryCode");
		if(!addRulCode || addRulCode==""){
			top.easyMsg.info("��ѡ�����");
			return;
		}
		if(!addIndustryCode || addIndustryCode==""){
			top.easyMsg.info("��ѡ����ҵ��");
			return;
		}
		//�ж�ϵͳ���Ƿ������ͬ������ͬ��ҵ�ļ�¼��
		IndustryValueAjax.dwrFindIndustryValue(addRulCode,addIndustryCode,function(y){
			if(y>0){
				top.easyMsg.info("ͬһ����ͬһ��ҵֻ������һ�׷�ֵ��");
				return;
			}else{
				subwindow_SelectRulAndIndustryFW.close();
				addWin=openSubWin("addWin","������ҵ���÷�ֵ��˫��������з�ֵ����д��","/gbicc-pages/rule/TPubRulIndustryValueAdd.ftl?flag=add&rulCode="+addRulCode+"&industryCode="+addIndustryCode,"1200","600",null,true,function(){
					TPubRulIndustryValue_dataset.flushData(TPubRulIndustryValue_dataset.pageIndex);
				});
			}
		});
	}
	function TPubRulIndustryValueDataTable_onDbClick(){
		btnRead_onClick();
	}
	function btnRead_onClick(){
		var rulCode=TPubRulIndustryValue_dataset.getValue("rulCode");
		var industryCode=TPubRulIndustryValue_dataset.getValue("industryCode");
		if(!rulCode || rulCode==""){
			top.easyMsg.info("��ѡ��Ҫ�鿴�����ݣ�");
			return;
		}
		readWin=openSubWin("readWin","�鿴��ҵ���÷�ֵ","/gbicc-pages/rule/TPubRulIndustryValueRead.ftl?rulCode="+rulCode+"&industryCode="+industryCode,"1200","600");
	}
	function btnDel_onClickCheck(){
		var rulCode=TPubRulIndustryValue_dataset.getValue("rulCode");
		var industryCode=TPubRulIndustryValue_dataset.getValue("industryCode");
		if(!rulCode || rulCode==""){
			top.easyMsg.info("��ѡ��Ҫɾ�������ݣ�");
			return false;
		}
		if(!industryCode || industryCode==""){
			top.easyMsg.info("ϵͳĬ�Ϸ�ֵ�޷�ɾ����");
			return false;
		}
		var v=confirm("����ɾ�����޷��ָ����Ƿ�ȷ��ɾ����");
		if(v){
			TPubRulIndustryValue_dataset.setParameter("rulCode",rulCode);
			TPubRulIndustryValue_dataset.setParameter("industryCode",industryCode);
		}
		return v;
	}
	function btnDel_postSubmit(button){
		button.url="#";
		top.easyMsg.info("ɾ���ɹ���");
		TPubRulIndustryValue_dataset.setParameter("rulCode",null);
		TPubRulIndustryValue_dataset.setParameter("industryCode",null);
		TPubRulIndustryValue_dataset.flushData(TPubRulIndustryValue_dataset.pageIndex);
	}
	function saveIndustryFun(typeCd,typeValue){
		selectWin.close();
		TPubRulIndustryValue_dataset.setValue("addIndustryCode",typeCd);
		TPubRulIndustryValue_dataset.setValue("addIndustryName",typeValue);
	}
	function btnAdd_onClick(){
		TPubRulIndustryValue_dataset.setFieldRequired("addRulCode",true);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryCode",true);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryName",true);
		subwindow_SelectRulAndIndustryFW.show();
	}
	function SelectRulAndIndustryFW_floatWindow_beforeClose(){
		TPubRulIndustryValue_dataset.setFieldRequired("addRulCode",false);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryCode",false);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryName",false);
		TPubRulIndustryValue_dataset.setValue("addRulCode",null);
		TPubRulIndustryValue_dataset.setValue("addIndustryCode",null);
		TPubRulIndustryValue_dataset.setValue("addIndustryName",null);
		return true;
	}
	function SelectRulAndIndustryFW_floatWindow_beforeHide(){
		TPubRulIndustryValue_dataset.setFieldRequired("addRulCode",false);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryCode",false);
		TPubRulIndustryValue_dataset.setFieldRequired("addIndustryName",false);
		TPubRulIndustryValue_dataset.setValue("addRulCode",null);
		TPubRulIndustryValue_dataset.setValue("addIndustryCode",null);
		TPubRulIndustryValue_dataset.setValue("addIndustryName",null);
		return true;
	}
	function selectIndustry(){
		selectWin=openSubWin("selectWin","��ҵѡ��","/gbicc-pages/rule/TOdsCmsCodeIndustry.ftl","800","480");
	}
	function btnReset_onClick(){
		TPubRulIndustryValue_interface_dataset.clearData();
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/IndustryValueAjax.js'> </script>
</@CommonQueryMacro.page>