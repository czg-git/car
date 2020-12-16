package org.cskj.Service;

import java.util.List;

import org.cskj.Bean.Emp;

public interface EmpService {
List<Emp>listEmp();
List<Emp> pageEmp(Emp emp);
int addEmp(Emp emp);
int deleteEmp(int[] ids);
Emp queryByEid(String id);

int updateEmp(Emp emp);
}
