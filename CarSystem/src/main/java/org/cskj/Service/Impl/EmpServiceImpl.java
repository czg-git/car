package org.cskj.Service.Impl;

import java.util.List;

import org.cskj.Bean.Emp;
import org.cskj.Mapper.EmpMapper;
import org.cskj.Service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class EmpServiceImpl implements EmpService{
@Autowired
private EmpMapper eMapper;
	public List<Emp> listEmp() {
		// TODO Auto-generated method stub
		return eMapper.listEmp();
	}
	public List<Emp> pageEmp(Emp emp) {
		// TODO Auto-generated method stub
		return eMapper.pageEmp(emp);
	}
	public int addEmp(Emp emp) {
		// TODO Auto-generated method stub
		return eMapper.addEmp(emp);
	}
	public int deleteEmp(int[] ids) {
		// TODO Auto-generated method stub
		return eMapper.deleteEmp(ids);
	}
	public Emp queryByEid(String id) {
		// TODO Auto-generated method stub
		return eMapper.queryByEid(id);
	}
	public int updateEmp(Emp emp) {
		// TODO Auto-generated method stub
		return eMapper.updateEmp(emp);
	}

}
