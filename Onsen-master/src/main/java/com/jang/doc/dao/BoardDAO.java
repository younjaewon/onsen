package com.jang.doc.dao;

import java.util.List;

import com.jang.doc.model.BoardVO;
import com.jang.doc.model.SearchVO;

public interface BoardDAO {
	

	List<BoardVO> getBoardList(SearchVO searchVO);//글목록조회
	StringBuffer getPageUrl(SearchVO searchVO);//페이지 URL생성

}
