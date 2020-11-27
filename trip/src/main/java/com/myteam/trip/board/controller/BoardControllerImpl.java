package com.myteam.trip.board.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.trip.board.service.BoardService;
import com.myteam.trip.board.vo.ArticleVO;
import com.myteam.trip.board.vo.ThumbnailVO;
import com.myteam.trip.board.vo.AImageVO;
import com.myteam.trip.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	@Autowired
	private ThumbnailVO thumbnailVO;

	
	@RequestMapping(value = "/board/listArticles.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ThumbnailVO> thumbnailsList = boardService.listThumbnails();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("thumbnailsList", thumbnailsList);
		return mav;

	}

	@RequestMapping(value = "/board/viewArticle.do", method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		Map articleMap = boardService.viewArticle(articleNO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("articleMap", articleMap);
		return mav;
	}

	@RequestMapping(value = "/board/modArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		String imageFileName = "";// upload(multipartRequest);
		articleMap.put("imageFileName", imageFileName);

		String articleNO = (String) articleMap.get("articleNO");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.modArticle(articleMap);
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);

				String originalFileName = (String) articleMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO + "\\" + originalFileName);
				oldFile.delete();
			}
			message = "<script>";
			message += " alert('수정 성공');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?articleNO="
					+ articleNO + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();
			message = "<script>";
			message += " alert('수정 실패');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/viewArticle.do?articleNO="
					+ articleNO + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/removeArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeArticle(articleNO);
			File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
			FileUtils.deleteDirectory(destDir);

			message = "<script>";
			message += " alert('삭제 성공');";
			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('삭제실패');";
			message += " location.href='" + request.getContextPath() + "/board/listArticles.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@Override
	@RequestMapping(value = "/board/addNewArticle.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		String imageFileName = null;

		Map articleMap = new HashMap();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}

		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("id", id);

		List<String> fileList = upload(multipartRequest, response);
		List<AImageVO> imageFileList = new ArrayList<AImageVO>();
		if (fileList != null && fileList.size() != 0) {
			for (String fileName : fileList) {
				AImageVO imageVO = new AImageVO();
				imageVO.setImageFileName(fileName);
				imageFileList.add(imageVO);
			}
			articleMap.put("imageFileList", imageFileList);
		}
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	

		String a = articleMap.toString();
		System.out.println(a);
		
		try {
			int articleNO = boardService.addNewArticle(articleMap);
			if (imageFileList != null && imageFileList.size() != 0) {
				for (AImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getImageFileName();
					if (!(imageFileName == null || imageFileName.equals("null"))) {
						File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
						File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleNO);
						// destDir.mkdirs();
						try {
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
						}catch(FileNotFoundException e) {
							message = " <script>";
							message += " alert('중복된 파일이 있습니다.');";
							message += " location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do'; ";
							message += " </script>";
							resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
							e.printStackTrace();
						}
					}

				}
			}

			message = "<script>";
			message += " alert('게시글 작성 성공');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			if (imageFileList != null && imageFileList.size() != 0) {
				for (AImageVO imageVO : imageFileList) {
					imageFileName = imageVO.getImageFileName();
					File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
					srcFile.delete();
				}
			}

			message = " <script>";
			message += " alert('작성 실패');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	@RequestMapping(value = "/board/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	


	private List<String> upload(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();

		try{

			while (fileNames.hasNext()) {
				String fileName = fileNames.next();
				MultipartFile mFile = multipartRequest.getFile(fileName);
				String originalFileName = mFile.getOriginalFilename();
				fileList.add(originalFileName);
				File file = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + fileName);
				if (mFile.getSize() != 0) { // File Null Check
					if (!file.exists()) {
						file.getParentFile().mkdirs();
						mFile.transferTo(new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName));
					}
				}
			}
			
		}catch(FileNotFoundException e){
			e.printStackTrace();
			String message;
			ResponseEntity resEnt = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			
			message = " <script>";
			message += " alert('중복된 파일이 있습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/articleForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		return fileList;
	}

}
