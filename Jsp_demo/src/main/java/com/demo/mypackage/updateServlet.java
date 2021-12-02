package com.demo.mypackage;

import java.io.IOException;

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
	    String id=req.getParameter("id");
	    String fname=(req.getParameter("fname"));
	    String lname=(req.getParameter("lname"));
	    e.setId(e1.getId());
	    e.setLname(lname);
	    e.setFname(fname);
	    StoreData.update(e1.getId(),e);
		session.removeAttribute("user");
	}

}
}
