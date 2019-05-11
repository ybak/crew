<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="���ܲ˵���">
	<@CommonQueryMacro.CommonQuery id="roleFuncTreeAsync" init="false" submitMode="all">
		<div style="padding:5px;width:800px;">
			<a href="javascript:void(0)" id="mb1" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-add'">�˵�����</a>
			<a href="javascript:void(0)" id="mb2" class="easyui-menubutton" data-options="menu:'#mm2',iconCls:'icon-add'">��������</a>
			<@CommonQueryMacro.Button id="btnEdit" />
			<@CommonQueryMacro.SimpleButton id="sbtnRemove" desc="ɾ��" icon="icon-remove" />
			<@CommonQueryMacro.Button id="btnSave"/>
			<@CommonQueryMacro.SimpleButton id="sbtnSwitch" desc="�л���������˵�" />
			<@CommonQueryMacro.SimpleButton id="sbtnUp" desc="����" />
			<@CommonQueryMacro.SimpleButton id="sbtnDown" desc="����" />
			<div style="display:none">
				<@CommonQueryMacro.SimpleButton id="sbtnTest" desc="����" />
				<@CommonQueryMacro.Button id="btnRemove" />
			</div>
		</div>
		<div id="mm1" style="width:150px;">
			<div onclick="javascript:prepareInsert(false,true)" data-options="iconCls:'icon-add'">ͬ��Ŀ¼</div>
			<div onclick="javascript:prepareInsert(false,false)" data-options="iconCls:'icon-add'">ͬ���˵�</div>
			<div onclick="javascript:prepareInsert(true,true)" data-options="iconCls:'icon-add'">��Ŀ¼</div>
			<div onclick="javascript:prepareInsert(true,false)" data-options="iconCls:'icon-add'">�Ӳ˵�</div>
		</div>
		<div id="mm2" style="width:150px;">
			<div onclick="javascript:btnNew_onClick()" data-options="iconCls:'icon-add'">��ť��Դ</div>
			<div onclick="javascript:subNew_onClick()" data-options="iconCls:'icon-add'">ҳ����Դ</div>
			<div onclick="javascript:other_onClick()" data-options="iconCls:'icon-add'">������Դ</div>
		</div>
		<@CommonQueryMacro.DataTable id="datatable2" title="���ܲ˵���" treeGrid="true" hasFrame="true" height="" readonly="true" treeField="name" fieldStr="name[20%],pagepath[40%],funcType[10%],id[40%],desc[40%]" width="100%" />
  		<@CommonQueryMacro.FloatWindow id="signWindow" label="" width="550" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
  			<table width="100%">
  				<tr>
  					<td>
						<@CommonQueryMacro.Group id="group1" label="��ϸ����" fieldStr="id,name,iconCls,pagepath,desc" colNm="2"/>
  					</td>
  				</tr>
  				<tr style="display:none">
  					<td >
  						<input id="pageid" type="file"  />
  							<@CommonQueryMacro.Button id="buttonSave" />
      				</td>
      			</tr>
  				<tr>
  					<td align="center">
  						<@CommonQueryMacro.SimpleButton id="sbtnSave" icon="icon-save" desc="����" />
      				</td>
      			</tr>
      		</table>
 		 </@CommonQueryMacro.FloatWindow>
 		 <@CommonQueryMacro.FloatWindow id="btWindow" label="" width="550" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
  			<table width="100%">
  				<tr>
  					<td>
						<@CommonQueryMacro.Group id="bt1" label="��ϸ����" fieldStr="id,name,btname,desc" colNm="2"/>
  					</td>
  				</tr>
  				<tr>
  					<td align="center">
  						<@CommonQueryMacro.SimpleButton id="butnSave" desc="����"/>
      				</td>
      			</tr>
      		</table>
 		 </@CommonQueryMacro.FloatWindow>
 		  <@CommonQueryMacro.FloatWindow id="subPage" label="" width="550" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
  			<table width="100%">
  				<tr>
  					<td>
						<@CommonQueryMacro.Group id="bt2" label="��ϸ����" fieldStr="id,name,pageselect,desc" colNm="2"/>
  					</td>
  				</tr>
  				<tr>
  					<td align="center">
  						<@CommonQueryMacro.SimpleButton id="subSave" desc="����"/>
      				</td>
      			</tr>
      		</table>
 		 </@CommonQueryMacro.FloatWindow>
	</@CommonQueryMacro.CommonQuery>
	<script>
		var isTopMode = true;
		var tmpSaveFlag = false;
       
		function butnSave_onClick(){
			buttonSave.click();
		}
		function subSave_onClick(){
			buttonSave.click();
		} 
		
		function pageselect_DropDown_onSelect(dropDown,record,editor){		
			if(record.getValue("_hasChild_")=="false"){
				var pageName=record.getValue("text");
				var d=null;
				var s=new Array();
				dwr.engine.setAsync(false);
				PrivAction.getPagePath(pageName,function(data){
					d=data;
					roleFuncTreeAsync_dataset.setValue("pagepath",d);
					roleFuncTreeAsync_dataset.setValue("pageselectName",d);
					if(roleFuncTreeAsync_dataset.getValue("funcType")=='1'){
					  $("#select_pageselect",$("#subPage")).combotree("hidePanel");
					}else{
					  $("#select_pageselect",$("#signWindow")).combotree("hidePanel");
					}
					return true;
	            });
				dwr.engine.setAsync(true);		
			}else{
				return false;
			}
			
		}
		function roleFuncTreeAsync_dataset_onSetValue(dataset,field,value){
			if(field.fieldName=='id'){
				var oldv = dataset.getString('id');
				if(oldv) {
					var rec=getDataset().firstUnit;
					while(rec) {
						if(rec.getString('pid') == oldv){
							rec.setValue('pid', value);
						}
						rec=rec.nextUnit;
					}
				}
			}
			return value;
		}
		function roleFuncTreeAsync_dataset_afterChange(dataset,field){
			if(field.fieldName=="pageselect"){
				var p=dataset.getValue("pageselect");
				dataset.setValue("pagepath",p);
			}
		}
		
		var subFlag=true;
		function other_onClick(){
			roleFuncTreeAsync_dataset.setParameter("flag",2);
			subNew_onClick();

		}
		
		function subNew_onClick(){
			var funcType=roleFuncTreeAsync_dataset.getValue("funcType");
			var pagepath=roleFuncTreeAsync_dataset.getValue("pagepath");
			var funcClass=roleFuncTreeAsync_dataset.getValue("funcClass");
			if(funcType==1){
				alert("��ѡ��Ϊ������Դ������������������Դ");
				return ;
			}else{
				if(!pagepath){
					alert("��ѡ�е�Ϊ�˵�Ŀ¼����������ҳ�������ӹ�����Դ��");
					return
				}
			}
			var pid=roleFuncTreeAsync_dataset.getValue("id");			
			roleFuncTreeAsync_dataset.insertRecord('child');
			roleFuncTreeAsync_dataset.setValue('pid',pid);
			roleFuncTreeAsync_dataset.setValue('location',isTopMode?'2':'1');
			roleFuncTreeAsync_dataset.setValue('isdirectory','0');
			roleFuncTreeAsync_dataset.setValue('status','1');
			if(roleFuncTreeAsync_dataset.getParameter("flag")=="2"){
		    	roleFuncTreeAsync_dataset.setValue('iconCls','icon-trash');
				roleFuncTreeAsync_dataset.setValue('funcClass','2');
			}else{
				roleFuncTreeAsync_dataset.setValue('funcClass',1);
			    roleFuncTreeAsync_dataset.setValue('iconCls','icon-marble');
				roleFuncTreeAsync_dataset.setFieldRequired("pageselect",true);
			}
			//��ť����ҳ�����Դ����Ϊ1,����ҳ�����Դ����Ϊ0���߲�д��
			roleFuncTreeAsync_dataset.setFieldRequired("id",true);
	        roleFuncTreeAsync_dataset.setValue('funcType','1');
			subwindow_subPage.show();
			roleFuncTreeAsync_dataset.setParameter("flag",0);
		}
		
		function subPage_floatWindow_afterClose(win){
			roleFuncTreeAsync_dataset.setFieldRequired("id",false);
			roleFuncTreeAsync_dataset.setFieldRequired("pageselect",false);
			if(subFlag){roleFuncTreeAsync_dataset.cancelRecord();}
		}
    	function subPage_floatWindow_afterHide(win){
    		roleFuncTreeAsync_dataset.setFieldRequired("id",false);
    		roleFuncTreeAsync_dataset.setFieldRequired("pageselect",false);
    		if(subFlag){roleFuncTreeAsync_dataset.cancelRecord();}
		}
		
		
		function btname_DropDown_beforeOpen(dropDown){
			btname_DropDown.cached=false;
		}
		function btname_DropDown_onSelect(dropDown,record,editor){		
		  	var dn=record.getValue("datasetName");
		   	var bt=record.getValue("id");
		   	roleFuncTreeAsync_dataset.setValue("pagepath",dn+"_"+bt);
		   	roleFuncTreeAsync_dataset.setValue("btnameName",dn+"_"+bt);
		   	return true;
		}
		
		function createInput(){
			var dom=$("#fileSelect");
			if(dom.size()==0){
	            $("#editor_pagepath").after($('<span id="fileSelect" class="combo-arrow" style=""></span>'));
				var fileD=$("#pageid");
				var sp=$("#fileSelect");
				sp.bind("click",function(){
					fileD[0].click();
				});
				fileD.bind('change',function(e){
					var src = e.target || window.event.srcElement;  
					var path=getFullPath(src);
					alert(path);
					roleFuncTreeAsync_dataset.setValue('pagepath',path);
				});
				function getFullPath(obj){ 
				  if(obj){ 
					 if (window.navigator.userAgent.indexOf("MSIE")>=1){ 
					      obj.select(); 
					      return document.selection.createRange().text; 
					 }else if(window.navigator.userAgent.indexOf("Firefox")>=1){ 
					      if(obj.files){ 
					        return obj.files.item(0).getAsDataURL(); 
					      } 
					     return obj.value; 
					 } 
					  return obj.value; 
					 } 
				  } 
			}
		}
		
		function sbtnTest_onClick(){
			alert(getDataset().getValue('isdirectory'));
		}
		
		function hasSelected(){
			return $('#datatable2').treegrid('getSelected')!=null;
		}
		
		function datatable2_onDbClick(record,index){
			btnEdit.click();
		}
		
		function sbtnUp_onClick(){
			if(!hasSelected()){
				return;
			}
			var curRecord = getDataset().record;
			var pid = curRecord.getValue('pid');
			
			var arr = new Array();
			var rec=getDataset().firstUnit;
			while(rec) {
				if(rec.getValue('pid') == pid && rec.recordState!='delete'){
					arr.push(rec);
				}
			  	rec=rec.nextUnit;
			}
			sortByShowSeq(arr);
			if(curRecord === arr[0]){
				//��ǰ��¼�ǵ�һ����¼�����޷������ƶ�
				return;
			}else{
				//������ǰ��¼����һ����¼��showseq������λ�ý���
				var index = -1;
				for(var i=0;i<arr.length;i++){
					if(curRecord===arr[i]){
						index = i;
					}
					arr[i].setValue('showseq',i);
				}
				var tmp = curRecord.getValue('showseq');
				var nextRecord = arr[index-1];
				curRecord.setValue('showseq',nextRecord.getValue('showseq'));
				nextRecord.setValue('showseq',tmp);
				moveTreegridRecord(datatable2,'up');
			}
		}
		
		function isBlank(v){
			if(isNaN(v)){
				return true;
			}
			if(typeof(v)=="string"){
				return $.trim(v)=='';
			}
		}
		
		function sortByShowSeq(arr){
			arr.sort(function(a,b){
				var v1 = isBlank(a.getString('showseq'))?Infinity:parseInt(a.getString('showseq'));
				var v2 = isBlank(b.getString('showseq'))?Infinity:parseInt(b.getString('showseq'));
				return v1>v2?1:-1;
			});
		}
		
		function sbtnDown_onClick(){
			if(!hasSelected){
				return;
			}
			var curRecord = getDataset().record;
			var pid = curRecord.getValue('pid');
			
			var arr = new Array();
			var rec=getDataset().firstUnit;
			while(rec) {
				if(rec.getValue('pid') == pid && rec.recordState!='delete'){
					arr.push(rec);
				}
			  	rec=rec.nextUnit;
			}
			sortByShowSeq(arr);
			if(curRecord === arr[arr.length-1]){
				//��ǰ��¼�����һ����¼�����޷������ƶ�
				return;
			}else{
				//������ǰ��¼����һ����¼��showseq������λ�ý���
				var index = -1;
				for(var i=0;i<arr.length;i++){
					if(curRecord===arr[i]){
						index = i;
					}
					arr[i].setValue('showseq',i);
				}
				var tmp = curRecord.getValue('showseq');
				var nextRecord = arr[index+1];
				curRecord.setValue('showseq',nextRecord.getValue('showseq'));
				nextRecord.setValue('showseq',tmp);
				moveTreegridRecord(datatable2,'down');
			}
		}
		
		function syncIcon(){
			if(getDataset().getValue('isdirectory')=='1' && getDataset().getValue('iconCls')==''){
				var $ic = $('.datagrid-row-selected>td>div>.tree-icon');
				$ic.removeClass('tree-file');
				$ic.addClass('tree-folder');
			}
		}
		
		function initMenu(){
			$('#mb1').menubutton({
				plain:false
			});
			$('#mb2').menubutton({
				plain:false
			});
		}
		
		function buttonSave_onClickCheck(button){
			var rec=getDataset().firstUnit;
			var currentId = getDataset().getValue('id');
			var btname=roleFuncTreeAsync_dataset.getValue('btnameName');
			if(btname==""||!btname){
				btname=roleFuncTreeAsync_dataset.getValue('pagepath');
			}
			var isSameId = false;
			while(rec) {
				if(rec.getValue('id')==currentId && rec!=getDataset().record){
					isSameId = true;
					break;
				}
			  	rec=rec.nextUnit;
			}
			if(currentId&&isSameId){
				alert('�ñ���Ѵ���!');
				return false;
			}else{
				var isSameId = false;
				var rec=getDataset().firstUnit;
				while(rec) {
					if(rec.getValue('pagepath')==btname && rec!=getDataset().record){
						isSameId = true;
						break;
					}
				  	rec=rec.nextUnit;
				}
				if(!(btname==""||!btname)&&isSameId){
					alert('�ð�ť��ַ�Ѵ���!');
					return false;
				}else return true;
			}
			
			
			
			
		}
		
		var buttonflag=true;
		function buttonSave_postSubmit(button){
            buttonflag=false;
            subFlag=false;
			subwindow_btWindow.close();
			subwindow_subPage.close();
		}
		
		function btWindow_floatWindow_afterClose(win){
			roleFuncTreeAsync_dataset.setFieldRequired("id",false);
			roleFuncTreeAsync_dataset.setFieldRequired("pageselect",false);
			//roleFuncTreeAsync_dataset.setFieldReadOnly("pagepath",false);
			roleFuncTreeAsync_dataset.setFieldRequired("btname",false);
			if(buttonflag)roleFuncTreeAsync_dataset.cancelRecord();
		    
		}
		function btWindow_floatWindow_afterHide(win){
			roleFuncTreeAsync_dataset.setFieldRequired("id",false);
			roleFuncTreeAsync_dataset.setFieldRequired("pageselect",false);
			roleFuncTreeAsync_dataset.setFieldReadOnly("pagepath",false);
			roleFuncTreeAsync_dataset.setFieldRequired("btname",false);
      		if(buttonflag)roleFuncTreeAsync_dataset.cancelRecord();
		}
		
		function sbtnSave_onClick(){
			var v1=$("#editor_id",$("#signWindow")).validatebox('isValid');
			var rec=getDataset().firstUnit;
			var currentId = getDataset().getValue('id');
			var isSameId = false;
			while(rec) {
				if(rec.recordState !='discard'&&rec.getValue('id')==currentId && rec!=getDataset().record){
					isSameId = true;
					break;
				}
			  	rec=rec.nextUnit;
			}
			//getDataset().updateRecord();
			if(isSameId){
				alert('�ñ���Ѵ���!');
			}
			if(v1&&!isSameId){
				if(getDataset().getValue('isdirectory')!='1' && $.trim(getDataset().getValue('pagepath'))==''){
					alert('��Ŀ¼ʱ����ָ��ҳ��·��!');
					return;
				}
			
				//�����ļ���ʱ��ǿ���ļ���ͼ��
				syncIcon();
				pagepathBak='';
				tmpSaveFlag = true;
				subwindow_signWindow.close();
			}
		}
		
		function getDataset(){
			return roleFuncTreeAsync_dataset;
		}
			
		
		function doRefresh(){
			roleFuncTreeAsync_dataset.flushData(roleFuncTreeAsync_dataset.pageIndex);
		}
		
		function initCallGetter_post(){
			roleFuncTreeAsync_dataset.setParameter('mode',2);
			doRefresh();
			initMenu();
			// ��ʱ���һ���Լ�������һ�β�ѡ���κ����ݵ�bug
			setTimeout(function(){$('#datatable2').treegrid('select',getDataset().getValue('_id'));},200);
		}	
		
		function btnNew_onClick(){
			buttonflag=true;
			var pagepath=roleFuncTreeAsync_dataset.getValue('pagepath');
			var funType=roleFuncTreeAsync_dataset.getValue('funcType');
			if(funType=='1'){
				alert("��ѡ��Ϊ������Դ������������������Դ��");
				return ;
			}else{
				if(!pagepath){
					alert("��ѡ�е�Ϊ�˵�Ŀ¼����������ҳ�������ӹ�����Դ��");
					return ;
				}
			}
			var id=roleFuncTreeAsync_dataset.getValue('id');		
			roleFuncTreeAsync_dataset.insertRecord('child');
			//funcClass�������ֹ�����Դ��0Ϊ��ť��1Ϊҳ�棬3Ϊ���������û�����ģ�����棩
			roleFuncTreeAsync_dataset.setValue('funcClass',0);
			roleFuncTreeAsync_dataset.setValue('pid',id);
			roleFuncTreeAsync_dataset.setValue('location',isTopMode?'2':'1');
			roleFuncTreeAsync_dataset.setValue('isdirectory','0');
			roleFuncTreeAsync_dataset.setValue('status','1');
			roleFuncTreeAsync_dataset.setValue('iconCls','icon-exten-info');
			//��ť����Դ����Ϊ1,����ҳ�����Դ����Ϊ0���߲�д��
			roleFuncTreeAsync_dataset.setValue('funcType','1');
			roleFuncTreeAsync_dataset.setFieldRequired("id",true);
			roleFuncTreeAsync_dataset.setFieldRequired("btname",true);
			roleFuncTreeAsync_dataset.setFieldReadOnly("pagepath",true);
			subwindow_btWindow.show();
		}
		
		function prepareInsert(asChild,isDir){
			//����������ʱ���ڵ��Ƿ�ΪĿ¼
			if(asChild && getDataset().getValue('isdirectory')!='1'){
				alert('������ϼ�������Ŀ¼��');
				return;
			}
			
			getDataset().setFieldReadOnly('id',false);
			var pid = '0';
			try{
				pid = getDataset().getValue(asChild?'id':'pid');
			}catch(e){
			} 
			getDataset().insertRecord(asChild?'child':'after');
			getDataset().setValue('pid',pid);
			getDataset().setValue('location',isTopMode?'2':'1');
			getDataset().setValue('isdirectory',isDir?'1':'0');
			getDataset().setValue('status','1');
			getDataset().setValue('location',isTopMode?'2':'1');
			getDataset().setFieldReadOnly('pagepath',isDir);
			getDataset().setValue('funcType','0');
			roleFuncTreeAsync_dataset.setFieldRequired("id",true);
			subwindow_signWindow.show();
			//createInput();
			//���㵱ǰ��showseq
			var beforeseq = -1;
			var afterseq = -1;
			var finded = false;
			var rec=getDataset().firstUnit;
			while(rec) {
				if(rec.getValue('pid')==pid){
					var curSeqStr = rec.getValue('showseq');
					var curSeq = $.isNumeric(curSeqStr)?parseInt(curSeqStr):0;
					if(!finded && rec!=getDataset().record){
						beforeseq = curSeq;
					}else if(finded){
						afterseq = curSeq;
						break;
					}else{
						finded = true;
					}
				}
			  	rec=rec.nextUnit;
			}
			
			var seq;
			if(afterseq==beforeseq){
				seq=afterseq;
			}else{
				seq=beforeseq+1;
			}
			seq = seq<0?0:seq;
			getDataset().setValue('showseq',seq);
			
			sbtnUp.click();
			sbtnDown.click();
		}
		
		function btnEdit_onClick(){
			//getDataset().setFieldReadOnly('id',getDataset().record.recordState!='insert');//������¼�ɱ༭ID���ɼ�¼������Ϊfalse
			var funClass=roleFuncTreeAsync_dataset.getValue('funcClass');
			var pid=roleFuncTreeAsync_dataset.getValue('_parentId');	
			if(funClass=='0'){
				var pagepath=roleFuncTreeAsync_dataset.getValue('pagepath');
				roleFuncTreeAsync_dataset.setValue('pageselectName',pagepath);		
				subwindow_btWindow.show();
				return ;
			}
			if(funClass=='1'){
				var pagepath=roleFuncTreeAsync_dataset.getValue('pagepath');
				roleFuncTreeAsync_dataset.setValue('pageselectName',pagepath);				
				subwindow_subPage.show();
				return ;
			}
			roleFuncTreeAsync_dataset.setFieldRequired("id",true);
			getDataset().setFieldReadOnly('pagepath',getDataset().getValue('isdirectory')=='1');
			var pagepath=roleFuncTreeAsync_dataset.getValue('pagepath');
			roleFuncTreeAsync_dataset.setValue('pageselectName',pagepath);		
			subwindow_signWindow.show();
		}
		
		function doClose(){
			if(!tmpSaveFlag){
				roleFuncTreeAsync_dataset.cancelRecord();
			}
			syncIcon();
			tmpSaveFlag = false;
		}
		
		function signWindow_floatWindow_afterClose(){
			roleFuncTreeAsync_dataset.setFieldRequired("id",false);
			doClose();
		}
		
		function signWindow_floatWindow_afterHide(){
			roleFuncTreeAsync_dataset.setFieldRequired("id",false);
			doClose();
		}
		
		function isChanged(){
			var re = getDataset().modified;
			if(!re){
				var rec=getDataset().firstUnit;
				while(rec) {
					if(rec.recordState!='none'){
						re = true;
						break;
					}
				  	rec=rec.nextUnit;
				}
			}
			return re;
		}
		
		function sbtnSwitch_onClick(){
			if(isChanged()){
				if(confirm('��⵽��δ����ļ�¼���л��˵������±����ʧ���Ƿ�ǿ���л�?')){
					switchConfirm();
				}
			}else{
				switchConfirm();
			}
		}
		
		function switchConfirm(){
			getDataset().setParameter('mode',isTopMode?'1':'2');
			doRefresh();
			$('#sbtnSwitch>span>span').text(isTopMode?'�л�������������':'�л���������˵�');
			isTopMode = !isTopMode;
		}
		
		function btnSave_postSubmit(){
			alert('����ɹ���');
			doRefresh();
		}
		
		var pagepathBak='';
		
		function isdirectory_DropDown_onSelect(dropdown,record,editor){
			var foo = record.getValue('data');
			getDataset().setValue('isdirectory',foo);
			if(foo=='1'){
				pagepathBak = getDataset().getValue('pagepath');
				getDataset().setValue('pagepath','');
			}else{
				getDataset().setValue('pagepath',pagepathBak);
			}
			getDataset().setFieldReadOnly('pagepath',foo=='1');
		}
		
		function sbtnRemove_onClick(){
			var pid = getDataset().getValue('pid');
			var afterRecord = null;
			
			var rec = getDataset().firstUnit;
			var arr = new Array();
			while(rec) {
				if(rec.getValue('pid')==pid && rec.recordState!='delete'){
					arr.push(rec);
				}
			  	rec=rec.nextUnit;
			}
			sortByShowSeq(arr);
			var index = -1;
			$.each(arr,function(i,v){
				if(v===getDataset().record){
					index = i;
					return false;
				}
			});
			
			if(arr.length>1){
				afterRecord = arr[(index==(arr.length-1))?index-1:index+1];
			}else{
				//ѡ�и�Ŀ¼
				afterRecord = getDataset().find(['id'],[pid]);
			}
			btnRemove.click();
			
			if(afterRecord){
				getDataset().setRecord(afterRecord);
			}
		}
	</script>
</@CommonQueryMacro.page>