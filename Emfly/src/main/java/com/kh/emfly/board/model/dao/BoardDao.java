package com.kh.emfly.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.Reply;

@Repository("bDao")
public interface BoardDao {

   ArrayList<Board> selectList(String keyword, int start, int end) throws Exception;

   Board selectBoard(int bId) throws Exception;

   void addReadCount(int bId) throws Exception;

   int countArticle(String keyword);

   int boardInsert(Board b);

   int boardUpdate(Board b);

   int boardDelete(int bId);

   Board getBoard(int bId);

   

}