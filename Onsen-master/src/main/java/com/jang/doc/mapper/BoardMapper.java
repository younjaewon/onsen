package com.jang.doc.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.jang.doc.model.AttFileVO;
import com.jang.doc.model.BoardLikeVO;
import com.jang.doc.model.BoardVO;
import com.jang.doc.model.BoardViewVO;
import com.jang.doc.model.ReplyLikeVO;
import com.jang.doc.model.ReplyVO;
import com.jang.doc.model.SearchVO;


@Mapper
public interface BoardMapper {
	
	List<BoardVO> getBoardList(SearchVO searchVO); //�� �����ȸ
	List<BoardVO> getADBoardList();
	
	BoardVO getArticle(int bno); 			//����ȸ
	int writeArticle(BoardVO board);		//������
	int updateArticle(BoardVO board);		//�ۼ���
	void deleteArticle(int bno);			//�ۻ���
	
	int getTotalRow(SearchVO searchVO);		//��ü�� �� ��ȸ
	
	int incrementViewCnt(int bno);			//��ȸ�� ����
	int incrementGoodCnt(int bno);			//���ƿ� �߰�
	int incrementReplyCnt(int bno);			//��� �� ����
	
	List<ReplyVO> getReplyList(int bno);	//��� �����ȸ
	ReplyVO getReply(int rno);				//��� ��ȸ
	
	int writeReply(ReplyVO reply);			//�������
	int updateReply(ReplyVO reply);			//��ۼ���
	void deleteReply(int rno);				//��ۻ���
	void deleteReplyBybno(int bno);			//���ۿ� �Ҽӵ� ��� ��ü ����
	
	int incReplyGoodCnt(int rno);			//��� ���ƿ� ����
	
	List<AttFileVO> getFileList(int bno);	//÷������ ��� ��ȸ
	String getFileName(int fno);			//÷������ �̿� ��ȸ
	int insertFile(AttFileVO file);			//÷������ ����
	
	void deleteFile(int fno);				//÷������ ����
	void deleteFileBybno(int bno);			//���ۿ� �Ҽӵ� ÷������ ��ü ����
	
	int addBoardLike(BoardLikeVO boardLike);	//id-Ư���� ���ƿ� ��� ����
	int getBoardLike(BoardLikeVO boardLike);	//id-Ư���� ���ƿ� ��� ��ȸ
	
	int addReplyLike(ReplyLikeVO replyLike);	//id-Ư����� ���ƿ� ��� ����
	int getReplyLike(ReplyLikeVO replyLike);	//id-Ư����� ���ƿ� ��� ��ȸ
	
	int addBoardView(BoardViewVO boardView);	//id-Ư���� ��ȸ�̷� ���
	int getBoardView(BoardViewVO boardView);	//id-Ư���� ��ȸ�̷� �б�
	ArrayList<Map<String, Object>> selectKnowhow(Map<String, Object> item);
	
}
