package org.cskj.Service;

import java.util.List;

import org.cskj.Bean.PartVo;
import org.cskj.Bean.salaryVo;

public interface SysService {

	List<PartVo> geCount();
	List CountCarType();
	List CountCarBrand();
	List getBrand();
	List<salaryVo> getSalary();
}
