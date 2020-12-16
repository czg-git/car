package org.cskj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.cskj.Bean.Emp;
import org.cskj.Bean.PartVo;
import org.cskj.Bean.salaryVo;

@Mapper
public interface SysMapper {

	List<PartVo> getCount();
	List CountCarType();
	List CountCarBrand();
	List getBrand();
	List<salaryVo> getSalary();
}
