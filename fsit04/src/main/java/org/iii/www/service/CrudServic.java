package org.iii.www.service;

import java.util.List;

public interface CrudServic<T> {
	public T getByid(Integer total_id);
	public List<T> getAll();
}
