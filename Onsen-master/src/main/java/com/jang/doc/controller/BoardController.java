package com.jang.doc.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jang.doc.model.AttFileVO;
import com.jang.doc.model.BoardVO;
import com.jang.doc.model.BoardViewVO;
import com.jang.doc.model.ReplyVO;
import com.jang.doc.model.SearchVO;
import com.jang.doc.service.BoardService;


@Controller
public class BoardController {

	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public String listPage(@ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpSession session) throws Exception{
		
		
		
		
		List<BoardVO> blist = boardService.getBoardList(searchVO);
		model.addAttribute("boardList",blist);
		
		StringBuffer pageUrl = boardService.getPageUrl(searchVO);
		model.addAttribute("pageHttp",pageUrl);
		
		model.addAttribute("searchVO",searchVO);
		
		return "board/list";
		
	}
	
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String boardWrite() {
		return "board/write";
	}
	
	
	String uploadPath = "C:\\upload\\"; // file upload path 전역변수 선언
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWriteProc(@ModelAttribute("BoardVO") BoardVO boardVO, MultipartHttpServletRequest request,HttpSession session) {
		
		
		String a = (String) session.getAttribute("id");
		
		String content = boardVO.getContent();
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("\r\n", "<br />");// java새줄 코드 HTML줄바꾸기로
		content = content.replaceAll("\"", "&quot;");
		
		boardVO.setContent(content);
		boardVO.setWriterId(a);
		System.out.println(boardVO.toString());
		boardService.writeArticle(boardVO);
		
		int bno = boardVO.getBno(); // 저장시 생성한 새글번호가 반환:xml 파일 insert keyProperty="bno"에 의해서 설정됨
		AttFileVO file = new AttFileVO();
		List<MultipartFile> fileList = request.getFiles("file");
		for (MultipartFile mf : fileList) {
			if (!mf.isEmpty()) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				long fileSize = mf.getSize(); // 파일 사이즈

				file.setBno(bno);
				file.setOfilename(originFileName);
				file.setSfilename(originFileName);
				file.setFilesize(fileSize);

				boardService.insertFile(file);// 테이블에 화일 정보 저장

				String safeFile = uploadPath + originFileName; // 디스크에 파일 저장

				try {
					mf.transferTo(new File(safeFile)); // 디스크에 파일 저장
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return "redirect:list";
	}
	
	
	
	@RequestMapping("/view")
	public String boardView(@RequestParam(value = "bno", required = false, defaultValue = "0") int bno, HttpSession session, Model model) throws Exception {

		String userId = (String) session.getAttribute("id");
		
//		System.out.println(userId);
		boardService.incrementViewCnt(bno);
		
		BoardViewVO boardViewVO = new BoardViewVO(); // �?조회 ?��?�� ?��
		boardViewVO.setBno(bno);

		BoardVO board = boardService.getArticle(bno); // get selected article model

		List<ReplyVO> reply = boardService.getReplyList(bno); // ?���? 목록 ?��?�� ?���? ?? list
		List<AttFileVO> fileList = boardService.getFileList(bno); // 첨�??��?�� 목록 ?��?�� ?���?-list
		
		

		model.addAttribute("board", board);
		model.addAttribute("replyList", reply);
		model.addAttribute("fileList", fileList);

		return "board/view";
	}
	
	@RequestMapping(value = "/modify", method=RequestMethod.GET )
	public String boardModify(HttpServletRequest request, HttpSession session, Model model){

	String userId = (String) session.getAttribute("id");
	int bno = Integer.parseInt(request.getParameter("bno"));

	BoardVO board = boardService.getArticle(bno);

	// <br /> tag change to new line code
	String content = board.getContent().replaceAll("<br />", "\r\n");
	board.setContent(content); 

	if(!userId.equals(board.getWriterId())){ //비회원 글수정 불가
	model.addAttribute("errCode", "1"); 
	model.addAttribute("bno", bno);
	return "redirect:view";
	} else {//회원 글수정
	List<AttFileVO> fileList = boardService.getFileList(bno); // 첨부파일 읽어 오기 - list

	model.addAttribute("board", board);
	model.addAttribute("fileList", fileList);
	return "board/modify";
	}
	}

	@RequestMapping(value = "/modify", method=RequestMethod.POST)  //게시판 글 수정
	public String  boardModifyProc(@ModelAttribute("Board") BoardVO board, MultipartHttpServletRequest request, RedirectAttributes rea ){

		
	
	String content =  board.getContent().replaceAll("\r\n", "<br />"); //java 새줄 코드 HTML줄바꾸기로
	board.setContent(content);
	boardService.updateArticle(board);
	int bno = board.getBno(); 

	//체크된 파일을 테이블과 디스크에서 삭제한다.
	String[] fileno = request.getParameterValues("fileno");

	if (fileno != null) {

	for (String fn : fileno) {

	    int fno = Integer.parseInt(fn);
	    
	    String oFileName = boardService.getFileName(fno);
	   
	    String safeFile = uploadPath +  oFileName;
	    
	    File removeFile = new File(safeFile);// remove disk uploaded file 
	    removeFile.delete();
	        
	    boardService.deleteFile(fno); //remove table uploaded file 
	}
	}
    AttFileVO file = new AttFileVO ();

    //새첨부 파일  목록 일어오기
    List<MultipartFile> fileList = request.getFiles("file");
   
    for (MultipartFile mf : fileList) {
   if (!mf.isEmpty()) {
        String originFileName = mf.getOriginalFilename(); // 새첨부파일 원본 파일 명
    	 long fileSize = mf.getSize(); // 파일 사이즈
        
        file.setBno(bno);
        file.setFilesize(fileSize); 
        file.setOfilename(originFileName);
        file.setSfilename(originFileName);
             
        boardService.insertFile(file); // 테이블에 파일 저장 

        String safeFile = uploadPath +  originFileName; 

        try {
            mf.transferTo(new File(safeFile)); // 디스크에 파일 저장 
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
   }
  }
  rea.addAttribute("bno", board.getBno());
  return "redirect:/view.do";
}
	@RequestMapping("/delete")
	public String boardDelete(HttpServletRequest request, HttpSession session, RedirectAttributes rea) {
		
		String userId = (String) session.getAttribute("id"); // login 개발?�� ?��?��
		int bno = Integer.parseInt(request.getParameter("bno"));

		BoardVO board = boardService.getArticle(bno);

		String setView = "";
		if (userId.equals(board.getWriterId())) { // ?���? ?��?��
			List<ReplyVO> reply = boardService.getReplyList(bno);
			if (reply.size() > 0) {
				boardService.deleteReplyBybno(bno);
			}
			// 첨�? ?��?���? ?��?��, ?��?�� ?��?�� ?��?��
			List<AttFileVO> files = boardService.getFileList(bno);
			if (files.size() > 0) {
				// ???��?�� ?��?�� ?��?�� ?��?��
				for (AttFileVO filedel : files) {
					String f_stor_all = filedel.getOfilename();
					File f = new File(session.getServletContext().getRealPath("/") + f_stor_all);
					f.delete();
				}
				boardService.deleteFileBybno(bno); // ?��?��블에?�� ?��?�� 번호 �? 첨�? file ?���? ?��?��
			} // board ?��?��
			boardService.deleteArticle(bno);
			setView = "redirect:list";
		} else {
			rea.addAttribute("errCode", "1");// it's forbidden connection
			rea.addAttribute("bno", bno);
			setView = "redirect:view";
		}
		return setView;
	}
	
	@RequestMapping(value = "filedown")
	@ResponseBody
	public byte[] downProcess(HttpServletResponse response,@RequestParam  String fileName ) throws IOException{

	File file = new File("c:/upload/" + fileName);
	byte[] bytes = FileCopyUtils.copyToByteArray(file); //SPRING 5.0 이상 

	String fn = new String(file.getName().getBytes(), "iso_8859_1");

	response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
	response.setContentLength(bytes.length);

	return bytes;
	}

	
}