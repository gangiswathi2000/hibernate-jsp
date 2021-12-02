package com.demo.mypackage;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class SingletonClass {
	private static Session session = null;
	private SingletonClass()
	{	
	}
	public static Session getsession()
	{if(session==null)
	{
		Configuration configuration = new Configuration().configure("/resources/hibernate.cfg.xml")
				.addAnnotatedClass(Employee.class);
		ServiceRegistry reg = new ServiceRegistryBuilder().applySettings(configuration.getProperties())
				.buildServiceRegistry();
		SessionFactory factory = configuration.buildSessionFactory(reg);
		 session= factory.openSession();
		return session;
	}
	return session;
	}

}
