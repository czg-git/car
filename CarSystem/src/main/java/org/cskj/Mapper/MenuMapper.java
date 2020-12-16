package org.cskj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.cskj.Bean.Menu;
@Mapper
public interface MenuMapper {
	List<Menu>list();
}
