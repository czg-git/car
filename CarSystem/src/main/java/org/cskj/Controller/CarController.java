package org.cskj.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cskj.Bean.Car;
import org.cskj.Bean.Parts;
import org.cskj.Service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class CarController {
	@Autowired
	private CarService cService;
	@RequestMapping("/tolist")
	public String toList() {
		return"car/carlist";
	}
	@RequestMapping("/toadd")
	public String toadd() {
		return"car/caradd";
	}
	@RequestMapping("/toUpdateCar")
	public String toUpdateCar(String id,HttpSession session) {
		System.out.println("---------"+id);
		session.setAttribute("carid", id);
		return"car/carupdate";
	}
	@RequestMapping("/list")
	public String List(HttpSession session,Car car,
			String scurrentPage) {
		System.out.println(car);
		String carbrand = car.getCarbrand();
		String type = car.getType();
		String card = car.getCard();
		String name = car.getName();
		String phone = car.getPhone();
		String startdate = car.getStartdate();
		String enddate = car.getEnddate();
		int paystatus = car.getPaystatus();
		scurrentPage = scurrentPage == null ? "1" : scurrentPage;
		carbrand = carbrand == null ? "" : carbrand;
		type = type == null ? "" : type;
		card = card == null ? "" : card;
		name = name == null ? "" : name;
		phone = phone == null ? "" : phone;
		startdate = startdate == null ? "" : startdate;
		enddate = enddate == null ? "" : enddate;
		int currentPage = Integer.parseInt(scurrentPage);
		PageHelper.offsetPage((currentPage-1)*5, 5);
		Car car2=new Car(carbrand, type, card, name, phone, paystatus,startdate,enddate);
		java.util.List<Car> carlist = cService.listCar(car2);
		PageInfo<Car>page = new PageInfo<Car>(carlist);
		
		session.setAttribute("page", page);
		session.setAttribute("clist", carlist);
		session.setAttribute("carbrand", carbrand);
		session.setAttribute("card", card);
		session.setAttribute("name", name);
		session.setAttribute("type", type);
		session.setAttribute("startdate", startdate);
		session.setAttribute("enddate", enddate);
		session.setAttribute("paystatus", paystatus);
		session.setAttribute("phone", phone);
		return "car/carlist";
		
	}
	@RequestMapping("/addCar")
	public void addCar(HttpServletRequest request,HttpServletResponse response,Car car,MultipartFile image,
			@RequestParam(value = "pid",required = false)int pid) throws IllegalStateException, IOException {
		System.out.println(car);
		System.out.print(pid);
		System.out.println(image.getName());
		Parts parts = new Parts(pid);
		car.setParts(parts);
		String realPath = request.getServletContext().getRealPath("/image");
		System.out.println("路径"+realPath);
		// 获取uuid生成的随机名和文件后缀名拼接
		String filepath = UUID.randomUUID().toString().replace("-", "")+"."+image.getContentType().split("/")[1];
		// 根据路径名和文件名创建文件
		File f = new File(realPath,filepath);
		System.out.println(f);
		// 将上传的文件复制给新文件
		image.transferTo(f);
		// 创建字符串 为添加做准备
		String imageurl = "image/" + filepath;
		car.setImageUrl(imageurl);
		int i = cService.addCar(car);
		response.getWriter().print(i>0);
		
	}
	@RequestMapping("/deleteCar")
	public void deleteCar(HttpServletRequest request,HttpServletResponse response,
			int[]ids ) throws IllegalStateException, IOException {
		
		  int i = cService.deleteCar(ids);
		  response.getWriter().print(i>0);
		 
		
	}
	@RequestMapping("/queryById")
	public void query(String id,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		 Car car = cService.queryById(id);
		String jsonString = JSON.toJSONString(car);
		
		response.getWriter().print(jsonString);
		
	}
	@RequestMapping("/updateCar")
	public void updateCar(HttpServletRequest request,HttpServletResponse response,Car car,MultipartFile image,
			@RequestParam(value = "pid",required = false)int pid) throws IllegalStateException, IOException {
		System.out.println(car);
		System.out.print(pid);
		Parts parts = new Parts(pid);
		car.setParts(parts);
		String realPath = request.getServletContext().getRealPath("/image");
		System.out.println("路径"+realPath);
		// 获取uuid生成的随机名和文件后缀名拼接
		String filepath = UUID.randomUUID().toString().replace("-", "")+"."+image.getContentType().split("/")[1];
		// 根据路径名和文件名创建文件
		File f = new File(realPath,filepath);
		System.out.println(f);
		// 将上传的文件复制给新文件
		image.transferTo(f);
		// 创建字符串 为添加做准备
		String imageurl = "image/" + filepath;
		car.setImageUrl(imageurl);
		int i = cService.update(car);
		response.getWriter().print(i>0);
		
	}
}
