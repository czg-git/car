package org.cskj.Exception;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
@ExceptionHandler(UserNotFoundException.class)
void handleException(HttpSession session,Exception e) {
	System.out.println(e.getMessage());
	session.setAttribute("usernotfound", e.getMessage());
	
}
}
