package com.kh.emfly.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Reply;

@Repository
public class ReplyDaoImpl implements ReplyDao{
   @Autowired
   SqlSession sqlSession;
   
   @Override
   public void replyInsert(Reply reply) {
      sqlSession.insert("reply.replyInsert", reply);
      
   }

   @Override
   public List<Reply> replySelect(int bId) {
      
      return sqlSession.selectList("reply.replySelect",bId);
   }

   @Override
   public int replyCount(int bId) {
      
      return sqlSession.selectOne("reply.replyCount",bId);
   }

   @Override
   public int replyDelete(int rId) {
      
      return sqlSession.delete("reply.replyDelete",rId);
   }

}