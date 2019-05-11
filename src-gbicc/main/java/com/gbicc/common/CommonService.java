package com.gbicc.common;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.gbicc.bpm.SpringContextHolder;
import com.huateng.ebank.entity.dao.mng.ROOTDAO;
import com.huateng.ebank.entity.dao.mng.ROOTDAOUtils;
import com.huateng.ebank.framework.exceptions.CommonException;
import com.huateng.ebank.framework.util.ApplicationContextUtils;

public class CommonService {
	protected CommonService() {
	}

	public synchronized static CommonService getInstance() {
		return (CommonService) ApplicationContextUtils
				.getBean(CommonService.class.getSimpleName());
	}
	
	public JdbcTemplate getJdbcTempldate(){
		return SpringContextHolder.getBean(JdbcTemplate.class);
	}
	
	public Object  findSqlOneBySpringJdbc(String sql,Class<?> requiredType){
		return getJdbcTempldate().queryForObject(sql, requiredType);
	}
	
	@SuppressWarnings("rawtypes")
	public List findSqlListBySpringJdbc(String sql,Class<?> mappedClass){
		return getJdbcTempldate().query(sql, BeanPropertyRowMapper.newInstance(mappedClass));
	}
	
	@SuppressWarnings("rawtypes")
	public List findSqlSimpleListBySpringJdbc(String sql,Class<?> elementType){
		return getJdbcTempldate().queryForList(sql, elementType);
	}

	public ROOTDAO dao() {
		return ROOTDAOUtils.getROOTDAO();
	}
	
	public void save(Object obj) throws CommonException{
		 dao().save(obj);
	}
	
	public void update(Object obj) throws CommonException{
		 dao().update(obj);
	}
	
	public void delete(Object obj) throws CommonException{
		 dao().delete(obj);
	}
	
	public int executeHQL(String hql){
		return dao().executeHQL(hql);
	}
	
	public int executeSQL(String sql) throws CommonException{
		return dao().executeSql(sql);
	}
	
	public Object queryOneHQL(String hql){
		return dao().queryOneHQL(hql);
	}
	
	@SuppressWarnings("rawtypes")
	public List queryListHQL(String hql){
		return dao().queryListHQL(hql);
	}
	
	@SuppressWarnings("rawtypes")
	public List queryListSql(String sql,Class clz) throws CommonException{
		return dao().executeSql(sql,clz);
	}
}