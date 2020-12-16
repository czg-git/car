package org.cskj.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cskj.Bean.Emp;
import org.cskj.Bean.PartVo;
import org.cskj.Bean.Parts;
import org.cskj.Bean.salaryVo;
import org.cskj.Service.EmpService;
import org.cskj.Service.SysService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class SysController {
	@Autowired
	private SysService sService;
	@RequestMapping("/toPartsControl")
	public String toPartsControl() {
		return"system/partsControl";
	}
	@RequestMapping("/toTypeControl")
	public String toTypeControl() {
		return"system/typeControl";
	}
	@RequestMapping("/toBrandControl")
	public String toBrandControl() {
		return"system/brandControl";
	}
	
	@RequestMapping("/partsController")
	public void getcount(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		List<PartVo> list = sService.geCount();
		System.out.println("count"+list);
		String jsonString = JSON.toJSONString(list);
		response.getWriter().print(jsonString);
		
	}
	
	  @RequestMapping("/typeController") 
	  public void countCarType(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		  response.setContentType("text/html;charset=utf-8");
		  List list =sService.CountCarType();
		  String jsonString = JSON.toJSONString(list);
		  response.getWriter().print(jsonString);
	  
	  }
	  @RequestMapping("/brandController") 
	  public String getcountbrand(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		  response.setContentType("text/html;charset=utf-8");
		  List brand = sService.getBrand();
		  String s = "[";
			for (Object b : brand) {
				s=s+"'"+b+"',";
			}
			s = s.substring(0,s.length()-1)+"]";
		  HttpSession session = request.getSession();
		  session.setAttribute("brand", s);
		  List list =sService.CountCarBrand();
		  session.setAttribute("countbrand", list);
		  return"system/brandControl";
	  }
	  @RequestMapping("/salsry") 
	  public String getSalsry(HttpServletRequest request, HttpServletResponse response){ 
		   List<salaryVo> list = sService.getSalary();
		   String s = "[";
			for (salaryVo sav : list) {
				System.out.println(sav.getName());
				s=s+"'"+sav.getName()+"',";
			}
			s = s.substring(0,s.length()-1)+"]";
			System.out.println(s);
		  HttpSession session = request.getSession();
		  session.setAttribute("salary",s);
		  session.setAttribute("salarylist",list);
		  return"system/salary";
	  }
}
