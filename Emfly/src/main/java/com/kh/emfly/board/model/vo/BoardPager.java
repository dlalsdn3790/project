package com.kh.emfly.board.model.vo;

public class BoardPager {
   // 페이지당 게시물 수
   public static final int PAGE_SCALE = 10;
   // 화면당 페이지 수
   public static final int BLOCK_SCALE = 5;
   private int curPage; // 현재 페이지
   private int prevPage; // 이전페이지
   private int nextPage; // 다음페이지
   private int totPage; // 전체페이지 개수
   private int totBlock; // 전체페이지 블록 개수
   private int curBlock; // 현재페이지 블록
   private int prevBlock; // 이전페이지 블록
   private int nextBlock; // 다음 페이지 블록
   private int pageBegin; // #{start}
   private int pageEnd; // #{end}
   private int blockBegin; // 현재페이지 블록의 시작번호
   private int blockEnd; // 현재페이지 블록의 끝번호
   
   
   // BoardPager(레코드 개수, 현재 페이지 번호)
   public BoardPager(int count, int curPage) {
      curBlock = 1;
      this.curPage = curPage;
      setTotPage(count);
      setPageRange();
      setTotBlock();
      setBlockRange();
   }
   
   public void setBlockRange() {
        //원하는 페이지가 몇번째 블록에 속하는지 계산
        curBlock=(curPage-1)/BLOCK_SCALE + 1;
        //블록의 시작페이지,끝페이지 번호 계산
        blockBegin=(curBlock-1)*BLOCK_SCALE+1;
        blockEnd=blockBegin+BLOCK_SCALE-1;
        //마지막 블록 번호가 범위를 초과하지 않도록 처리
        if(blockEnd > totPage) {
            blockEnd = totPage;
        }
        //[이전][다음]을 눌렀을 때 이동할 페이지 번호
        prevPage=(curBlock==1) ? 1 : (curBlock-1)*BLOCK_SCALE;
        nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE)
                : (curBlock*BLOCK_SCALE)+1;
        //마지막 페이지가 범위를 초과하지 않도록 처리
        if(nextPage >= totPage) {
            nextPage=totPage;
        }
    }
    
    //페이지블록의 총 갯수 계산 (총 100페이지라면 10개의 블록이다)
    public void setTotBlock() {
        totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
    }
    
    // where rn between #{start} and #{end}에 입력될 값        
    public void setPageRange() {
    // 시작번호=(현재페이지-1)x페이지당 게시물수 + 1
    // 끝번호=시작번호 + 페이지당 게시물수 - 1        
        pageBegin = (curPage-1) * PAGE_SCALE + 1;
        pageEnd = pageBegin + PAGE_SCALE - 1;
    }
    
    
    public int getCurPage() {
        return curPage;
    }
    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
    public int getPrevPage() {
        return prevPage;
    }
    public void setPrevPage(int prevPage) {
        this.prevPage = prevPage;
    }
    public int getNextPage() {
        return nextPage;
    }
    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }
    public int getTotPage() {
        return totPage;
    }
    public void setTotPage(int totPage) {
        this.totPage = totPage;
    }
    public int getTotBlock() {
        return totBlock;
    }
    public void setTotBlock(int totBlock) {
        this.totBlock = totBlock;
    }
    public int getCurBlock() {
        return curBlock;
    }
    public void setCurBlock(int curBlock) {
        this.curBlock = curBlock;
    }
    public int getPrevBlock() {
        return prevBlock;
    }
    public void setPrevBlock(int prevBlock) {
        this.prevBlock = prevBlock;
    }
    public int getNextBlock() {
        return nextBlock;
    }
    public void setNextBlock(int nextBlock) {
        this.nextBlock = nextBlock;
    }
    public int getPageBegin() {
        return pageBegin;
    }
    public void setPageBegin(int pageBegin) {
        this.pageBegin = pageBegin;
    }
    public int getPageEnd() {
        return pageEnd;
    }
    public void setPageEnd(int pageEnd) {
        this.pageEnd = pageEnd;
    }
    public int getBlockBegin() {
        return blockBegin;
    }
    public void setBlockBegin(int blockBegin) {
        this.blockBegin = blockBegin;
    }
    public int getBlockEnd() {
        return blockEnd;
    }
    public void setBlockEnd(int blockEnd) {
        this.blockEnd = blockEnd;
    }
}