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
	if(req.getParameter("update_details")!=null)
	{
		Employee e=new Employee();
		HttpSession session=req.getSession();
		Employee e1=(Employee)req.getSession().getAttribute("user");
	    String fname=(req.getParameter("fname"));
	    String lname=(req.getParameter("lname"));
	    e.setId(e1.getId());
	    e.setLname(lname);
	    e.setFname(fname);
	    StoreData.update(e1.getId(),e);
	    req.setAttribute("getall", "true");
	    RequestDispatcher rd=req.getRequestDispatcher("GetAll.jsp");
		   rd.forward(req, res);
		session.removeAttribute("user");
	   
	}

}
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
	{
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		String id=req.getParameter("id");
		String fname=req.getParameter("fname");
		String lname=req.getParameter("lname");
		Employee e=new Employee();
		e.setId(Integer.parseInt(id));
		e.setFname(fname);
		e.setLname(lname);
		StoreData.register(e);
		System.out.println(e.toString());
		RequestDispatcher rd=req.getRequestDispatcher("Index.jsp");
		out.println("<div style=\"margin-top:100px; margin-left:725px;\" class=\"alert alert-success alert-dismissible fade show w-25\" role=\"alert\"><strong>Successfully Inserted!</strong> <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"alert\" aria-label=\"Close\"></button></div>");
		rd.include(req, res);
	}
}
