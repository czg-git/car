package org.cskj.Service;

import java.util.List;
import java.util.Map;

import org.cskj.Bean.Car;

public interface CarService {
List<Car>listCar(Car car);

int addCar(Car car);

int deleteCar(int[] ids);
Car queryById(String id);

int update(Car car);
}
