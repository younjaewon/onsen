package com.jang.doc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jang.doc.mapper.BoardMapper;
import com.jang.doc.model.AttFileVO;
import com.jang.doc.model.BoardLikeVO;
import com.jang.doc.model.BoardVO;
import com.jang.doc.model.BoardViewVO;
import com.jang.doc.model.ReplyLikeVO;
import com.jang.doc.model.ReplyVO;
import com.jang.doc.model.SearchVO;
import com.jang.doc.utils.PageHelper;


@Service(value = "boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private PageHelper pageHelper;
	
	
	@Override
	public StringBuffer getPageUrl(SearchVO searchVO) {
		
		int totalRow = boardMapper.getTotalRow(searchVO);
		
		return pageHelper.getPageUrl(searchVO,totalRow);
	}
	
		
	@Override
	public List<BoardVO> getBoardList(SearchVO searchVO){
		
		int currentPage = searchVO.getPage();
		
		int startRow = (currentPage - 1) * this.pageHelper.getPageSize(); //pagesize=10가정
		int endRow = currentPage * this.pageHelper.getPageSize();		  //pagesize=10
		
		searchVO.setStartRow(startRow);
		searchVO.setEndRow(endRow);
		
		return this.boardMapper.getBoardList(searchVO);
	}
	
	
	@Override
	public int writeArticle(BoardVO board) {
		return this.boardMapper.writeArticle(board);
	
	}
	
	@Override
	public List<AttFileVO> getFileList(int bno) {
		return this.boardMapper.getFileList(bno);
	}
	
	@Override
	public int insertFile(AttFileVO file) {
		return this.boardMapper.insertFile(file);
	}
	
	@Override
	public List<BoardVO> getADBoardList() {

		return this.boardMapper.getADBoardList();
	}
	
	@Override
	public BoardVO getArticle(int bno) {
		return this.boardMapper.getArticle(bno);
	}
	
	@Override
	public int updateArticle(BoardVO board) {
		return this.boardMapper.updateArticle(board);
	}
	
	@Override
	public void deleteArticle(int bno) {
		this.boardMapper.deleteArticle(bno);
	}
	
	@Override
	public int getTotalRow(SearchVO searchVO) {
		return 0;
	}
	
	@Override
	public int incrementViewCnt(int bno) {
		return this.boardMapper.incrementViewCnt(bno);
	}
	
	@Override
	public int incrementGoodCnt(int bno) {
		return this.boardMapper.incrementGoodCnt(bno);
	}
	
	@Override
	public int incrementReplyCnt(int bno) {
		return this.boardMapper.incrementReplyCnt(bno);
	}
	@Override
	public List<ReplyVO> getReplyList(int bno) {
		return this.boardMapper.getReplyList(bno);
	}
	
	@Override
	public ReplyVO getReply(int rno) {
		return this.boardMapper.getReply(rno);
	}
	
	@Override
	public int writeReply(ReplyVO reply) {
		int bno = reply.getBno();
		this.boardMapper.incrementReplyCnt(bno);
		return this.boardMapper.writeReply(reply);
	}
	@Override
	public int updateReply(ReplyVO reply) {
		return this.boardMapper.updateReply(reply);
	}
	
	@Override
	public void deleteReply(int rno) {
		this.boardMapper.deleteReply(rno);
	}
	
	@Override
	public void deleteReplyBybno(int bno) {
		this.boardMapper.deleteReplyBybno(bno);
	}
	
	@Override
	public int incReplyGoodCnt(int rno) {
		return this.boardMapper.incReplyGoodCnt(rno);
	}
	
	@Override
	public String getFileName(int fno) {
		return this.boardMapper.getFileName(fno);
	}
	
	@Override
	public void deleteFile(int fno) {
		this.boardMapper.deleteFile(fno);
	}
	
	@Override
	public void deleteFileBybno(int bno) {
		this.boardMapper.deleteFileBybno(bno);
	}
	
	@Override
	public int addBoardLike(BoardLikeVO boardLike) {
		return this.boardMapper.addBoardLike(boardLike);
	}
	
	@Override
	public int getBoardLike(BoardLikeVO boardLike) {
		return this.boardMapper.getBoardLike(boardLike);
	}

	@Override
	public int addReplyLike(ReplyLikeVO replyLike) {
		return this.boardMapper.addReplyLike(replyLike);
	}

	@Override
	public int getReplyLike(ReplyLikeVO replyLike) {
		return this.boardMapper.getReplyLike(replyLike);
	}
	
	@Override
	public int addBoardView(BoardViewVO boardView) {
		// TODO Auto-generated method stub
		return this.boardMapper.addBoardView(boardView);
	}
	
	@Override
	public int getBoardView(BoardViewVO boardView) {
		return this.boardMapper.getBoardView(boardView);
	}
	
	public int increaseViewCnt(int bno) { // 글번호 조회수 증가
		return this.boardMapper.incrementViewCnt(bno);
	}
	
	@Override
	public void deletReplyBubno(int bno) {
		// TODO Auto-generated method stub
		this.boardMapper.deleteReplyBybno(bno);
	}
	
	@Override
	public ArrayList<Map<String, Object>> selectKnowhow(Map<String, Object> item) {
		// TODO Auto-generated method stub
		return this.boardMapper.selectKnowhow(item);
	}
}