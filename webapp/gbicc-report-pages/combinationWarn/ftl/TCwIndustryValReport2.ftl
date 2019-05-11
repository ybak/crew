<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign bean=JspTaglibs["/WEB-INF/struts-bean.tld"] />
<#assign INDEX_CODE=RequestParameters["INDEX_CODE"]?default("")>
<#assign INDUSTRY_CODE=RequestParameters["INDUSTRY_CODE"]?default("")>
<#assign DATA_DATE=RequestParameters["DATA_DATE"]?default("")>
<@CommonQueryMacro.page title="��ҵ���ָ��">
<style>
div.form1{
	width:90%;
	height:350px;
	text-align:center;
	border:1px solid #0099CC;
	float:left;
	margin:5px 2px 2px 2px;
	margin-left: 40px;
	}
</style>
<table align="left" style="width: 100%">
	<tr><td>
      		<div id="report1" class="form1">������</div>
</td></tr>

</table>
<script type="text/javascript" src="${contextPath}/gbicc-pages/jquery-form.js"></script>
<script src="${contextPath}/templets/ui/js/chart/highcharts.js"></script>
<script src="${contextPath}/templets/ui/js/chart/highcharts-more.js"></script>
<script type='text/javascript' src='${contextPath}/dwr/interface/CComninationWarnDAjax.js'> </script>
<script language="JavaScript">

function creditRepotType1(id,dname,xlist,valList,defaultSeriesType){
	$(id).highcharts({  
        chart:{  
             defaultSeriesType: defaultSeriesType,//ͼ������ʾ���ͣ�line,spline,scatter,splinearea bar,pie,area,column��  
             marginRight: 125,//�������ҿ�϶  
             marginBottom: 25 //�������ҿ�϶  
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
        legend: {  
              layout: 'vertical',  
              align: 'right',  
              verticalAlign: 'middle',   
              borderWidth: 0  
             },   
         series:valList//��̬����
  			
         });
}

function initCallGetter_post(){
	
	var INDEX_CODE='${INDEX_CODE}';
	var INDUSTRY_CODE='${INDUSTRY_CODE}';
	var DATA_DATE='${DATA_DATE}';
	////ORG_CODE, PRODUCT_CODE, INDEX_CODE, INDUSTRY_CODE, GATHER_TYPE,String THRESHOLD_TYPE,
	var paramStr=[INDEX_CODE, INDUSTRY_CODE,DATA_DATE];
	CComninationWarnDAjax.industryValZXT2(paramStr,function(y){
		if(y.success=="true"){
			creditRepotType1('div#report1',window.parent.constWinTitleNameStr,y.jsonData1.listXdata,y.jsonData1.data,'line');
		}
	});
	
}

	
</script>
</@CommonQueryMacro.page>