package kr.co.myshop.util;

import java.util.HashSet;
import java.util.Iterator;
import java.util.TreeSet;

import javax.print.DocFlavor.STRING;

public class Collection_Set {

	public static void main(String[] args) {
		// collection 객체 set : 순서x 중복x
		
		// 메소드 : add() get() size()
		
		HashSet<String> set1=new HashSet<String>();
		set1.add("홍길동");
		set1.add("슈퍼맨");
		set1.add("배트맨");
		
		TreeSet<String> set2=new TreeSet<String>();
		set2.add("홍길동");
		set2.add("슈퍼맨");
		set2.add("배트맨");
		
		System.out.println(set1.size());
		System.out.println(set2.size());
		
		// get()이 없다
		Iterator<String> my=set2.iterator();
		
		while(my.hasNext())
			System.out.println(my.next());
		
		System.out.println("================");
		// 삭제 : remove()
		set2.remove("홍길동");
		my=set2.iterator();
		System.out.println(my.next());
		
		// 전체 삭제: clear()
		set1.clear();
		System.out.println(set1.size());
	}
}
