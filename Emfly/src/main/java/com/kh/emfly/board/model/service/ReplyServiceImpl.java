package com.kh.emfly.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emfly.board.model.dao.ReplyDao;
import com.kh.emfly.board.model.vo.Reply;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
   
   @Autowired
   private ReplyDao rDao;
   
   @Override
   public void replyInsert(Reply reply) {
      
      rDao.replyInsert(reply);
   }

   @Override
   public List<Reply> replySelect(int bId) {
      
      return rDao.replySelect(bId);
   }

   @Override
   public int replyCount(int bId) {
      
      return rDao.replyCount(bId);
   }

   @Override
   public int replyDelete(int rId) {
      
      return rDao.replyDelete(rId);
   }

}