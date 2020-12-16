package org.cskj.Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.cskj.Bean.Car;
import org.cskj.Bean.Emp;
import org.cskj.Bean.Parts;
import org.cskj.Service.PartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class PartsController {
@Autowired
private PartsService pService;
@RequestMapping("/toPartsList")
public String toList() {
	return"parts/listParts";
}
@RequestMapping("/toAddParts")
public String toPartsAdd() {
	return"parts/addParts";
}
@RequestMapping("/toUpdateParts")
public String toUpdateCar(String id,HttpSession session) {
	System.out.println("---------"+id);
	session.setAttribute("partsid", id);
	return"parts/partsupdate";
}
@RequestMapping("/listParts")
public void listParts(HttpServletResponse response) throws IOException {
	response.setContentType("text/html;charset=utf-8");
	List<Parts> plist = pService.listParts();
	String jsonString = JSON.toJSONString(plist);
	response.getWriter().print(jsonString);
}

@RequestMapping("/PageParts")
public String PageParts(HttpSession session,HttpServletResponse response,String scurrentPage,Parts parts) throws IOException {
	System.out.println(scurrentPage);
	System.out.println("*****************"+parts);
	String pname = parts.getPname();
	Double inprice = parts.getInprice();
	Double outprice = parts.getOutprice();
	String dealers = parts.getDealers();
	String phone = parts.getPhone();
	String indate = parts.getIndate();
	int num = parts.getNum();
	scurrentPage = scurrentPage == null ? "1" : scurrentPage;
	pname = pname == null ? "" : pname;
	dealers = dealers == null ? "" : dealers;
	phone = phone == null ? "" : phone;
	indate = indate == null ? "" : indate;
	
	int currentPage = Integer.parseInt(scurrentPage);
	PageHelper.offsetPage((currentPage-1)*5, 5);
	Parts parts2 = new Parts(pname, inprice, outprice, dealers, phone, indate, num);
	List<Parts> list = pService.pageParts(parts2);
	PageInfo<Parts>page = new PageInfo<Parts>(list);
	
	session.setAttribute("cpage", page);
	session.setAttribute("plist", list);
	session.setAttribute("pname", pname);
	session.setAttribute("inprice", inprice);
	session.setAttribute("outprice",outprice);
	session.setAttribute("dealers", dealers);
	session.setAttribute("phone", phone);
	session.setAttribute("indate", indate);
	session.setAttribute("num", num);
	return"parts/listParts";
}
@RequestMapping("/addParts")
public void addCar(HttpServletRequest request,HttpServletResponse response,Parts parts,
		@RequestParam(value = "eid",required = false)int eid) throws IllegalStateException, IOException {
	System.out.println(parts);
	System.out.println(eid);
	Emp emp = new Emp(eid);
	parts.setEmp(emp);
	 int i = pService.addParts(parts); 
	 response.getWriter().print(i>0);
	 
	
}
@RequestMapping("/deleteParts")
public void deleteCar(HttpServletRequest request,HttpServletResponse response,
		int[]ids ) throws IllegalStateException, IOException {
	
	  int i = pService.deleteParts(ids);
	  response.getWriter().print(i>0);
	 
	
}
@RequestMapping("/queryByPid")
public void query(String id,HttpServletResponse response) throws IOException {
	response.setContentType("text/html;charset=utf-8");
	
	 Parts parts= pService.queryByPid(id);
	String jsonString = JSON.toJSONString(parts);
	
	response.getWriter().print(jsonString);
	
}
@RequestMapping("/updateParts")
public void updateCar(HttpServletRequest request,HttpServletResponse response,Parts parts,
		@RequestParam(value = "eid",required = false)int eid) throws IllegalStateException, IOException {
	
	Emp emp = new Emp(eid);
	parts.setEmp(emp);
	int i = pService.updateParts(parts);
	response.getWriter().print(i>0);
	
}
}
