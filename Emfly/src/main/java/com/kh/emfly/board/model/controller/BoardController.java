package com.kh.emfly.board.model.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.board.model.service.BoardService;
import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.BoardPager;
import com.kh.emfly.board.model.vo.Reply;
import com.kh.emfly.member.model.vo.Member;

@Controller
public class BoardController {
   
   @Autowired
   private BoardService bService;
   
   @RequestMapping("emplyMenu4List.me")//게시글 목록
   public ModelAndView boardList(ModelAndView mv,@RequestParam(defaultValue="") String keyword,
         @RequestParam(defaultValue="1") int curPage) throws Exception{
      int listCount = bService.countArticle(keyword); // 게시글 수
      int count = 0;
      if((bService.countArticle(keyword) % 10) == 0) { // 페이징
         count = (bService.countArticle(keyword) / 10);
      }else {
         count = (bService.countArticle(keyword) / 10) + 1;
      }
      
      BoardPager boardPager = new BoardPager(count, curPage);
      int start = boardPager.getPageBegin();
      int end = boardPager.getPageEnd();
      
      ArrayList<Board> list = bService.selectList(keyword,start,end);
      Map<String, Object> map = new HashMap<String, Object>();
      if(list != null) {
      map.put("list", list);
      map.put("count", count);  // 페이지 수
      map.put("listCount", listCount); // 게시글 갯수
      map.put("keyword", keyword); // 검색 옵션
      map.put("boardPager", boardPager);
      mv.addObject("map",map)// 맵에 저장된 데이터를 mv에 저장
        .setViewName("menu4ListPage");// 뷰를 menu4ListPage.jsp로 설정
      }
      return mv; //menu4ListPage.jsp로 list 전달
      }
   
   
   @RequestMapping("emplyMenu4View.me")//게시글상세보기
   public ModelAndView boardDetail(@RequestParam("bId") int bId,
                           ModelAndView mv) throws Exception{
      Board b = bService.selectBoard(bId);

         mv.addObject("board", b)
           .setViewName("menu4ViewPage");
      
      
      return mv;
   }
   
   /*게시글 작성 화면*/
   @RequestMapping("emplyMenu4Write.me")
   public String boardInsertView() {
      return "menu4WritePage";
   }
   
   /*게시글 작성 처리*/
   @RequestMapping("emplyMenu4insert.me")
   public String boardInsert(HttpServletRequest request, HttpSession session, String bTitle, String bContent) {      
      Member m = (Member) session.getAttribute("member");
      
      String mId = m.getmId();
      String mNickname = m.getmNickname();
      
      Board b = new Board(bTitle,bContent,mId,mNickname);
            
      int result = bService.boardInsert(b);
      
      return "redirect:emplyMenu4List.me";
   }
   
   /*게시글 수정 화면*/
   @RequestMapping("emplyMenu4UpdateView.me")
   public ModelAndView boardUpdateView(@RequestParam("bId") int bId,ModelAndView mv) {
         
      Board b = bService.getBoard(bId);
      
      mv.addObject("b", bId);
      mv.addObject("b", b)
         .setViewName("menu4UpdatePage");
      return mv;
   }
   
   
   /*게시글 수정 처리*/
   @RequestMapping("emplyMenu4Update.me")
   public String boardUpdate(HttpServletRequest request, HttpSession session, String bTitle, String bContent,
         @RequestParam("bId") int bId
                        ) throws Exception {
      Member m = (Member) session.getAttribute("member");
      
      String mId = m.getmId();
      String mNickname = m.getmNickname();
      
      Board b = new Board(bId,bTitle,bContent,mId,mNickname);

      int result = bService.boardUpdate(b);
      
      return "redirect:emplyMenu4View.me?bId=" + bId;
   }
      
   /*게시글 삭제*/
   @RequestMapping("emplyMenu4Delete.me")
   public String boardDelete(@RequestParam("bId") int bId) {
      bService.boardDelete(bId);
      return "redirect:emplyMenu4List.me";
   }
   
   
}