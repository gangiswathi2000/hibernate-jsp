package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
		//List<Employee> l_e=new ArrayList<>();
		List<Employee> l_e=new ArrayList<>();
		HttpSession session=req.getSession();
		RequestDispatcher rd;
		PrintWriter out = res.getWriter();
		String[] names = req.getParameterValues("names");
		String action = req.getParameter("act");
		String action1 = req.getParameter("act1");
		if (!(names == null)) {
			@SuppressWarnings("rawtypes")
			List list = Arrays.asList(names);
			req.getSession().setAttribute("names", list);
			
			if (action != null && action.equals("edit")) {
				if (list.size() > 1) {
					req.setAttribute("getall", "true");
					rd = req.getRequestDispatcher("GetAll.jsp");
					rd.include(req, res);
					out.println(
							"<div style=\" margin-top: -300px; margin-left:725px;\" class=\"alert alert-warning alert-dismissible fade show w-25\" role=\"alert\"><strong>Please select only one user!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
				} else {
					if (list.size() == 1) {
						int id = Integer.parseInt((String) list.get(0));
						Employee e = new Employee();
						e = StoreData.getbyid(id);
						HttpSession s = req.getSession();
						s.setAttribute("user", e);
						rd = req.getRequestDispatcher("update.jsp");
						rd.include(req, res);

					}
				}
			}
			else if (action != null && action.equals("del")) {
				int i = 0;
				
				
				for (i = 0; i < list.size(); i++) {
					Employee ee1=new Employee();
					int id = Integer.parseInt((String) list.get(i));
					ee1.setId(StoreData.getbyid(id).getId());
					ee1.setFname(StoreData.getbyid(id).getFname());
					ee1.setLname(StoreData.getbyid(id).getLname());
					l_e.add(ee1);
					//l_e.add(ee1);
					StoreData.delete(id);
				}
				System.out.println("deleted after"+l_e);
   			session.setAttribute("undo_list",l_e);
				if (i > 0) {
					//System.out.println(i);
					req.setAttribute("getall", "true");
					rd = req.getRequestDispatcher("GetAll.jsp");
					rd.include(req, res);
					out.println(
							"<div style=\" margin-top: -300px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Details deleted Successfully!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
				}
			}
			

		}
		else
		{
			if (action.equals("edit")) {
				req.setAttribute("getall", "true");
				rd = req.getRequestDispatcher("GetAll.jsp");
				rd.include(req, res);
				out.println(
						"<div style=\" margin-top: -300px; margin-left:725px;\" class=\"alert alert-warning alert-dismissible fade show w-25\" role=\"alert\"><strong>Please select any user to edit!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
			}
			else if (action1 != null && action1.equals("undo")) {
				List<Employee> undo_list=(List<Employee>) session.getAttribute("undo_list");
				for (Employee e1:undo_list) {
					StoreData.register(e1);
				}
				req.setAttribute("getall", "true");
				rd = req.getRequestDispatcher("GetAll.jsp");
				rd.include(req, res);
			}
			else if ( action.equals("del")) {
				req.setAttribute("getall", "true");
				rd = req.getRequestDispatcher("GetAll.jsp");
				rd.include(req, res);
				out.println(
						"<div style=\" margin-top: -300px; margin-left:725px;\" class=\"alert alert-warning alert-dismissible fade show w-25\" role=\"alert\"><strong>Please select any user to delete!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
			}
			

		}
	}
}