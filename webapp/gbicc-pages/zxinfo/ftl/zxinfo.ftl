<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign customerNum=RequestParameters["customerNum"]?default("")>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="������Ԥ�����������б�">
	<@CommonQueryMacro.CommonQuery id="zxinfo" init="true" submitMode="current">
		<@CommonQueryMacro.DataTable id="datatable2"   readonly="false"  fieldStr="indexName,indexValue" />
	</@CommonQueryMacro.CommonQuery>
	
	<@CommonQueryMacro.CommonQuery id="zxinfodata" init="false" submitMode="selected" navigate="false">
			<#assign jzyear=''>
			<#assign caliber=''>
			<#assign repno=''>
			
			
			<table align="left" width="100%">
			    <tr>
					<td>
						<@CommonQueryMacro.Group id="group22" label="" colNm=6  
						fieldStr="caliber,project"/>
						<center>
           			           <@CommonQueryMacro.Button id="btModOrAdd23" />
						</center>
					</td>
				</tr>
			
			    
			</table>
	</@CommonQueryMacro.CommonQuery>
	
	
	<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts.js"></script>
	<script src="${contextPath}/templets/ui/js/chart/highcharts-more.js"></script>

	<div id="container" style="width: 800px; height: 300px; margin: 0 auto"></div>	
		






	<script language="JavaScript">

	function btModOrAdd23_onClickCheck(button){
		// var jzyear =TbCsmFinanceIndexTendencyData_dataset.getValue('jzyear');
		 var caliber =TbCsmFinanceIndexTendencyData_dataset.getValue('caliber');
		 var project  =TbCsmFinanceIndexTendencyData_dataset.getValue('project');
		 var customerNum='${customerNum}';
		 var arrys=new Array();
		 arrys= project.split(",");
		//console.log("length"+arrys.length);
		 if(arrys.length>5){
		    top.easyMsg.info("��ѡ�Ŀ�Ŀ���ܳ���5����");
		    return false;
		 }
		 var chart;  
		 
		 	//�첽�ύ����
				$.ajax({								
					url :"${contextPath}/char/GetHighCharServlet",
			        type : "post",
					data:{
					   caliber:caliber,
					   project:project,
					   customerNum:customerNum,
					   type:'index'	
					},
					success:function(data){
					
					var dataJson=eval("("+data+")");
					   
						 //�˴���������  
	                     $('#container').highcharts({  
					        chart:{  
					             defaultSeriesType: 'line',//ͼ������ʾ���ͣ�line,spline,scatter,splinearea bar,pie,area,column��  
					             marginRight: 125,//�������ҿ�϶  
					             marginBottom: 25 //�������ҿ�϶  
					        },  
					        title:{  
					            text: 'ָ�����Ʒ�����ͼ',//������  
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
					        legend: {  
					              layout: 'vertical',  
					              align: 'right',  
					              verticalAlign: 'top',  
					              x: -10,  
					              y: 100,  
					              borderWidth: 0  
					             },   
					         series:dataJson.data//��̬����
					         });
					}
				});
	     
	 
	  }

	</script>
</@CommonQueryMacro.page>