package org.cskj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.cskj.Bean.Car;
import org.cskj.Bean.Parts;
@Mapper
public interface PartsMapper {
List<Parts>listParts();
List<Parts>pageParts(Parts parts);
int addParts(Parts parts);
int deleteParts(int[]ids);
Parts queryByPid(String id);

int updateParts(Parts parts);
}
