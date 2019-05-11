<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />

<#assign userInfo_=Session["USER_SESSION_INFO"] />

<@CommonQueryMacro.page title="������������Ϣ">
	<@CommonQueryMacro.CommonQuery id="LoanAccountColl" init="true" submitMode="selected">
		<@CommonQueryMacro.Interface id="LoanAccountInterface" label="�������ѯ����" showButton="false" colNm=8 labelwidth="100"/>
		<div align="center" style="margin-bottom:10px">
			<@CommonQueryMacro.InterfaceButton desc="��ѯ" />
			<@CommonQueryMacro.SimpleButton id="btnReset" desc="����" icon="icon-reload" />
		</div>
		<@CommonQueryMacro.DataTable id="LoanAccountTable" readonly="true" paginationbar="btnDistribute,btnDistributes,btnDistributeAll" 
		fieldStr="select,loanacno[150],custname[150],collInfo[200],prodid[100],prodname[150],acflag[80],acflag2[100],riskflag[80],overbal[100],operidName[100],bankidName[100]" width="100%" hasFrame="true"/>
	</@CommonQueryMacro.CommonQuery>
	<@CommonQueryMacro.FloatWindow id="distributeFW" modal="true" label="�����������(����)" 
	resize="true" minimize="false" width="900" height="480" maximize="true" closure="true" show="false" defaultZoom="normal">
	<table>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.CommonQuery id="LoanAccountColl" init="true" submitMode="selected">
					<@CommonQueryMacro.Group id="distributeGroup" label="������Ϣ" colNm=4 labelwidth="150" 
					fieldStr="loanacno,bankidName,prodid,prodname,custid,custname,acflag,riskflag"/>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.CommonQuery id="LoanAccountCollDistribute" init="false" submitMode="current">
					<@CommonQueryMacro.Group id="distributeGroup" label="������Ϣ" colNm=4 labelwidth="150" 
					fieldStr="oldCheckUser,checkUser,distDt,remark,operOrgName,operUserName"/>
					<br/><center>
						<@CommonQueryMacro.Button id="btnSubmit" />
						<@CommonQueryMacro.Button id="btnSubmitTrue" />
						<@CommonQueryMacro.Button id="btnCancel" />
					</center>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
	</table>
	</@CommonQueryMacro.FloatWindow>
	<@CommonQueryMacro.FloatWindow id="muchDistributeFW" modal="true" label="�����������(����)" 
	resize="true" minimize="false" width="1000" height="650" maximize="true" closure="true" show="false" defaultZoom="normal">
	<div name='group1' class="group" style="width:98%">
	    <table width="100%" class="grouptable" height="100%" style="table-layout: auto;">
	    	<tr>
	    		<td align="left" nowrap style="width:45%">
					<@CommonQueryMacro.CommonQuery id="OldCheckUser" init="true" submitMode="all">
						<@CommonQueryMacro.DataTable id="OldCheckUserTable" title="����ǰ������" height="100" simpleMode="true" nowrap="true" readonly="true" pageCache="false" pagination="false"
							fieldStr="brcode[60],brname[150],tlrno[70],tlrname[80]" width="100%" hasFrame="true"/>
					</@CommonQueryMacro.CommonQuery>
				</td>
				<td width="width:10%"></td>
				<td class="labeltd" valign=center align="left" nowrap style="width:45%">
				</td>
	    	</tr>
	    	<tr>
	    		<td>
	    			&nbsp;
	    		</td>
	    	</tr>
	        <tr id="text_TR" fieldId="text">
	        	<td align="left" nowrap style="width:45%">
					<@CommonQueryMacro.CommonQuery id="SelectCheckUser" init="true" submitMode="current">
						<@CommonQueryMacro.DataTable id="SelectCheckUserTable" title="��ѡ�������" height="150" simpleMode="true" nowrap="true" readonly="true" pageCache="false" pagination="false"
							fieldStr="select,brcode[60],brname[150],tlrno[70],tlrname[80]" width="100%" hasFrame="true"/>
					</@CommonQueryMacro.CommonQuery>
				</td>
				<td width="width:10%">
					<center>
						<@CommonQueryMacro.SimpleButton id="btn5" desc="����->" onclick="addMoveOption()" icon="" plain="false" />
					</center>
					<br/>
					<center>
						<@CommonQueryMacro.SimpleButton id="btn6" desc="<-ɾ��" onclick="delMoveOption()" icon="" plain="false" />
					</center>
				</td>
				<td valign=center align="left" nowrap style="width:45%">
					<@CommonQueryMacro.CommonQuery id="CheckUser" init="true" submitMode="all">
						<@CommonQueryMacro.DataTable id="CheckUserTable" title="���ɺ������" height="150" simpleMode="true" nowrap="true" readonly="true" pageCache="false" pagination="false"
							fieldStr="select,brcode[60],brname[150],tlrno[70],tlrname[80]" width="100%" hasFrame="true"/>
					</@CommonQueryMacro.CommonQuery>
				</td>
			</tr>
	     </table>
	</div>
	<table>
		<tr>
			<td>
				<@CommonQueryMacro.CommonQuery id="LoanAccountCollDistribute" init="false" submitMode="current">
					<@CommonQueryMacro.Group id="muchDistributeGroup" label="������Ϣ" colNm=4 labelwidth="150" 
					fieldStr="distPrinciple,distQuantity,distDt,remark,operUserName,operOrgName"/>
					<br/><center>
						<@CommonQueryMacro.Button id="btnMuchSubmit" />
						<@CommonQueryMacro.Button id="btnMuchSubmitTrue" />
						<@CommonQueryMacro.Button id="btnMuchSubmitAll" />
						<@CommonQueryMacro.Button id="btnMuchSubmitAllTrue" />
						<@CommonQueryMacro.Button id="btnMuchCancel" />
					</center>
				</@CommonQueryMacro.CommonQuery>
			</td>
		</tr>
	</table>
	</@CommonQueryMacro.FloatWindow>
<script>
	var submitWindow=null;
	var submitAllWindow=null;
	var distType="2";
	function initCallGetter_post(){
		$("a[id=btnSubmitTrue]").hide();
		$("a[id=btnMuchSubmitTrue]").hide();
		$("a[id=btnMuchSubmitAll]").hide();
		$("a[id=btnMuchSubmitAllTrue]").hide();
	}
	//��ѯ����������˰��������¼�
	function dutyid_DropDown_onKeyup(val){
		if(val.length>=0){
			return true;
		}
		return false;
	}
	//��ѯ����������˴�ǰ�¼�
	function dutyid_DropDown_beforeOpen(dropDown){
		var bank=LoanAccountColl_interface_dataset.getValue("bank");
		subAutoUserTree_DropDownDataset.setParameter("orgId",bank);
		dutyid_DropDown.cached=false;//��qGroupId�����뻺��
	}
	function btnMuchSubmitAll_onClick(){
		var record=CheckUser_dataset.getFirstRecord();
        if(!record){
        	top.easyMsg.info("��ѡ����ɺ�����ˣ�");
    		return;
        }
        var count=0;
        while(record){
        	count++;
			record=record.getNextRecord();
		}
		var distPrinciple=LoanAccountCollDistribute_dataset.getValue("distPrinciple");
		var distQuantity=LoanAccountCollDistribute_dataset.getValue("distQuantity");
		if(distPrinciple=="1" && count>distQuantity){
			top.easyMsg.info("ѡ�񡾱��η�������ƽ��ԭ��ʱ[���ɺ�����]�������ܴ���[���ɱ���]��");
    		return;
		}
		var vd=LoanAccountCollDistribute_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var orgId=user_info.orgId;
		var roleId="555";
		submitAllWindow=openSubWin("submitAllWindow","��������","/gbicc-pages/bpm/ftl/loan_account_duty_task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	function btnMuchSubmitAllTrue_onClickCheck(){
		var bank=LoanAccountColl_interface_dataset.getValue("bank");
		var acctNo=LoanAccountColl_interface_dataset.getValue("loanacno");
		var prodname=LoanAccountColl_interface_dataset.getValue("prodname");
		var custname=LoanAccountColl_interface_dataset.getValue("custname");
		var acflag=LoanAccountColl_interface_dataset.getValue("acflag");
		var acflag2=LoanAccountColl_interface_dataset.getValue("acflag2");
		var riskflag=LoanAccountColl_interface_dataset.getValue("riskflag");
		var dutyid=LoanAccountColl_interface_dataset.getValue("dutyid");
		var condition='{acctNo:"'+acctNo+'",prodname:"'+prodname+'",custname:"'+custname+'",acflag:"'+acflag+'",acflag2:"'+acflag2+'",riskflag:"'+riskflag+'",dutyid:"'+dutyid+'"}';
		LoanAccountCollDistribute_dataset.setParameter("condition",condition);
		LoanAccountCollDistribute_dataset.setParameter("bankid",bank);
		LoanAccountCollDistribute_dataset.setParameter("op","submit");
	}
	function btnDistributeAll_onClick(){
		var bank=LoanAccountColl_interface_dataset.getValue("bank");
		var bankName=LoanAccountColl_interface_dataset.getValue("bankName");
		var acctNo=LoanAccountColl_interface_dataset.getValue("loanacno");
		var prodname=LoanAccountColl_interface_dataset.getValue("prodname");
		var custname=LoanAccountColl_interface_dataset.getValue("custname");
		var acflag=LoanAccountColl_interface_dataset.getValue("acflag");
		var acflag2=LoanAccountColl_interface_dataset.getValue("acflag2");
		var riskflag=LoanAccountColl_interface_dataset.getValue("riskflag");
		var dutyid=LoanAccountColl_interface_dataset.getValue("dutyid");
		var dutyidName=LoanAccountColl_interface_dataset.getValue("dutyidName");
		if(bank==null || bank==""){
			top.easyMsg.info("���ڲ�ѯ���ȹ���Ҫȫ�����ɵľ����У�");
			return;
		}
		if(bank==bankName){
			top.easyMsg.info("������������Ч��");
			return;
		}
		if(dutyid && dutyid==dutyidName){
			top.easyMsg.info("���������������Ч��");
			return;
		}
		if(acctNo==null){
			acctNo="";
		}
		if(prodname==null){
			prodname="";
		}
		if(custname==null){
			custname="";
		}
		if(acflag==null){
			acflag="";
		}
		if(acflag2==null){
			acflag2="";
		}
		if(riskflag==null){
			riskflag="";
		}
		if(dutyid==null){
			dutyid="";
		}
		var condition='{acctNo:"'+acctNo+'",prodname:"'+prodname+'",custname:"'+custname+'",acflag:"'+acflag+'",acflag2:"'+acflag2+'",riskflag:"'+riskflag+'",dutyid:"'+dutyid+'"}';
		DWREngine.setAsync(false);
		var bool=true;
		var elimLoan="";
		var count=0;
		AccountDutyDistribute.dwrGetLoanAccountNos(bank,condition,distType,function(y){
			if(y[0]!=null && y[0]!=""){
				elimLoan=y[0];
			}
			if(y[1]==null || y[1]=="0"){
				bool=false;
			}else{
				count=y[1];
			}
		});
		if(bool){
			if(elimLoan!=""){
				top.easyMsg.info("���´����ʺ��ѷ��ͷ������룬�������뽫�ų���"+elimLoan);
			}
			$("a[id=btnMuchSubmitAll]").show();
			$("a[id=btnMuchSubmit]").hide();
			setPageFieldsNullFun();
			subwindow_muchDistributeFW.show();
			//���ط���ǰ�����
			OldCheckUser_dataset.setParameter("loanacnos",null);
			OldCheckUser_dataset.setParameter("flag","all");
			OldCheckUser_dataset.setParameter("type",distType);
			OldCheckUser_dataset.setParameter("condition",condition);
			OldCheckUser_dataset.setParameter("bankid",bank);
			OldCheckUser_dataset.flushData(1);
			//���ؿ�ѡ������
			SelectCheckUser_dataset.setParameter("orgId",bank);
			SelectCheckUser_dataset.setParameter("checkUserIds",null);
			SelectCheckUser_dataset.flushData(1);
			
			LoanAccountCollDistribute_dataset.setValue("distQuantity",count);
			TaskVariable.getSystemCurrentDate(null,function(y){
				LoanAccountCollDistribute_dataset.setValue("distDt",y);
			});
			LoanAccountCollDistribute_dataset.setValue("operUserId",'${userInfo_.tlrNo}');
			LoanAccountCollDistribute_dataset.setValue("operUserName",'${userInfo_.tlrName}');
			LoanAccountCollDistribute_dataset.setValue("operOrgId",'${userInfo_.brCode}');
			LoanAccountCollDistribute_dataset.setValue("operOrgName",'${userInfo_.brName}');
			LoanAccountCollDistribute_dataset.setFieldRequired("distPrinciple",true);
		}else{
			top.easyMsg.info("�û��������κο�ת�Ƶ����ݣ�");
		}
		DWREngine.setAsync(true);
	}
	//ȡ��
	function mushSubmitAllCancelFun(){
		LoanAccountCollDistribute_dataset.setParameter("taskAssignee",null);
		submitAllWindow.close();
	}
	//�ύ
	function muchSubmitAllFun(taskAssignee){
		LoanAccountCollDistribute_dataset.setParameter("taskAssignee",taskAssignee);
		btnMuchSubmitAllTrue.click();
	}
	function btnDistribute_onClick(){
		var record=LoanAccountColl_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
			}
			record=record.getNextRecord();
		}
		if(!(records.length>0)){
			top.easyMsg.info("��ѡ��Ҫ���ɵ�����");
			return;
		}
		if(records.length>1){
			top.easyMsg.info("�����������ʹ�á��������ɡ����ܣ�");
			return;
		}
		//�����ʺ��Ƿ��ѷ��ͷ�����������δ�����ɡ�
		var loanacno=records[0].getValue("loanacno");
		AccountDutyDistribute.dwrFindDistributeRuningProcess(loanacno,distType,function(y){
			if(y=="false"){
				setPageFieldsNullFun();
				subwindow_distributeFW.show();
				LoanAccountCollDistribute_dataset.setValue("oldCheckUser",records[0].getValue("collInfo"));
				LoanAccountCollDistribute_dataset.setFieldRequired("checkUser",true);
				TaskVariable.getSystemCurrentDate(null,function(y){
					LoanAccountCollDistribute_dataset.setValue("distDt",y);
				});
				LoanAccountCollDistribute_dataset.setValue("operUserId",'${userInfo_.tlrNo}');
				LoanAccountCollDistribute_dataset.setValue("operUserName",'${userInfo_.tlrName}');
				LoanAccountCollDistribute_dataset.setValue("operOrgId",'${userInfo_.brCode}');
				LoanAccountCollDistribute_dataset.setValue("operOrgName",'${userInfo_.brName}');
				LoanAccountCollDistribute_dataset.setValue("loanacnoId",loanacno);
			}else{
				top.easyMsg.info("�û����ʺ��ѷ��ͷ������룬��ȴ���˽�������ִ�в�����");
				return;
			}
		});
	}
	
	//������ǰ
	function bank_DropDown_beforeOpen(dropDown){
		subAutoOrgTree_DropDownDataset.setParameter("currentUserOrgId",user_info.orgId);
	}
	//�������
	function bank_DropDown_onKeyup(val){
		if(val.length>=0){
			return true;
		}
		return false;
	}
	
	//���ɺ������
	function checkUser_DropDown_beforeOpen(dropDown){
		var bankidId=LoanAccountColl_dataset.getValue("bankidId");//��ȡ������
		if(!bankidId){
			return "������Ϊ��,�޷����з��ɲ���!";
		}
		subAutoUserAndOrg_DropDownDataset.setParameter("orgId",bankidId);
		
		var oldCheckUser=LoanAccountCollDistribute_dataset.getValue("oldCheckUser");//��ȡ����ǰ�����˻���
		if(oldCheckUser.indexOf(",")>-1){
			var str=oldCheckUser.split(",");
			subAutoUserAndOrg_DropDownDataset.setParameter("currAssignee",str[1]);
		}else{
			subAutoUserAndOrg_DropDownDataset.setParameter("currAssignee","");
		}
		checkUser_DropDown.cached=false;//��qGroupId�����뻺��
	}
	//���ɺ�����˰��������¼�
	function checkUser_DropDown_onKeyup(val){
		if(val.length>=0){
			return true;
		}
		return false;
	}
	function btnDistributes_onClick(){
		var record=LoanAccountColl_dataset.getFirstRecord();
		var records=[];
		while(record){
			if(record.getValue("select")==true){
				records.push(record);
			}
			record=record.getNextRecord();
		}
		if(!(records.length>0)){
			top.easyMsg.info("��ѡ��Ҫ���ɵ�����");
			return;
		}
		if(records.length<2){
			top.easyMsg.info("�����������ʹ�á����ɡ����ܣ�");
			return;
		}
		var records2=records;
		for(var i=0;i<records.length;i++){
			for(var k=0;k<records2.length;k++){
				if(records[i].getValue("bankidId")!=records2[k].getValue("bankidId")){
					top.easyMsg.info("ֻ��ͬʱ����ͬһ�����µ�����");
					return;
				}
			}
		}
		var bool="false";
		DWREngine.setAsync(false);
		var loanacnos="";
		var orgId=records[0].getValue("bankidId");
		for(var i=0;i<records.length;i++){
			var loanacno=records[i].getValue("loanacno");
			loanacnos=loanacnos+loanacno+",";
			AccountDutyDistribute.dwrFindDistributeRuningProcess(loanacno,distType,function(y){
				if(y=="true"){
					bool="true";
				}
			});
		}
		if(bool=="false"){//�������ڣ���ʼ��ҳ��
			$("a[id=btnMuchSubmitAll]").hide();
			$("a[id=btnMuchSubmit]").show();
			setPageFieldsNullFun();
			subwindow_muchDistributeFW.show();
			//���ط���ǰ�����
			OldCheckUser_dataset.setParameter("loanacnos",loanacnos);
			OldCheckUser_dataset.setParameter("flag",null);
			OldCheckUser_dataset.setParameter("type",distType);
			OldCheckUser_dataset.flushData(1);
			//���ؿ�ѡ������
			SelectCheckUser_dataset.setParameter("orgId",orgId);
			SelectCheckUser_dataset.setParameter("checkUserIds",null);
			SelectCheckUser_dataset.flushData(1);
			
			LoanAccountCollDistribute_dataset.setValue("distQuantity",records.length);
			TaskVariable.getSystemCurrentDate(null,function(y){
				LoanAccountCollDistribute_dataset.setValue("distDt",y);
			});
			LoanAccountCollDistribute_dataset.setValue("operUserId",'${userInfo_.tlrNo}');
			LoanAccountCollDistribute_dataset.setValue("operUserName",'${userInfo_.tlrName}');
			LoanAccountCollDistribute_dataset.setValue("operOrgId",'${userInfo_.brCode}');
			LoanAccountCollDistribute_dataset.setValue("operOrgName",'${userInfo_.brName}');
			LoanAccountCollDistribute_dataset.setFieldRequired("distPrinciple",true);
		}else{
			top.easyMsg.info("�����ʺš�"+loanacno+"���ѷ��ͷ������룬��ȴ���˽�������ִ�в�����");
		}
		DWREngine.setAsync(true);
	}
	function initSel(val,selId){
        if(val!=null && val.length>0){
            var obj = document.getElementById(selId);
            var vals = val.split(";");
            for(var i=0;i<vals.length;i++){
                var tmp = vals[i];
                if(tmp!=null && tmp.length>0){
                    var tmps = tmp.split("=");
                    var opt = null;
                    if(tmps.length>1){
                        opt = new Option(tmps[1],tmps[0]);
                    }else{
                        opt = new Option(tmps[0],tmps[0]);
                    }
                    obj.options.add(opt);
                }
            }
        }
    }
	//����
    function addMoveOption(){
    	var record=SelectCheckUser_dataset.getFirstRecord();
    	var bool=false;
    	while(record){
			if(record.getValue("select")==true){
				bool=true;
				//����
				CheckUser_dataset.insertRecord("end");
				record.setValue("select",false);//����ǰ�ѹ�ѡ��ȡ��
				CheckUser_dataset.copyRecord(record);
				//ɾ��
				SelectCheckUser_dataset.setRecord(record);
				SelectCheckUser_dataset.deleteRecord();
			}
			record=record.getNextRecord();
		}
    	if(!bool){
    		top.easyMsg.info("���ȹ�ѡ���Ҫ���ӵļ���ˣ�");
    		return;
    	}
    }
	//ɾ��
	function delMoveOption(){
		var record=CheckUser_dataset.getFirstRecord();
    	var bool=false;
    	while(record){
			if(record.getValue("select")==true){
				bool=true;
				//����
				SelectCheckUser_dataset.insertRecord("end");
				record.setValue("select",false);//����ǰ�ѹ�ѡ��ȡ��
				SelectCheckUser_dataset.copyRecord(record);
				//ɾ��
				CheckUser_dataset.setRecord(record);
				CheckUser_dataset.deleteRecord();
			}
			record=record.getNextRecord();
		}
    	if(!bool){
    		top.easyMsg.info("���ȹ�ѡ�Ҳ�Ҫɾ���ļ���ˣ�");
    		return;
    	}
	}
	//����dataset�����ֶ�ֵΪNull
	function setPageFieldsNullFun(){
		var fieldName="";
		for(var i=0;i<LoanAccountCollDistribute_dataset.fields.length;i++){
			fieldName=LoanAccountCollDistribute_dataset.fields[i].name;
			if(fieldName.substring(0,1)!="_"){
				LoanAccountCollDistribute_dataset.setValue(fieldName,null);
			}
		}
	}
	function distributeFW_floatWindow_beforeClose(){
		LoanAccountCollDistribute_dataset.setFieldRequired("checkUser",false);
		CheckUser_dataset.flushData(1);
		return true;
	}
	function distributeFW_floatWindow_beforeHide(){
		LoanAccountCollDistribute_dataset.setFieldRequired("checkUser",false);
		CheckUser_dataset.flushData(1);
		return true;
	}
	function muchDistributeFW_floatWindow_beforeClose(){
		LoanAccountCollDistribute_dataset.setFieldRequired("distPrinciple",false);
		CheckUser_dataset.flushData(1);
		return true;
	}
	function muchDistributeFW_floatWindow_beforeHide(){
		LoanAccountCollDistribute_dataset.setFieldRequired("distPrinciple",false);
		CheckUser_dataset.flushData(1);
		return true;
	}
	function btnMuchSubmit_onClick(){
		var record=CheckUser_dataset.getFirstRecord();
        if(!record){
        	top.easyMsg.info("��ѡ����ɺ�����ˣ�");
    		return;
        }
        var count=0;
        while(record){
        	count++;
			record=record.getNextRecord();
		}
		var distPrinciple=LoanAccountCollDistribute_dataset.getValue("distPrinciple");
		var distQuantity=LoanAccountCollDistribute_dataset.getValue("distQuantity");
		if(distPrinciple=="1" && count>distQuantity){
			top.easyMsg.info("ѡ�񡾱��η�������ƽ��ԭ��ʱ[���ɺ������]�������ܴ���[���ɱ���]��");
    		return;
		}
		var vd=LoanAccountCollDistribute_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		var orgId=user_info.orgId;
		var roleId="555";
		submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	function btnMuchSubmitTrue_onClickCheck(){
		var record=LoanAccountColl_dataset.getFirstRecord();
		var loanacnos="";
		while(record){
			if(record.getValue("select")==true){
				loanacnos=loanacnos+record.getValue("loanacno")+",";
			}
			record=record.getNextRecord();
		}
        LoanAccountCollDistribute_dataset.setParameter("op","submit");
        if(loanacnos!=""){
        	loanacnos=loanacnos.substring(0,loanacnos.length-1);
	        LoanAccountCollDistribute_dataset.setParameter("loanacnos",loanacnos);
        }
	}
	//ȡ��
	function cancelFun(){
		LoanAccountCollDistribute_dataset.setParameter("taskAssignee",null);
		submitWindow.close();
	}
	//�ύ
	function submitFun(taskAssignee){
		LoanAccountCollDistribute_dataset.setParameter("taskAssignee",taskAssignee);
		var distQuantity=LoanAccountCollDistribute_dataset.getValue("distQuantity");
		if(distQuantity && distQuantity>1){
			btnMuchSubmitTrue.click();
		}else{
			btnSubmitTrue.click();
		}
	}
	function btnSubmit_onClick(){
		var orgId=user_info.orgId;
		var roleId="555";
		var checkUser=LoanAccountCollDistribute_dataset.getValue("checkUser");
		if(!checkUser){
			top.easyMsg.info("��ѡ����ɺ�����ˣ�");
			return false;
		}
		var vd=LoanAccountCollDistribute_dataset.validate();
		if(!vd){
			top.easyMsg.info("ҳ���д��ڲ��Ϸ����ֶΣ���������ύ��");
			return false;
		}
		submitWindow=openSubWin("submitWindow","��������","/gbicc-pages/bpm/ftl/task_assignee.ftl?orgId="+orgId+"&roleId="+roleId,"600","400");
	}
	function btnSubmitTrue_onClickCheck(){
		LoanAccountCollDistribute_dataset.setParameter("op","submit");
	}
	function btnReset_onClick(){
		LoanAccountColl_interface_dataset.clearData();
	}
 	//�ύ��ر�ҳ�棬ˢ�±���
	function btnSubmitTrue_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_distributeFW.close();
		flushCurrentPage();
	}
	function btnMuchSubmitTrue_postSubmit(button) {
		if(submitWindow){
			submitWindow.close();
		}
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_muchDistributeFW.close();
		flushCurrentPage();
		CheckUser_dataset.flushData(1);
	}
	function btnMuchSubmitAllTrue_postSubmit(button) {
		if(submitAllWindow){
			submitAllWindow.close();
		}
		button.url="#";
		top.easyMsg.info("�����ɹ���");
		subwindow_muchDistributeFW.close();
		flushCurrentPage();
		CheckUser_dataset.flushData(1);
	}
 	function btnCancel_onClick(){
 		subwindow_distributeFW.close();
 	}
 	function btnMuchCancel_onClick(){
 		subwindow_muchDistributeFW.close();
 	}
	//ˢ�µ�ǰҳ
	function flushCurrentPage() {
		LoanAccountColl_dataset.flushData(LoanAccountColl_dataset.pageIndex);
	}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/AccountDutyDistribute.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/TaskVariable.js'> </script>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
</@CommonQueryMacro.page>