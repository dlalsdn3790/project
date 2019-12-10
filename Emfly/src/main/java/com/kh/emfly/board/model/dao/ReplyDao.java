package com.kh.emfly.board.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Reply;

@Repository("rDao")
public interface ReplyDao {

   void replyInsert(Reply reply);

   List<Reply> replySelect(int bId);

   int replyCount(int bId);

   int replyDelete(int rId);

}