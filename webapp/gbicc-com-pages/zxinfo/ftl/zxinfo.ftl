<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign customerNum=RequestParameters["customerNum"]?default("")>
<#assign loanCardNum=RequestParameters["loanCardNum"]?default("")>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="������Ԥ�����������б�">
	<@CommonQueryMacro.CommonQuery id="zxinfo" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="datatable2"   readonly="true"  fieldStr="indexName,indexValue,fdReportdate" paginationbar="btExpExcel"/>
	</@CommonQueryMacro.CommonQuery>
	
	<@CommonQueryMacro.CommonQuery id="zxinfodata" init="false" submitMode="selected" navigate="false">
			<#assign jzyear=''>
			<#assign caliber=''>
			<#assign repno=''>
			<table align="left" width="100%">
			    <tr>
					<td>
						<@CommonQueryMacro.Group id="group22" label="" colNm=4  
						fieldStr="fdReportdate,indexName"/>
					</td>
				</tr>
			</table>
	</@CommonQueryMacro.CommonQuery>
	
	<style>
	div.form1{width:35%;
		height:400px;
		text-align:center;
		border:1px solid #0099CC;
		float:left;
		margin:40px 5% 2px 5%;
		}
	div.clear{
		clear:both;
		}
	span.style1{
		color:red;
	}
	</style>	
	<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts-more.js"></script>


<div id="claer" style="clear:both"></div>
<div id="container" class="form1" style="width: 90%;"></div>
	<script language="JavaScript">
	var indexId;
	var fdReportdate;
	var indexName;
	var loanCardNum='${loanCardNum}';
	function initCallGetter_post(){
		
		zxinfodata_dataset.setFieldReadOnly("fdReportdate",true);
		zxinfodata_dataset.setFieldReadOnly("indexName",true);
	}
	
	function  datatable2_onDbClick(record,index){
		indexId=record.getValue("indexId");
		fdReportdate=record.getValue("fdReportdate");
		indexName=record.getValue("indexName");
		zxinfodata_dataset.setValue("fdReportdate",fdReportdate);
		zxinfodata_dataset.setValue("indexName",indexName);
		zxinfodata_dataset.setValue("indexId",indexId);
		DBCheck(fdReportdate,indexId,indexName,loanCardNum);
	}

	function DBCheck(fdReportdate,indexId,indexName,loanCardNum){
		 var customerNum='${customerNum}';
		 $.messager.progress({title:'���Ժ�',msg:'Loading...'});
		 	//�첽�ύ����
				$.ajax({								
					url :"${contextPath}/char/ZxinfoGetHigtCharServlet",
			        type : "post",
					data:{
						fdReportdate:fdReportdate,
						indexId:indexId,
						customerNum:customerNum,
						indexName:indexName,
						loanCardNum:loanCardNum
					},
					success:function(data){
					var dataJson=eval("("+data+")");
						 //�˴���������  
	                     $('#container').highcharts({  
					        chart:{  
					             defaultSeriesType: 'line',//ͼ������ʾ���ͣ�line,spline,scatter,splinearea bar,pie,area,column��  
					        },  
					        title:{  
					            text: '������Ϣ��ͼ',//������  
					                x: -20 //center  
					        },  
					        xAxis: {   //������  
					               categories: dataJson.listXdata //��̬����
					        },  
					      	yAxis: {  
					           	title: {  
					           	text: '' //������  
					               },  
					          	plotLines: [{  //��������  
						            value: 0,  
						          	width: 1,  
						           	color: 'red'  
		             			}]  
					     	},  
				         	tooltip: { //���ݵ����ʾ��  
					        	formatter: function() { //formatter��ʽ������  
						          	return '<b>'+ this.series.name +'</b><br/>'+  
						           	this.x +': '+ this.y;  
			            		}  
					        },
					        credits:{
						        text:'',
						        href:''
						   	},
					      	plotOptions:{
					       		column:{
						       		pointPadding:0.2,
						       		borderWidth:0
					       		}
					       	},    
					     	series:dataJson.data//��̬����
						});
	                     $.messager.progress('close');
					}
			});
	  }
	function btExpExcel_onClick(button){
		var customerNum='${customerNum}';
		var loanCardNum='${loanCardNum}';
		var proPath="${contextPath}"
		var reqPath=proPath+"/common/downloadZXInfoExcel";
		//����ǰ��������ʾ
		var params={
				customerNum : customerNum,
				loanCardNum : loanCardNum
		};
		//
		var form=$("<form>");//����һ��form����
		form.attr("style","display:none");
		form.attr("method","post");
		form.attr("action",reqPath);
		//
		var input1=$("<input>");
		input1.attr("type","hidden");
		input1.attr("name","customerNum");
		input1.attr("value",customerNum);
		form.append(input1);
		var input2=$("<input>");
		input2.attr("type","hidden");
		input2.attr("name","loanCardNum");
		input2.attr("value",loanCardNum);
		form.append(input2);
		//
		$("body").append(form);
		if(window.confirm('ȷ��Ҫ����Excel������')){
			form.submit();
		}
		form.remove();
	}
	</script>
</@CommonQueryMacro.page>