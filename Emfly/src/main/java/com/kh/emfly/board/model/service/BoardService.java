package com.kh.emfly.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Board;
import com.kh.emfly.board.model.vo.Reply;

@Repository
public interface BoardService {
   // 게시글 목록
   ArrayList<Board> selectList(String keyword, int start, int end) throws Exception;
   
   // 게시글 상세보기
   Board selectBoard(int bId) throws Exception;

   int countArticle(String keyword) throws Exception;

   int boardInsert(Board b);

   int boardUpdate(Board b);

   int boardDelete(int bId);

   Board getBoard(int bId);



}
