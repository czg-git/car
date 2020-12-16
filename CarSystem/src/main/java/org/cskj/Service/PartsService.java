package org.cskj.Service;

import java.util.List;

import org.cskj.Bean.Parts;

public interface PartsService {
List<Parts>listParts();
List<Parts>pageParts(Parts parts);
int addParts(Parts parts);
int deleteParts(int[] ids);
Parts queryByPid(String id);

int updateParts(Parts parts);
}
