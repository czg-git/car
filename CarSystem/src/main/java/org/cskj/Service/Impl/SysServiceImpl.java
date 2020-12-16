package org.cskj.Service.Impl;

import java.util.List;

import org.cskj.Bean.PartVo;
import org.cskj.Bean.salaryVo;
import org.cskj.Mapper.SysMapper;
import org.cskj.Service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SysServiceImpl implements SysService {
@Autowired
private SysMapper sMapper;

public List<PartVo> geCount() {
	// TODO Auto-generated method stub
	return sMapper.getCount();
}

public List CountCarType() {
	// TODO Auto-generated method stub
	return sMapper.CountCarType();
}

public List CountCarBrand() {
	// TODO Auto-generated method stub
	return sMapper.CountCarBrand();
}

public List getBrand() {
	// TODO Auto-generated method stub
	return sMapper.getBrand();
}

public List<salaryVo> getSalary() {
	// TODO Auto-generated method stub
	return sMapper.getSalary();
}
}
