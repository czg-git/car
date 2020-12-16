package org.cskj.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.cskj.Bean.Car;
@Mapper
public interface CarMapper {
	List<Car>listCar(Car car);

	int addCar(Car car);

	int deleteCar(int[] ids);
	Car queryById(String id);

	int updateCar(Car car);
}
