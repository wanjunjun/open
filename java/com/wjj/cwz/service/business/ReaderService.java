package com.wjj.cwz.service.business;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.wjj.cwz.core.frame.Page;
import com.wjj.cwz.dao.SimpleHibernateDao;
import com.wjj.cwz.dao.business.ReaderDao;
import com.wjj.cwz.entity.Reader;
import com.wjj.cwz.service.CommonService;

/** 
 *
 * @author "wanjunjun"
 * @version 
 * @create 2013-5-9
 * 
 */
@Component
@Transactional
public class ReaderService extends CommonService{

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ReaderDao readerDao;
	
	@Override
	public SimpleHibernateDao getDao() {
		return readerDao;
	}
	
	public Page<Reader> getPage(Page<Reader> page, Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("from Reader b where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("readerId"))){
			sb.append("and b.readerId like concat('%',:readerId,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("type"))){
			sb.append("and b.type = :type ");
		}
		if(StringUtils.isNotBlank((String)values.get("description"))){
			sb.append("and b.description like concat('%',:description,'%') ");
		}
		return getPage(sb.toString(), page, values);
	}
	
	public List<Map> searchReader(Map<String, Object> values){
		StringBuilder sb = new StringBuilder();
		sb.append("select mr.ticket_id, mr.reader_ip, mr.reader_time, cd.name ");
		sb.append("from c_reader cr inner join mid_reader mr on cr.reader_ip = mr.reader_ip ");
		sb.append("left join c_depo cd on cr.depo = cd.id where 1=1 ");
		if(StringUtils.isNotBlank((String)values.get("readerIp"))){
			sb.append("and cr.reader_ip = :readerIp ");
		}
		if(StringUtils.isNotBlank((String)values.get("depoName"))){
			sb.append("and cd.name like concat('%',:depoName,'%') ");
		}
		if(StringUtils.isNotBlank((String)values.get("s_date"))){
			sb.append("and mr.reader_time >= :s_date ");
		}
		if(StringUtils.isNotBlank((String)values.get("e_date"))){
			sb.append("and mr.reader_time <= :e_date ");
		}
		return sqlQueryMap(sb.toString(), values);
	}
}
