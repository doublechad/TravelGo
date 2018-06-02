package org.iii.www.util;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;

public class MyRowMapperResultSet<T> extends RowMapperResultSetExtractor<T>{

	public MyRowMapperResultSet(RowMapper<T> rowMapper) {
		super(rowMapper);
	}
	@Override
	public List<T> extractData(ResultSet rs) throws SQLException {
		ResultSetMetaData rsmd = null;
		ArrayList<String> columns =new ArrayList<>();
		if(rs!=null){
			rsmd =rs.getMetaData();
			for(int i=1;i<=rsmd.getColumnCount();i++) {
				String name =rsmd.getColumnName(i);
				columns.add(name);
			}
		}		
		List<ArrayList<String>> lists =(List<ArrayList<String>>) super.extractData(rs);
		lists.add(0, columns);
	
		return (List<T>) lists;
	}

}
