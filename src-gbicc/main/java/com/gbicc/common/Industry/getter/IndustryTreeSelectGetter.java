package com.gbicc.common.Industry.getter;

/**
 *
 */


import java.util.ArrayList;
import java.util.List;

import com.gbicc.common.Industry.entity.IndustryInfo;
import com.huateng.commquery.process.call.BaseCallGetter;
import com.huateng.commquery.result.Result;
import com.huateng.commquery.result.ResultMng;
import com.huateng.ebank.business.common.BaseDAOUtils;
import com.huateng.ebank.business.common.bean.TreeNode;
import com.huateng.ebank.framework.operation.orm.HQLDAO;
import com.huateng.exception.AppException;


/**
 * Title: HelloWorldHistoryGetter Description: Copyright: Copyright (c) 2008
 * Company: Shanghai Huateng Software Systems Co., Ltd.
 *
 * @author shen_antonio
 * @version 1.1, 2008-5-26
 */
public class IndustryTreeSelectGetter extends BaseCallGetter {

	@Override
	public Result call() throws AppException {
		int totalPage = 1;
		int	isdirectory=0;
		List list = new ArrayList();
		List returnList = new ArrayList();
		HQLDAO dao = BaseDAOUtils.getHQLDAO();
        String id = getCommQueryServletRequest().getParameter("_id");
        if(id==null) {
            id = "0";
        }
		String query = "from IndustryInfo t where t.lastdirectory='"+id+"' ";
		
		query += " order by t.id";
		list = dao.queryByQL2List(query);
		TreeNode node = null;
		for (int i = 0; i < list.size(); i++) {
			IndustryInfo Industry_info = (IndustryInfo) list.get(i);
			node = new TreeNode();
			node.setAttributes(Industry_info);
			node.setId(Industry_info.getId()+"");
			node.setText(Industry_info.getFuncname());
			node.setPid(String.valueOf(Industry_info.getLastdirectory()));
//			node.setIconCls(Industry_info.getIconCls());

			if (Industry_info.getIsdirectory()==0) {
			    node.setCanSelected(true);
				node.setHasChild(false);
			} else {
			    node.setCanSelected(false);
			    node.setHasChild(true);
			}
			returnList.add(node);
		}
		ResultMng.fillResultByList(getCommonQueryBean(), getCommQueryServletRequest(), returnList, getResult());
		List content = new ArrayList();
		content.add(returnList);
		result.setContent(returnList);
		result.getPage().setTotalPage(totalPage);
		result.init();
		return result;
	}

}
