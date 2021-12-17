package com.demo.mypackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		PrintWriter out = res.getWriter();
		res.setContentType("text/html");
		
		if(req.getParameter("saved")!=null)
		{
			String id = req.getParameter("id");
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			Employee e = new Employee();
			e.setId(Integer.parseInt(id));
			e.setFname(fname);
			e.setLname(lname);
			StoreData.register(e);
			RequestDispatcher rd = req.getRequestDispatcher("Index.jsp");
			out.println(
					"<div style=\"margin-top:100px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Successfully Inserted!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
			rd.include(req, res);
		}
		if (req.getParameter("update_details") != null) {
			Employee e = new Employee();
			HttpSession session = req.getSession();
			Employee e1 = (Employee) req.getSession().getAttribute("user");
			String fname = (req.getParameter("fname"));
			String lname = (req.getParameter("lname"));
			e.setId(e1.getId());
			e.setLname(lname);
			e.setFname(fname);
			StoreData.update(e1.getId(), e);
			req.setAttribute("getall", "true");
			RequestDispatcher rd = req.getRequestDispatcher("GetAll.jsp");
			rd.include(req, res);
			out.println(
					"<div style=\" margin-top: -300px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Successfully updated!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
			session.removeAttribute("user");

		}

	}
}