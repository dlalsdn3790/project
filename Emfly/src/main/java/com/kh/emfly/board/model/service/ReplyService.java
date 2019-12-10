package com.kh.emfly.board.model.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.emfly.board.model.vo.Reply;

@Repository
public interface ReplyService {

   void replyInsert(Reply reply);

   List<Reply> replySelect(int bId);

   int replyCount(int bId);

   int replyDelete(int rId);

}