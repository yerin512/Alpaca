package com.myteam.trip.community.controller;

import java.io.File;
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
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.trip.community.service.CommunityService;
import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.member.vo.MemberVO;

 
@Repository
@Controller("communityController")
public class CommunityController  {
	private static final String COMMUNITY_IMAGE_REPO = "C:\\community\\community_image";
	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommunityVO communityVO;
	
	
	@RequestMapping(value = "/community/listCommunitys.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listCommunitys(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List communitysList = communityService.listCommunitys();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("communitysList", communitysList);
		return mav;

	}
	 
	@RequestMapping(value = "/community/removeCommunity.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeCommunity(@RequestParam("c_no") int c_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			communityService.removeCommunity(c_no);
			File destDir = new File(COMMUNITY_IMAGE_REPO + "\\" + c_no);
			FileUtils.deleteDirectory(destDir);
		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/community/listCommunitys.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 한 개 이미지 글쓰기
	@RequestMapping(value = "/community/communityForm.do", method = RequestMethod.POST)
	public ResponseEntity communityForm(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> communityMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			communityMap.put(name, value);
		}

		List<String> imageFileName = upload(multipartRequest); 
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		String id = memberVO.getId();
		communityMap.put("id", id);
		communityMap.put("imageFileName", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int c_no = communityService.addNewCommunity(communityMap);
			if (imageFileName != null) {
				for (int i = 0; i < imageFileName.size(); i++) {
					File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName.get(i));
					File destDir = new File(COMMUNITY_IMAGE_REPO + "\\" + c_no);
					FileUtils.moveFileToDirectory(srcFile, destDir, true);
				}
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/board/listArticles.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/communityForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}	
	
	



	@RequestMapping(value = "/community/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}


	// 다중 이미지 업로드하기
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(COMMUNITY_IMAGE_REPO + "\\" + fileName);
			if (mFile.getSize() != 0) { // File Null Check
				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
						file.createNewFile(); // 이후 파일 생성
					}
				}
				mFile.transferTo(new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName)); // 임시로 저장된
																											// multipartFile을
																											// 실제 파일로 전송
			}
		}
		return fileList;
	}

}
