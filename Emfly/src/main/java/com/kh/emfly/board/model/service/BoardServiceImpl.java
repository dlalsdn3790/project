package com.kh.emfly.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.emfly.board.model.dao.BoardDao;
import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService{
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Autowired
   private BoardDao bDao;

   @Override
   public ArrayList<Board> selectList(String keyword, int start, int end) throws Exception {
      return bDao.selectList(keyword, start, end);
   }

   @Override
   public Board selectBoard(int bId) throws Exception{
      
      bDao.addReadCount(bId);// 조회수 증가
      
      return bDao.selectBoard(bId);
   }

   @Override
   public int countArticle(String keyword) throws Exception {
      
      return bDao.countArticle(keyword);
   }

   @Override
   public int boardInsert(Board b) {

      return bDao.boardInsert(b);
   }

   @Override
   public int boardUpdate(Board b) {
      
      return bDao.boardUpdate(b);
   }

   @Override
   public int boardDelete(int bId) {
      
      return bDao.boardDelete(bId);
   }

   @Override
   public Board getBoard(int bId) {
      
      return bDao.getBoard(bId);
   }

}