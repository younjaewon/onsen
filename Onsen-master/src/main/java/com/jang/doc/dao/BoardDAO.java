package com.jang.doc.dao;

import java.util.List;

import com.jang.doc.model.BoardVO;
import com.jang.doc.model.SearchVO;

public interface BoardDAO {
	

	List<BoardVO> getBoardList(SearchVO searchVO);//�۸����ȸ
	StringBuffer getPageUrl(SearchVO searchVO);//������ URL����

}
