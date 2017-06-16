package com.heyi.cloudfarm.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.heyi.cloudfarm.bean.Bug;
import com.heyi.cloudfarm.dao.DBDao;

public class ShowServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getParameter("action");
		System.out.println("action" + action);
		String modu = request.getParameter("modu");
		processAction(action,modu,request,response);
	}
	
	
	private void processAction(String action,String modu,HttpServletRequest request,HttpServletResponse response){
		if("".equals(action) && null == action ){
			return;
		}
		if("query".equals(action)){
			query(modu,request,response);
		}else if("newBug".equals(action)){
			newBug(request, response);
		}
	}

	private void newBug(HttpServletRequest request, HttpServletResponse response){
		String o = request.getParameter("oper");
		//System.out.println(o);
		String d = request.getParameter("desc");
		//System.out.println(d);
		String g = request.getParameter("grade");
		//System.out.println(g);
		String m = request.getParameter("modu");
		System.out.println(m);
		if("".equals(o) && "".equals(d) && "".equals(g)&& "".equals(m)){
			goIndex(request, response);
		}else{
			request.setAttribute("modu", m);
			DBDao.update(o, d, g, false,m);//the bug has not been fixed in default so fixed is false
			goIndexWithAttr(request, response);
		}
	}

	private void query(String modu,HttpServletRequest request, HttpServletResponse response) {
		Map<String, Bug> map = DBDao.query(modu);
		request.setAttribute("modu", modu);
		if(map == null){
			request.setAttribute("flag",true);
			goIndexWithAttr(request, response);
		}else{
			request.setAttribute("map",map);
			goIndexWithAttr(request, response);
		}
	}

	private void goIndex(HttpServletRequest request, HttpServletResponse response){
		try {
			response.sendRedirect("../index.jsp");
		} catch (Exception e) {
			processException();
			e.printStackTrace();
		}
	}
	
	private void goIndexWithAttr(HttpServletRequest request, HttpServletResponse response){
		try {
			request.getRequestDispatcher("/index.jsp").forward(request,response);
		} catch (Exception e) {
			processException();
			e.printStackTrace();
		}
	}
	
	private void processException(){
		
	}
	
}
