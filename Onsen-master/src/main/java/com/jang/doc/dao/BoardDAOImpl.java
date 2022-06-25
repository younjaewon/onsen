package com.jang.doc.dao;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.jang.doc.mapper.BoardMapper;
import com.jang.doc.model.BoardVO;
import com.jang.doc.model.SearchVO;
import com.jang.doc.utils.PageHelper;

public class BoardDAOImpl implements BoardDAO{
	

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
		
		int startRow = (currentPage - 1) * this.pageHelper.getPageSize(); //pagesize=10°¡Á¤
		int endRow = currentPage * this.pageHelper.getPageSize();		  //pagesize=10
		
		searchVO.setStartRow(startRow);
		searchVO.setEndRow(endRow);
		
		return this.boardMapper.getBoardList(searchVO);
	}

}