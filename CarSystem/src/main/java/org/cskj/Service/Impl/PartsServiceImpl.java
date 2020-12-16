package org.cskj.Service.Impl;

import java.util.List;

import org.cskj.Bean.Parts;
import org.cskj.Mapper.PartsMapper;
import org.cskj.Service.PartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class PartsServiceImpl implements PartsService {
@Autowired
private PartsMapper pMapper;
	public List<Parts> listParts() {
		// TODO Auto-generated method stub
		return pMapper.listParts();
	}
	public List<Parts> pageParts(Parts parts) {
		// TODO Auto-generated method stub
		return pMapper.pageParts(parts);
	}
	public int addParts(Parts parts) {
		// TODO Auto-generated method stub
		return pMapper.addParts(parts);
	}
	public int deleteParts(int[] ids) {
		// TODO Auto-generated method stub
		return pMapper.deleteParts(ids);
	}
	public Parts queryByPid(String id) {
		// TODO Auto-generated method stub
		return pMapper.queryByPid(id);
	}
	public int updateParts(Parts parts) {
		// TODO Auto-generated method stub
		return pMapper.updateParts(parts);
	}

}
