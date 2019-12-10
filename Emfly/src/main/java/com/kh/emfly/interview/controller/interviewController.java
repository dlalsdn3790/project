package com.kh.emfly.interview.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.interview.model.service.techqService;
import com.kh.emfly.qna.model.vo.Question;





@Controller
public class interviewController {

	@Autowired techqService ts;
	
	//면접페이지로 이동
	@RequestMapping(value="movepage.in",method=RequestMethod.GET)
	public ModelAndView interviewPage() throws Exception {
		
		ModelAndView mv = new ModelAndView();
//		List<Question> qlist = ts.techQList();
//		System.out.println("qlist"+qlist);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		if (qlist != null) {
//			map.put("qlist1", qlist.get(0));
//			map.put("qlist2", qlist.get(1));
//			map.put("qlist3", qlist.get(2));
//			System.out.println(map);
//			
//			 JSONObject jsonObject = new JSONObject();
//		        for( Map.Entry<String, Object> entry : map.entrySet() ) {
//		            String key = entry.getKey();
//		            Object value = entry.getValue();
//		            jsonObject.put(key, value);
//		        }
//		        System.out.println(jsonObject);
//			
//			mv.addObject("map", map);
//			mv.addObject("jasonObject",jsonObject);
//		
//		}
		mv.setViewName("interview/mockInterview");
		return mv;
	}
	
	//질문리스트 
	@RequestMapping(value="/techqlist.ajax")
	@ResponseBody
	public Map techqlist() {
		List<Question> qlist = ts.techQList();
		System.out.println("qlist"+qlist);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if (qlist != null) {
			map.put("qlist1", qlist.get(0));
			map.put("qlist2", qlist.get(1));
			map.put("qlist3", qlist.get(2));
			
		}
		System.out.println(map);
		return map;
	}
	
//	@RequestMapping(value="moveMain")
//	public View moveMain() {
//		View v = new View();
//		
//	}

}
