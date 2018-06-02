package org.iii.www.dao;




import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import org.iii.www.util.ArrayListRowMaper;
import org.iii.www.util.MyRowMapperResultSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;


/**
 *  繼承 JdbcDaoSupport 可以藉由 getJdbcTemplate 取得 applicationContext 配置的 jdbcTemplate 
 * @author User
 *
 */
@Repository
public class JDBCtemplateDemo  extends JdbcDaoSupport{
	
	@Autowired
	private DataSource dataSource;

	@PostConstruct
	private void initialize() {
		setDataSource(dataSource);
	}
	/**
	 * 取得資料表 欄位與資料 
	 * @return List<Arraylist<String>> List[0] 為欄位名稱   
	 */
	public List<ArrayList<String>> getAllwithColumns() {
		List<ArrayList<String>> list =
				(List<ArrayList<String>>) getJdbcTemplate().query("select stitle FROM RestaUrant", new MyRowMapperResultSet(new ArrayListRowMaper()));
		System.out.println(list.size());
		return list;
		
	}

	
	
}
 