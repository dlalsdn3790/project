package com.kh.emfly.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.emfly.member.model.vo.Member;
import com.kh.emfly.member.model.service.MemberService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController
{
	@Autowired
	private MemberService ms;

	private String apiResult = null;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value="loginPage.do")
	private ModelAndView login(HttpSession session)
	{
		/* 네아로 인증 URL을 생성하기 위하여 getAuthorizationUrl을 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		ModelAndView mav = new ModelAndView();
		mav.addObject("naverurl", naverAuthUrl);
		mav.setViewName("loginPage");

		return mav;
	}

	@RequestMapping(value="mainPage_naver.do")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException
	{
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken);

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonobj = (JSONObject) obj;

		JSONObject response_obj = (JSONObject) jsonobj.get("response");

		String mId = (String)response_obj.get("id");
		String mNickname = (String)response_obj.get("nickname");
		String mName = (String)response_obj.get("name");
		String mEmail = (String)response_obj.get("email");
		String mGender = (String)response_obj.get("gender");
		String mAge = (String)response_obj.get("age");
		String mBirthday = (String)response_obj.get("birthday");
		String mImg = (String)response_obj.get("profile_image");
		String mRoute = "naver";
		String mAccess = "normal";

		Member m = new Member(mId, mNickname, mName, mEmail, mGender, mAge, mBirthday, mImg, mRoute, mAccess);
		Member me = new Member();
		me = ms.checkMember(mId);
		
		if(me == null)
		{
			int result = ms.insertMember(m);
			
			if(result > 0)
				session.setAttribute("member", m);
			
			return new ModelAndView("forward:mainPage.jsp", "member", m);
		}
		else
		{
			session.setAttribute("member", me);

			return new ModelAndView("forward:mainPage.jsp", "member", me);
		}
	}

	@RequestMapping(value="logout.me")
	public String logout(HttpSession session) throws IOException
	{
		session.invalidate();

		return "redirect:mainPage.jsp";
	}
	
	
}