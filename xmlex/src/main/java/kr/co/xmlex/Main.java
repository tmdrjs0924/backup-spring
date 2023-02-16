package kr.co.xmlex;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		
		Student st=new Student();
		st.setAge(20);
		st.setName("길동");
		st.setHakbun("p1234");
		System.out.println(st.getName());
		
		AbstractApplicationContext app=new GenericXmlApplicationContext("classpath:kr/co/xmlex/app.xml");
		Student st2=app.getBean("student2", Student.class);
		System.out.println(st2.getName());
		
		Student st3=app.getBean("student3", Student.class);
		System.out.println(st3.getName());
	}
}
