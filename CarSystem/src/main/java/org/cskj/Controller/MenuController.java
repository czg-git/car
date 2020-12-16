package org.cskj.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.cskj.Bean.Menu;
import org.cskj.Service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

@Controller
public class MenuController {
@Autowired
private MenuService mService;

@RequestMapping("/menuList")
public void tologin(HttpServletResponse response) throws IOException {
	response.setContentType("text/html;charset=utf-8");
	List<Menu> list = mService.list();
	System.out.println(list);
	String jsonString = JSON.toJSONString(list);
	
	response.getWriter().print(jsonString);
}
}
