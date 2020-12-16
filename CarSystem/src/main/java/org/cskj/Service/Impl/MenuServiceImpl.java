package org.cskj.Service.Impl;

import java.util.List;

import org.cskj.Bean.Menu;
import org.cskj.Mapper.MenuMapper;
import org.cskj.Service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class MenuServiceImpl implements MenuService {
@Autowired MenuMapper mapper;
	public List<Menu> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

}
