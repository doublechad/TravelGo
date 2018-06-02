package org.iii.www.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.RowMapper;

public class ArrayListRowMaper implements RowMapper<ArrayList<String>>{

	@Override
	public ArrayList<String> mapRow(ResultSet rs, int arg0) throws SQLException {
		int size =rs.getMetaData().getColumnCount();
		ArrayList<String> array =new ArrayList();
		for(int i=1;i<=size;i++) {
			array.add(rs.getString(i));
		}
		return array;
	}

}

