package org.cskj.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cskj.Bean.Emp;
import org.cskj.Bean.Parts;
import org.cskj.Service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmpController {
	@Autowired
	private EmpService eService;
	@RequestMapping("/toAddEmp")
	public String toAddEmp() {
		return"emp/addEmp";
	}
	@RequestMapping("/toUpdateEmp")
	public String toUpdateCar(String id,HttpSession session) {
		System.out.println("---------"+id);
		session.setAttribute("empid", id);
		return"emp/empupdate";
	}
	@RequestMapping("/listEmp")
	public void listParts(HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		List<Emp> elist = eService.listEmp();
		String jsonString = JSON.toJSONString(elist);
		response.getWriter().print(jsonString);
	}
	@RequestMapping("/PageEmp")
	public String PageParts(HttpSession session,HttpServletResponse response,String scurrentPage,Emp emp) throws IOException {
		System.out.println(scurrentPage);
		System.out.println(emp);
		String ename = emp.getEname();
		String job = emp.getJob();
		String phone = emp.getPhone();
		scurrentPage = scurrentPage == null ? "1" : scurrentPage;
		ename = ename == null ? "" : ename;
		job = job == null ? "" : job;
		phone = phone == null ? "" : phone;
		
		int currentPage = Integer.parseInt(scurrentPage);
		PageHelper.offsetPage((currentPage-1)*5, 5);
		Emp emp2 = new Emp(ename, job, phone);
		List<Emp> list = eService.pageEmp(emp2);
		PageInfo<Emp>page = new PageInfo<Emp>(list);
		
		session.setAttribute("epage", page);
		session.setAttribute("elist", list);
		session.setAttribute("ename", ename);
		session.setAttribute("job", job);
		session.setAttribute("phone", phone);
		return"emp/listEmp";
	}
	@RequestMapping("/addEmp")
	public void addCar(HttpServletRequest request,HttpServletResponse response,Emp emp) throws IllegalStateException, IOException {
		System.out.println(emp);
		 int i = eService.addEmp(emp); 
		 response.getWriter().print(i>0);
		 
		
	}
	@RequestMapping("/deleteEmp")
	public void deleteCar(HttpServletRequest request,HttpServletResponse response,
			int[]ids ) throws IllegalStateException, IOException {
		
		  int i = eService.deleteEmp(ids);
		  response.getWriter().print(i>0);
		 
		
	}
	@RequestMapping("/queryByEid")
	public void query(String id,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		 Emp emp = eService.queryByEid(id);
		String jsonString = JSON.toJSONString(emp);
		
		response.getWriter().print(jsonString);
		
	}
	@RequestMapping("/updateEmp")
	public void updateCar(HttpServletRequest request,HttpServletResponse response,Emp emp) throws IllegalStateException, IOException {
		
		System.out.println("------"+emp);
		int i = eService.updateEmp(emp);
		response.getWriter().print(i>0);
		
	}
}
