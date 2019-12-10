package com.kh.emfly.board.model.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.emfly.board.model.service.ReplyService;
import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.Reply;
import com.kh.emfly.member.model.vo.Member;

@RestController

public class ReplyController {
   
   @Autowired
   ReplyService replyService;
   
//   댓글 입력
   @RequestMapping("replyInsert.me")
   public void replyInsert(@ModelAttribute Reply reply, 
                     HttpSession session ) {
      
      Member m = (Member)session.getAttribute("member");
      
      String mId = m.getmId();
      String mNickname =  m.getmNickname();
      
      reply.setmId(mId);
      reply.setmNickname(mNickname);
      
      replyService.replyInsert(reply);
   
   }
   
//   댓글 리스트
   @RequestMapping("replyList.me")
   public ModelAndView replyList(@RequestParam("bId") int bId, ModelAndView mv) {
      
      List<Reply> reList = replyService.replySelect(bId);
      
      int rListCount = replyService.replyCount(bId);//댓글갯수
      
      mv.addObject("rCount",rListCount);
      mv.addObject("reList",reList);
      mv.setViewName("menu4CommentPage");
      
      return mv;
   }
   
//   댓글 삭제
   @RequestMapping("replyDelete.me")
   public void replyDelete(@RequestParam("rId") int rId) {
      replyService.replyDelete(rId);
   }
}