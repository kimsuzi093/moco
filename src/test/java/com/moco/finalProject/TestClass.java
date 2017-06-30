package com.moco.finalProject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moco.userBoard.UserBoardService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class TestClass {

	@Autowired
	private UserBoardService userBoardService;
	
	@Test
	public void test(){
		int num = 1;
		String contents = "";
		String fname = "";
		try{
			contents = userBoardService.userBoardContents(num);
			System.out.println(contents);
			fname = contents.substring(contents.lastIndexOf("<img"));
		}catch (Exception e) {
			
		}
		
		
		System.out.println(fname);
	}

}
