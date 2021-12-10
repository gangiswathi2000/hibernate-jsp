package com.demo.mypackage;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class StoreData {
	public static int register(Employee e) {
		Session session = SingletonClass.getsession();
		int i = 0;
		i = (Integer) session.save(e);
		try {
			final Transaction tx = session.beginTransaction();
			try {
				tx.commit();
			} catch (Exception ex) {
				tx.rollback();
				throw ex;
			}
		}catch (Exception ex) {
			throw ex;
		}
		System.out.println("testSaveOperation ends .......");
		return i;

	}public static Employee getbyid(int id) {
		Session session = SingletonClass.getsession() ;
		Employee e = (Employee) session.get(Employee.class, id);
		return e;
	}

	public static List<Employee> getAll() {
		Session session = SingletonClass.getsession();
		Query query = session.createQuery("from Employee");
		@SuppressWarnings("rawtypes")
		Iterator itr = query.iterate();
		List<Employee> l_obj = new ArrayList<>();
		Employee s;
		while (itr.hasNext()) {
			s = (Employee) itr.next();
			l_obj.add(s);
		}
		return l_obj;
	}

	public static void delete(int id) {
		Session session = SingletonClass.getsession();
		try {
		session.beginTransaction();
		Employee e = (Employee) session.get(Employee.class, id);
		session.delete(e);
		System.out.println("delete performed!");
		session.getTransaction().commit();
		session.flush();
		session.clear();
		}
		catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
		
	}
	public static void update(int id,Employee e){
		Session session = SingletonClass.getsession();
	  
	      try{
	         session.beginTransaction();
	         Employee employee = 
	                    (Employee)session.get(Employee.class, id); 
	         employee.setFname(e.getFname());
	         employee.setLname(e.getLname());
	         session.update(employee); 
	         session.getTransaction().commit();
	      }catch (HibernateException e1) {
	         if (session.getTransaction()!=null) session.getTransaction().rollback();
	         e1.printStackTrace(); 
	      }
	   }
}
