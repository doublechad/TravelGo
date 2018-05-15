package org.iii.www.service;

import org.iii.www.dao.ImgsDao;
import org.iii.www.dao.RestaurantDao;
import org.iii.www.entity.Imgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("ImgsService")
@Transactional
public class ImgsService {
	@Autowired
	ImgsDao imgsDao;
	
	
}
