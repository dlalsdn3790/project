package com.kh.emfly.qna.model.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.qna.model.service.QuestionService;
import com.kh.emfly.qna.model.vo.Answer;
import com.kh.emfly.qna.model.vo.Question;






@Controller
public class QuestionController {
	@Autowired
	private QuestionService qService;
	
	@RequestMapping("/emplyMenu5.me")	
	public ModelAndView QuestionList(ModelAndView mv) throws Exception {
		

		List<Question> qlist = qService.QuestionList();
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if (qlist != null) {
			map.put("qlist1", qlist.get(0));
			map.put("qlist2", qlist.get(1));
			map.put("qlist3", qlist.get(2));
			mav.addObject("map", map);
			mav.setViewName("menu5Page");
		}
		return mav;
	}
	
	@RequestMapping("qinsert.me")
	public String questionInsert(@ModelAttribute Answer a,HttpServletRequest request) {
		
		int result = qService.questionInsert(a);
		
		if(result > 0) {
			return "redirect:mainPage.jsp";
		}else {
			// 에러 발생
			return "common/errorPage";
		}
	}
	
	@RequestMapping("/emplyMyPage2.me")	
	public ModelAndView qnaList(@RequestParam("mId") String mId,ModelAndView mv) throws Exception {
		List<Question> qnalist = qService.qnaList(mId);
		
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if (qnalist != null) {
			map.put("qnaList",qnalist);
			mav.addObject("map", map);
			mav.setViewName("myPage2");
		}
		System.out.println("qnalist: " + qnalist);
		return mav;
	}

	
}
