package com.kh.emfly.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.Reply;

@Repository
public class BoardDaoImpl implements BoardDao {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public ArrayList<Board> selectList(String keyword, int start, int end) throws Exception{
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("keyword", keyword);
      // BETWEEN #{start}, #{end}에 입력될 값을 맵에
      map.put("start", start);
      map.put("end", end);
      return (ArrayList)sqlSession.selectList("board.selectList", map);
      
   }

   @Override
   public Board selectBoard(int bId) throws Exception{

      return sqlSession.selectOne("board.selectBoard",bId);
   }

   @Override
   public void addReadCount(int bId) throws Exception{
      sqlSession.update("board.addReadCount", bId);
      
   }

   @Override
   public int countArticle(String keyword) {
      Map<String, String> map = new HashMap<String, String>();
      map.put("keyword", keyword);
      return sqlSession.selectOne("board.countArticle", map);
   }

   @Override
   public int boardInsert(Board b) {
      return sqlSession.insert("board.boardInsert", b);
   }

   @Override
   public int boardUpdate(Board b) {
      return sqlSession.update("board.boardUpdate", b);
   }

   @Override
   public int boardDelete(int bId) {
      return sqlSession.delete("board.boardDelete", bId);
   }

   @Override
   public Board getBoard(int bId) {
      
      return sqlSession.selectOne("board.getBoard",bId);
   }
   
}