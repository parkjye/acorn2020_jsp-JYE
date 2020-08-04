package test.main;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MainClass04 {
	public static void main(String[] args) {
		//String str = "abcd	1234 abcd  5678		abcd"; tab은 안됨
		String str = "abcd 1234      abcd 5678			abcd";
		
		//String reg = "abcd";
		//String reg = "[0-9]+";
		//String reg = "[\\d]+";
		String reg = "[^ ]+";
		
		Pattern p = Pattern.compile(reg);
		Matcher m = p.matcher(str);
		
		List<String> list = new ArrayList<>();
		
		//Matcher 객체의 find() 메소드를 호출하면서 반복문
		while(m.find()) {
			
			//찾은 문자열 출력
			System.out.println(m.group());
			
			//결과값 누적
			list.add(m.group());
		}
	}
}
