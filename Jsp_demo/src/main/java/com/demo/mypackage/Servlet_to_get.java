package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Servlet_to_get extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		RequestDispatcher rd;
		req.setAttribute("getall", "true");
		rd = req.getRequestDispatcher("GetAll.jsp");
		out.println("<h1> hello</h1>");
		rd.forward(req, res);
		}
		
	

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		RequestDispatcher rd = null;
	  
		
		String[] names = req.getParameterValues("names");
		
		if (!(names == null)) {
			@SuppressWarnings("rawtypes")
			List list = Arrays.asList(names);
			req.getSession().setAttribute("names", list);
			String action=req.getParameter("act");
			if (action!=null && action.equals("edit")) {
				if (list.size() > 1) {
					req.setAttribute("getall", "true");
					//out.println("<div style=\" margin-top: -450px; margin-left:725px;\" class=\"alert alert-warning alert-dismissible fade show w-25\" role=\"alert\"><strong>Please select only one user!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
					rd=req.getRequestDispatcher("GetAll.jsp");
					rd.include(req, res);
					//out.println("<div style=\" margin-top: -450px; margin-left:725px;\" class=\"alert alert-warning alert-dismissible fade show w-25\" role=\"alert\"><strong>Please select only one user!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
					
					//rd.include(req, res);
					//doGet(req, res);
				} else {
					if (list.size() == 1) {
						int id = Integer.parseInt((String) list.get(0));
						Employee e = new Employee();
						e = StoreData.getbyid(id);
						HttpSession s = req.getSession();
						s.setAttribute("user", e);
						rd=req.getRequestDispatcher("update.jsp");			
						rd.include(req, res);
						//out.println("<div style=\" margin-top: -450px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Successfully updated!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
					}
				}
			}
			if (action!=null && action.equals("del")) {
				for (int i = 0; i < list.size(); i++) {
					int id = Integer.parseInt((String) list.get(i));
					StoreData.delete(id);
					rd=req.getRequestDispatcher("GetAll.jsp");			
					rd.include(req, res);
					//out.println("<div style=\" margin-top: -450px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Details deleted Successfully!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
				}
				doGet(req, res);
			}

		} else {
			doGet(req, res);
		}

	}
}
