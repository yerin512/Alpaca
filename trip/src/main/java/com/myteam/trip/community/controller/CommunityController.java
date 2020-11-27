package com.myteam.trip.community.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.trip.community.dao.CommunityDAO;
import com.myteam.trip.community.service.CommunityService;
import com.myteam.trip.community.vo.CommunityVO;
import com.myteam.trip.community.vo.PagingVO;
import com.myteam.trip.member.vo.MemberVO;

 
@Repository
@Controller("communityController")
public class CommunityController  {
	private static final String FILE_URL = null;
	@Autowired
	private CommunityService communityService;
	@Autowired
	private CommunityVO communityVO;
	@Autowired
	private CommunityDAO comunityDAO;
	PagingVO p = new PagingVO();
	
	
	
	//1. 전체 게시물의 수를 구하기
	@RequestMapping(value = "/community/getTotalCount.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getTotalCount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 전체 게시물의 수를 구하기
		//System.out.println("totalCount : " + DAO.getTotalCount());
		p.setTotalRecord(comunityDAO.getTotalCount()); // 전체 게시글 수
		p.setTotalPage(); //전체 페이지 갯수 구하기
		System.out.println("전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호(end) 구하기
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		System.out.println("---------");
		System.out.println("현재페이지 : " + p.getNowPage());
		System.out.println("시작글번호 : " + p.getBegin());
		System.out.println("끝글번호 : " + p.getEnd());
		
		//4. 블록(block) 계산하기(블록의 시작, 끝페이지 구하기)
		int nowPage = p.getNowPage();
		int currentBlock = (nowPage - 1) / p.getPagePerBlock() + 1;
		p.setEndPage(currentBlock * p.getPagePerBlock());
		p.setBeginPage(p.getEndPage() - p.getPagePerBlock() + 1);
		
		System.out.println("---- 블럭의 시작, 끝 페이지 ----");
		System.out.println("현재페이지 : " + p.getNowPage());
		System.out.println("시작페이지 : " + p.getBeginPage());
		System.out.println("끝페이지 : " + p.getEndPage());
		
		//5. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지 값을 전체페이지수로 변경처리
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("---- 블럭의 시작, 끝 페이지(정정후) ----");
		System.out.println(">> 시작페이지 : " + p.getBeginPage());
		System.out.println(">> 끝페이지 : " + p.getEndPage());
		
		//========================================================
		//현재 페이지 기준으로 DB데이터(게시글) 가져오기
		//시작글번호, 끝글번호로 Map 데이터 만들어서 파라미터 전달
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		
		String viewName = (String) request.getAttribute("viewName");
		List communityList = communityService.listCommunity();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("communityList", communityList);
		System.out.println("list : " + communityList);
		
		return mav;
		
	}
	
	@RequestMapping(value = "/community/listCommunity.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listCommunity(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List communityList = communityService.listCommunity();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("communityList", communityList);
		
		return mav;
		
	}
	

	// 한 개 이미지 글쓰기
	@RequestMapping(value = "/community/addNewCommunity.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewCommunity(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> communityMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			communityMap.put(name, value);
		}
//id, c_title, c_content, c_imageFileName
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); 
		String id = memberVO.getId();
		communityMap.put("id", id);
		System.out.println("id : " + id);


		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int c_no = communityService.addNewCommunity(communityMap);
						
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/index.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/community/communityForm.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}

	// 한개의 이미지 보여주기
	@RequestMapping(value = "/community/viewCommunity.do", method = RequestMethod.GET)
	public ModelAndView viewCommunity(@RequestParam("c_no") int c_no, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		communityVO = communityService.viewCommunity(c_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		System.out.println("viewName!!!! :" +viewName);
		mav.addObject("community", communityVO);
		return mav;
		
		
	}

	 //한 개 이미지 수정 기능
	  @RequestMapping(value="/community/modCommunity.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity modCommunity(MultipartHttpServletRequest multipartRequest,  
	    HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> communityMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			communityMap.put(name,value);
		}
		
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		communityMap.put("id", id);
		
		String c_no=(String)communityMap.get("c_no");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	       communityService.modCommunity(communityMap);
	       message = "<script>";
		   message += " alert('글을 수정했습니다.');";
		   message += " location.href='"+multipartRequest.getContextPath()+"/community/viewCommunity.do?c_no="+c_no+"';";
		   message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }catch(Exception e) {
	      message = "<script>";
		  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/community/viewCommunity.do?c_no="+c_no+"';";
		  message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }
	    return resEnt;
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

			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='" + request.getContextPath() + "/community/listCommunity.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);

		} catch (Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='" + request.getContextPath() + "/community/listCommunity"
					+ ".do';";
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


//	// 다중 이미지 업로드하기
//	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
//		List<String> fileList = new ArrayList<String>();
//		Iterator<String> fileNames = multipartRequest.getFileNames();
//		while (fileNames.hasNext()) {
//			String fileName = fileNames.next();
//			MultipartFile mFile = multipartRequest.getFile(fileName);
//			String originalFileName = mFile.getOriginalFilename();
//			fileList.add(originalFileName);
//			File file = new File(COMMUNITY_IMAGE_REPO + "\\" + fileName);
//			if (mFile.getSize() != 0) { // File Null Check
//				if (!file.exists()) { // 경로상에 파일이 존재하지 않을 경우
//					if (file.getParentFile().mkdirs()) { // 경로에 해당하는 디렉토리들을 생성
//						file.createNewFile(); // 이후 파일 생성
//					}
//				}
//				mFile.transferTo(new File(COMMUNITY_IMAGE_REPO + "\\" + "temp" + "\\" + originalFileName)); // 임시로 저장된
//																											// multipartFile을
//																											// 실제 파일로 전송
//			}
//		}
//		return fileList;
//	}
	
	
	
	/*ckeditor4 이미지 업로드*/
	
//	 @RequestMapping(value="/community/imageUpload.do", method = RequestMethod.POST)
//	    public void imageUpload(HttpServletRequest request,
//	            HttpServletResponse response, MultipartHttpServletRequest multiFile
//	            , @RequestParam MultipartFile upload) throws Exception{
//	        // 랜덤 문자 생성
//	        UUID uid = UUID.randomUUID();
//	        
//	        OutputStream out = null;
//	        PrintWriter printWriter = null;
//	        
//	        //인코딩
//	        response.setCharacterEncoding("utf-8");
//	        response.setContentType("text/html;charset=utf-8");
//	        
//	        try{
//	            
//	            //파일 이름 가져오기
//	            String fileName = upload.getOriginalFilename();
//	            byte[] bytes = upload.getBytes();
//	            
//	            //이미지 경로 생성
//	            String path = fileDir.getPath() + "ckImage/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
//	            String ckUploadPath = path + uid + "_" + fileName;
//	            File folder = new File(path);
//	            
//	            //해당 디렉토리 확인
//	            if(!folder.exists()){
//	                try{
//	                    folder.mkdirs(); // 폴더 생성
//	                }catch(Exception e){
//	                    e.getStackTrace();
//	                }
//	            }
//	            
//	            out = new FileOutputStream(new File(ckUploadPath));
//	            out.write(bytes);
//	            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
//	            
//	            String callback = request.getParameter("CKEditorFuncNum");
//	            printWriter = response.getWriter();
//	            String fileUrl = "/mine/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName;  // 작성화면
//	            
//	        // 업로드시 메시지 출력
//	          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
//	          printWriter.flush();
//	            
//	        }catch(IOException e){
//	            e.printStackTrace();
//	        } finally {
//	          try {
//	           if(out != null) { out.close(); }
//	           if(printWriter != null) { printWriter.close(); }
//	          } catch(IOException e) { e.printStackTrace(); }
//	         }
//	        
//	        return;
//	    }
//	    
//	    /**
//	     * cKeditor 서버로 전송된 이미지 뿌려주기
//	     * @param uid
//	     * @param fileName
//	     * @param request
//	     * @return
//	     * @throws ServletException
//	     * @throws IOException
//	     */
//	    //
//	    @RequestMapping(value="/community/ckImgSubmit.do")
//	    public void ckSubmit(@RequestParam(value="uid") String uid
//	                            , @RequestParam(value="fileName") String fileName
//	                            , HttpServletRequest request, HttpServletResponse response)
//	 throws ServletException, IOException{
//	        
//	        //서버에 저장된 이미지 경로
//	        String path = fileDir.getPath() + "ckImage/";
//	    
//	        String sDirPath = path + uid + "_" + fileName;
//	    
//	        File imgFile = new File(sDirPath);
//	        
//	        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
//	        if(imgFile.isFile()){
//	            byte[] buf = new byte[1024];
//	            int readByte = 0;
//	            int length = 0;
//	            byte[] imgBuf = null;
//	            
//	            FileInputStream fileInputStream = null;
//	            ByteArrayOutputStream outputStream = null;
//	            ServletOutputStream out = null;
//	            
//	            try{
//	                fileInputStream = new FileInputStream(imgFile);
//	                outputStream = new ByteArrayOutputStream();
//	                out = response.getOutputStream();
//	                
//	                while((readByte = fileInputStream.read(buf)) != -1){
//	                    outputStream.write(buf, 0, readByte);
//	                }
//	                
//	                imgBuf = outputStream.toByteArray();
//	                length = imgBuf.length;
//	                out.write(imgBuf, 0, length);
//	                out.flush();
//	                
//	            }catch(IOException e){
//	                logger.info(e);
//	            }finally {
//	                outputStream.close;
//	                fileInputStream.close;
//	                out.close;
//	            }
//	        }
//	    }
	
//	    @RequestMapping(value = "/fileUpload.do")
//	    public String fileUpload(@ModelAttribute("fileUploadVO") FileUploadVO fileUploadVO , HttpServletRequest request , Model model){
//	        HttpSession session = request.getSession();
//	        String rootPath = session.getServletContext().getRealPath("/");
//	        String attachPath = "upload/";
//
//	        MultipartFile upload = fileUploadVO.getUpload();
//	        String filename = "";
//	        String CKEditorFuncNum = "";
//	        
//	        if(upload != null){
//	            filename = upload.getOriginalFilename();
//	            fileUploadVO.setFilename(filename);
//	            CKEditorFuncNum = fileUploadVO.getCKEditorFuncNum();
//	            try{
//	                File file = new File(rootPath + attachPath + filename);
//	                upload.transferTo(file);
//	            }catch(IOException e){
//	                e.printStackTrace();
//	            }  
//	        }
//	            model.addAttribute("filePath",attachPath + filename);          //결과값을
//	            model.addAttribute("CKEditorFuncNum",CKEditorFuncNum);//jsp ckeditor 콜백함수로 보내줘야함
//	        return "sample/fileUploadComplete";
//	}
	
	
/*	@RequestMapping(value="/community/fileupload.do", method=RequestMethod.POST)
	@ResponseBody
	public String fileUpload(HttpServletRequest req, HttpServletResponse resp, 
                 MultipartHttpServletRequest multiFile) throws Exception {
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		if(file != null){
			if(file.getSize() > 0){
				if(file.getContentType().toLowerCase().startsWith("image/")){
					try{
						String fileName = file.getName();
						byte[] bytes = file.getBytes();
						String uploadPath = req.getServletContext().getRealPath("/img");
						File uploadFile = new File(uploadPath);
						if(!uploadFile.exists()){
							uploadFile.mkdirs();
						}
						fileName = UUID.randomUUID().toString();
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
                        out.write(bytes);
                        
                        printWriter = resp.getWriter();
                        resp.setContentType("text/html");
                        String fileUrl = req.getContextPath() +  "/resources" + "/img/" + fileName;
                        
                        
                        /*
                        File srcFile = new File("C:\\community\\community_image" + fileName);
						File destDir = new File(fileUrl);
				
						FileUtils.moveFileToDirectory(srcFile, destDir, true);
                        */
                        
                        
                        // json 데이터로 등록
                        // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
                        // 이런 형태로 리턴이 나가야함.
	/* json.addProperty("uploaded", 1);
                        json.addProperty("fileName", fileName);
                        json.addProperty("url", fileUrl);
                        
                        printWriter.println(json);
                    }catch(IOException e){
                        e.printStackTrace();
                    }finally{
                        if(out != null){
                            out.close();
                        }
                        if(printWriter != null){
                            printWriter.close();
                        }		
					}
				}
			}
		}
		return null;
	}	*/
	

	

}