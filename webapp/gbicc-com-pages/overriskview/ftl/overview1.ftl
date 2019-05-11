<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="��ǩҳ">
<style>
	div.divform1{
		border:1px solid black;
		min-width:1200px;
		min-height:800px;
		margin:20px 20px 20px 20px;
		float:none;
		clear:both;
	}
	div.divform2{
		width:80%;
		height:400px;
		margin:20px auto;
		text-align:center;
		border:1px solid #416AA3;
		padding:30px 10px 10px 10px;
	}
	div.divform3{
		width:46%;
		height:260px;
		float:left;
		text-align:left;
		margin: 0 0 0 50px;
		padding:60px 0 0 0
	}
	div.divform4{
		width:32.5%;
		height:360px;
		float:left;
		border:1px solid #416AA3;
		margin:20px 0 10px 5px;
		text-align:center;
		padding:15px 0 30px 0
	}
	span.form{
		font-size:140%;
		font-weight:bold;
		margin-left:30px;
	}
	div.fxsm{
		margin:0px 10px 0 0;
		width:280px;
	}
	div.tjqj{
		margin:0 0 0 20px;
	}
	div.hrdiv{
		width:1100px;
		height:1px;
		border-top:1px solid #E5E5E5;
		margin-bottom:5px
	}	
</style>
	<@CommonQueryMacro.CommonQuery id="in1" init="true" submitMode="current" >
			<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" colNm=4 fieldStr="deptName,customerManagerName,startDt,warnLevel,endDt" showButton="false" />
			<center><@CommonQueryMacro.Button id="btQuery"/>&nbsp;&nbsp;&nbsp;&nbsp;<@CommonQueryMacro.Button id="btRest"/></center>
 	</@CommonQueryMacro.CommonQuery>
 		<!-- javascript -->
	<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts-more.js"></script>
 	<div id="1" class="divform2">�ͻ����Ԥ���ȼ�</div>
	<script>
		function initCallGetter_post(){
			if(user_info.roleId=="601"){
				in1_interface_dataset.setFieldReadOnly("customerManagerName",true);
				in1_interface_dataset.setFieldReadOnly("deptName",true);
			}
			var deptCd;
			var startDt;
			var endDt;
			var warnLevel;
			var customerManager;
			drawpict(startDt,endDt,customerManager,deptCd,warnLevel);
		}
		function customerManagerName_DropDown_beforeOpen(dropDown){

			var deptCd = in1_interface_dataset.getValue('deptCd');//���ݵ�һ��selectId��õ�һ��selectֵ
			if(!deptCd){in1_interface_dataset.setValue('customerManagerName','');in1_interface_dataset.setValue('customerManager',''); return "��ѡ�����!";}//�жϵ�һ��select��ֵ�Ƿ�Ϊ�գ����Ϊ��ֱ�ӷ���һ���ַ���
			if(user_info.roleId=="601"){
				TlrInfo_DropDownDataset.setParameter("tlrno",user_info.userId); 
			}
			TlrInfo_DropDownDataset.setParameter("brcode",deptCd); 
			TlrInfo_DropDownDataset.setParameter("flag","yes");
			customerManagerName_DropDown.cached=false;//��qGroupId�����뻺��
		}
		function deptName_DropDown_onSelect(dropDown,record,editor){
			in1_interface_dataset.setValue('customerManagerName','');
			in1_interface_dataset.setValue('customerManager','');
			return true;
		}
		function btRest_onClick(button){
			in1_interface_dataset.clearData();
		}
		function btQuery_onClick(button){
			var deptCd;
			var startDt;
			var endDt;
			var warnLevel;
			var customerManager;
			deptCd=in1_interface_dataset.getValue("deptCd");
			startDt=in1_interface_dataset.getValue("startDt");
			endDt=in1_interface_dataset.getValue("endDt");
			warnLevel=in1_interface_dataset.getValue("warnLevel");
			customerManager=in1_interface_dataset.getValue("customerManager");
			if((startDt>endDt)||(startDt!=null&&endDt==null)||(startDt==null&&endDt!=null)||(startDt!=''&&endDt=='')||(startDt==''&&endDt!='')){
				alert("��������ȷ�����ڷ�Χ");
				return false;
			}
			drawpict(startDt,endDt,customerManager,deptCd,warnLevel);
		}
		function drawpict(startDt,endDt,customerManager,deptCd,warnLevel){
			$.messager.progress({title:'���Ժ�',msg:'��������...'});
			$.ajax({
				url :"${contextPath}/char/overriskviewHigtCharServlet",
		        type : "post",
				data:{
					customerManager:customerManager,
					deptCd:deptCd,
					startDt:startDt,
					endDt:endDt,
					warnLevel:warnLevel,
					roleId:user_info.roleId,
					orgId:user_info.orgId,
					userId:user_info.userId
				},
				success:function(data){
					var dataJson=eval("("+data+")");
					$('div#1').highcharts({  
				        chart:{  
				          	type:'line'
				        },  
				        credits:{
				        	text:'',
				        	href:''
				        },
				        title:{  
				            text: '�ͻ����Ԥ���ȼ�',						//������  
				        }, 
				        credits:{text:"www.gbicc.net"},
				        xAxis:{   										//������  
				        	categories: dataJson.listXdata,  			//��̬����
				        	lineWidth:0
				        },  
				     	yAxis:{  
							lineWidth:0,
							min:0
				       	},
				      	tooltip: { 										//���ݵ����ʾ��  
				        },  
				        legend: {  
				       	},   
				        series:dataJson.data  							//��̬����
					 });
					$.messager.progress('close');
				}
			});
		}
	</script>
</@CommonQueryMacro.page>