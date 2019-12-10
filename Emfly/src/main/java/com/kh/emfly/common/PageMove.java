package com.kh.emfly.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.emfly.member.model.vo.Member;

@Controller
public class PageMove
{
   @RequestMapping("searchCompany.do")
   private String searchCompany(int page)
   {
      return "menu2ListPage";
   }
   
   @RequestMapping("searchWorker.do")
   private String ResumeDetail()
   {
      return "menu6Page";
   }
   
   @RequestMapping("myPage_normal.do")
   private String mypage_normal(int tab)
   {
      return "myPage1-1";
   }

   @RequestMapping("myPage_company.do")
   private String myPage_company()
   {
      return "myComPage";
   }

   @RequestMapping("myPage_admin.do")
   private String myPage_admin()
   {
      return "adminPage";
   }

//   @RequestMapping("searchWorker.do")
//   private String searchWorker(HttpServletResponse response, HttpSession session) throws IOException
//   {
//      Member m = (Member) session.getAttribute("member");
//
//      if(m != null)
//      {
//         if(m.getmAccess().equals("normal"))
//         {
//            response.setContentType("text/html; charset=UTF-8");
//
//            PrintWriter out = response.getWriter();
//            out.println("<script>alert('기업 회원만 이용할 수 있습니다.'); history.back();</script>");
//            out.close();
//         }
//      }
//      else
//      {
//         response.setContentType("text/html; charset=UTF-8");
//
//         PrintWriter out = response.getWriter();
//         out.println("<script>alert('기업 회원만 이용할 수 있습니다.'); history.back();</script>");
//         out.close();
//      }
//
//      return "redirect:mainPage.jsp";
//   }

   @RequestMapping("/emplyMenu1.me")
   private String emplyMenu1(){
      return "menu1Page";
   }

   @RequestMapping("/emplyMenu3.me")
   private String emplyMenu3(){
      return "menu3Page";
   }

	/*
	 * @RequestMapping("/emplyMenu4List.me") private String emplyMenu4(){ return
	 * "menu4ListPage"; }
	 * 
	 * @RequestMapping("/emplyMenu4View.me") private String emplyMenu4View(){ return
	 * "menu4ViewPage"; }
	 * 
	 * @RequestMapping("/emplyMenu4Write.me") private String emplyMenu4Write(){
	 * return "menu4WritePage"; }
	 * 
	 * @RequestMapping("/emplyMenu4Update.me") private String emplyMenu4Update(){
	 * return "menu4UpdatePage"; }
	 */

//   @RequestMapping("/emplyMenu5.me")
//   private String emplyMenu5(){
//      return "menu5Page";
//   }

   @RequestMapping("/emplyMenu6.me")
   private String emplyMenu6(){
      return "menu6Page";
   }

   @RequestMapping("/emplyMyPage1A.me")
   private String emplyMyPage1A(){
      return "myPage1-1";
   }

   @RequestMapping("/emplyMyPage1B.me")
   private String emplyMyPage1B(){
      return "myPage1-2";
   }

//   @RequestMapping("/emplyMyPage2.me")
//   private String emplyMyPage2(){
//      return "myPage2";
//   }

   @RequestMapping("/emplyMyPage3.me")
   private String emplyMyPage3(){
      return "myPage3";
   }

   @RequestMapping("/emplyMyPage4.me")
   private String emplyMyPage4(){
      return "myPage4";
   }

   @RequestMapping("/emplyResume.me")
   private String emplyResumePage(){
      return "emplyResume";
   }

}