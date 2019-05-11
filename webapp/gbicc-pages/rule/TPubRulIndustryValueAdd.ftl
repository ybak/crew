<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign rulCode=RequestParameters["rulCode"]?default("")>
<#assign industryCode=RequestParameters["industryCode"]?default("")>
<#assign flag=RequestParameters["flag"]?default("")>

<@CommonQueryMacro.page title="������ҵ��ֵ�����б�">
<@CommonQueryMacro.CommonQuery id="TPubRulIndustryValueDtl" init="true" submitMode="all">
<table>
	<tr>
		<td>
			<@CommonQueryMacro.DataTable id="TPubRulIndustryValueDtlDataTable" readonly="false" height="510" 
			fieldStr="rulCode[80],rulName[150],industryCode[80],industryName[150],valueDescView[300],valueCode[80],value[100],desc[150]" width="100%" hasFrame="true"/>
		</td>
	</tr>
</table>
<br/>
<center>
	<@CommonQueryMacro.Button id="btnSave" />
</center>
</@CommonQueryMacro.CommonQuery>
<script>
	var rulCode='${rulCode}';
	var industryCode='${industryCode}';
	var flag='${flag}';
	function initCallGetter_post(){
		TPubRulIndustryValueDtl_dataset.setParameter("rulCode",rulCode);
		TPubRulIndustryValueDtl_dataset.setParameter("industryCode",industryCode);
		TPubRulIndustryValueDtl_dataset.setParameter("flag",flag);
		TPubRulIndustryValueDtl_dataset.flushData(1);
	}
	function btnSave_onClickCheck(){
		var record=TPubRulIndustryValueDtl_dataset.getFirstRecord();
		var bool=true;
		while(record){
			if(record.getValue("value")!=0 && (record.getValue("value")==null || record.getValue("value")=="")){
				bool=false;
				break;
			}
			record=record.getNextRecord();
		}
		if(!bool){
			top.easyMsg.info("��ֵ����Ϊ�գ�");
			return false;
		}
		var vd=TPubRulIndustryValueDtl_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var id=TPubRulIndustryValueDtl_dataset.getValue("id");
		if(id!=null && id.trim()!=""){
			TPubRulIndustryValueDtl_dataset.setParameter("op","update");
		}else{
			TPubRulIndustryValueDtl_dataset.setParameter("op","add");
		}
	}
	function btnSave_postSubmit(button) {
		button.url="#";
		top.easyMsg.info("����ɹ���");
		TPubRulIndustryValueDtl_dataset.setParameter("rulCode",rulCode);
		TPubRulIndustryValueDtl_dataset.setParameter("industryCode",industryCode);
		TPubRulIndustryValueDtl_dataset.setParameter("flag",null);
		TPubRulIndustryValueDtl_dataset.flushData(1);
	}
</script>
</@CommonQueryMacro.page>