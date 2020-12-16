package org.cskj.Service.Impl;

import java.util.List;

import org.cskj.Bean.Car;
import org.cskj.Mapper.CarMapper;
import org.cskj.Service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CarServiceImpl implements CarService{
@Autowired
private CarMapper carMapper;
	public List<Car> listCar(Car car) {
		// TODO Auto-generated method stub
		return carMapper.listCar(car);
	}
	public int addCar(Car car) {
		// TODO Auto-generated method stub
		return carMapper.addCar(car);
	}
	public int deleteCar(int[] ids) {
		// TODO Auto-generated method stub
		return carMapper.deleteCar(ids);
	}
	public Car queryById(String id) {
		// TODO Auto-generated method stub
		return carMapper.queryById(id);
	}
	public int update(Car car) {
		// TODO Auto-generated method stub
		return carMapper.updateCar(car);
	}

}
