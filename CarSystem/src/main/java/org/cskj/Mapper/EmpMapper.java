package org.cskj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.cskj.Bean.Emp;
import org.cskj.Bean.Parts;

@Mapper
public interface EmpMapper {

	List<Emp> listEmp();
	List<Emp> pageEmp(Emp emp);
	int addEmp(Emp emp);
	int deleteEmp(int[]ids);
	Emp queryByEid(String id);

	int updateEmp(Emp emp);
}
