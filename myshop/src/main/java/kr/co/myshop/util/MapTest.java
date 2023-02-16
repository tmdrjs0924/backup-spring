package kr.co.myshop.util;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import java.util.TreeMap;

public class MapTest {

	public static void main(String[] args) {

		// put():넣기 , get():꺼내기, size():크기
		HashMap<Integer, String> map1=new HashMap<Integer, String>();
		map1.put(1, "짜장면");
		map1.put(2, "우동");
		map1.put(3, "짬뽕");
		map1.put(4, "간짜장");
		
		for(int i=1;i<=4;i++) {
			System.out.println(map1.get(i));
		}
		System.out.println("=================");
		
		Hashtable<String, String> map2=new Hashtable<String, String>();
		map2.put("name", "홍길동");
		map2.put("age", "33");
		map2.put("phone", "010-1234-1234");
		map2.put("email", "hong.naver.com");
		
		//System.out.println(map2.get("name"));
		// 문자의 키 값만 가져오는 메소드
		//Set s1=map2.keySet(); 
		//Iterator test=s1.iterator();
		
		//존재하는 키 값을 새로 추가할 경우 => 기존에 존재하는 값이 사라진다
		map2.put("email", "hong@nate.com");
		
		// remove(): 해당하는 키 값을 삭제
		map2.remove("age");
		// 존재하는 value를 다른 키 값으로 대체가능
		map2.put("kor", "33");
		
		Iterator<String> test=map2.keySet().iterator();
		
		while(test.hasNext()) {
			String key=test.next();
			System.out.println(key+" : "+map2.get(key));
		}
		
		LinkedHashMap<String, Integer> map3=new LinkedHashMap<String, Integer>();
		
		
		TreeMap<String, String> map4=new TreeMap<String, String>();
		
	}
}
