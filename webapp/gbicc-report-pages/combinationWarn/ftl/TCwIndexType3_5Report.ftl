<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<@CommonQueryMacro.page title="ȫ��">
<style>
div.form1{
	width:90%;
	height:400px;
	text-align:center;
	border:1px solid #0099CC;
	float:left;
	margin:5px 2px 2px 2px;
	margin-left: 40px;
	}

</style>
<table align="left">
<tr><td align="center">
	<@CommonQueryMacro.CommonQuery id="TCwCreditAssetsMonitor3" init="false" submitMode="current" >
						<@CommonQueryMacro.Interface id="interface" label="�������ѯ����" fieldStr="indexName" labelwidth="200" showButton="false" />
	</@CommonQueryMacro.CommonQuery>
						<@CommonQueryMacro.Button id="btHandle" />
	</td></tr>
	<tr><td>
      		<div id="report1" class="form1">������</div>
</td></tr>
<tr><td>
<@CommonQueryMacro.CommonQuery id="TCwCreditAssetsMonitor3" init="false" submitMode="current">
						<@CommonQueryMacro.DataTable id="datatable1" paginationbar="" maxRow="3" fieldStr="INDEX_CODE[70],INDEX_NAME[250],COLO[70],MONITOR_FRE[70],NOW_VAL[100],TOP_VAL[100],YC_VAL[100],BSQ[70],BYC[70],THRESHOLD1[70],THRESHOLD2[70]"  width="100%" hasFrame="true"/>
					</@CommonQueryMacro.CommonQuery>
	</td></tr>

</table>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
<script src="${contextPath}/templets/ui/js/chart/highcharts.js"></script>
<script src="${contextPath}/templets/ui/js/chart/highcharts-more.js"></script>
<script language="JavaScript">
function creditRepotType1(id,dname,xlist,valList,defaultSeriesType){
	$(id).highcharts({  
        chart:{  
             defaultSeriesType: defaultSeriesType//ͼ������ʾ���ͣ�line,spline,scatter,splinearea bar,pie,area,column��  
        },  
        title:{  
            text: dname,//������  
                x: -20 //center  
        },  
        credits:{text:'<span style="color:blue;font-size:12px"  title="���ͼ���������ʾ���������ͼ��">ʹ����ʾ</span>'},
        xAxis: {   //������  
        	//             categories: dataJson.listXdata ��̬����
        	categories:xlist
        },  
           yAxis: {  
           title: {  
             text: '��ֵ' //������  
               },  
               plotLines: [{  //��������  
            value: -100,  
             width: 1,  
             color: 'yellow'  
                }]  
              },  
             tooltip: { //���ݵ����ʾ��  
 				valueSuffix:''
        },  
       
         series:valList//��̬����
  			
         });
}

function btHandle_onClickCheck(button){
	var indexCode=TCwCreditAssetsMonitor3_interface_dataset.getValue("indexCode");
	var paramStr=["5",indexCode];
	AComninationWarnDAjax.warnValDDZXT(paramStr,function(y){
		if(y.success=="true"){
			creditRepotType1('div#report1',"һ����ҵ���ж�",y.jsonData1.listXdata,y.jsonData1.data,'line');
		}
	});
}
function datatable1_byc_onRefresh(cell,value,record) {
	if (record) {//�����ڼ�¼ʱ
		if(record.getValue("BYC")=="1"){
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/up.png' width='20' height='15' />";
		}else if(record.getValue("BYC")=="2"){
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/down.png' width='20' height='15' />";
		}else{
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/clo.png' width='20' height='15' />";
		}
	} else {//�������ڼ�¼ʱ
		cell.innerHTML="&nbsp;";
	}
}
function datatable1_bsq_onRefresh(cell,value,record) {
	if (record) {//�����ڼ�¼ʱ
		if(record.getValue("BSQ")=="1"){
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/up.png' width='20' height='15' />";
		}else if(record.getValue("BSQ")=="2"){
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/down.png' width='20' height='15' />";
		}else{
			cell.innerHTML="<img src='${contextPath}/templets/lib/functionTree/imgs/clo.png' width='20' height='15' />";
		}
	} else {//�������ڼ�¼ʱ
		cell.innerHTML="&nbsp;";
	}
}
function initCallGetter_post(){
	
	TCwCreditAssetsMonitor3_dataset.setParameter("GATHER_TYPE","5");
	TCwCreditAssetsMonitor3_dataset.flushData(TCwCreditAssetsMonitor3_dataset.pageIndex);
	
	////ORG_CODE, PRODUCT_CODE, INDEX_CODE, INDUSTRY_CODE, GATHER_TYPE,String THRESHOLD_TYPE,
	/*
	AComninationWarnDAjax.warnValDDZXT("5",function(y){
		if(y.success=="true"){
			creditRepotType1('div#report1',"һ����ҵ���ж�",y.jsonData1.listXdata,y.jsonData1.data,'line');
		}
	});
	*/
	
}
</script>
<script type='text/javascript' src='${contextPath}/dwr/interface/AComninationWarnDAjax.js'> </script>
</@CommonQueryMacro.page>