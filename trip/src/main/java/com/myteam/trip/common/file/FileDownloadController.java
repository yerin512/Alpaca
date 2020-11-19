package com.myteam.trip.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	//커뮤니티는  커뮤니티 파일 위치값
	
	
	@RequestMapping("/article/download.do")
	protected void articleDownload(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("a_no") String a_no,
			                 HttpServletResponse response)throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +a_no+"\\"+ imageFileName;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer); 
			if (count == -1) 
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}                  
	
//맵핑이랑 메서드 이름만 바꿔놨어요 메서드 내용쪽은 맞춰서 수정	
//	@RequestMapping("/community/download.do")
//	protected void communityDownload(@RequestParam("imageFileName") String imageFileName,
//							@RequestParam("articleNO") String articleNO,
//			                 HttpServletResponse response)throws Exception {
//		OutputStream out = response.getOutputStream();
//		String downFile = ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
//		File file = new File(downFile);
//
//		response.setHeader("Cache-Control", "no-cache");
//		response.addHeader("Content-disposition", "attachment; fileName=" + imageFileName);
//		FileInputStream in = new FileInputStream(file);
//		byte[] buffer = new byte[1024 * 8];
//		while (true) {
//			int count = in.read(buffer); 
//			if (count == -1) 
//				break;
//			out.write(buffer, 0, count);
//		}
//		in.close();
//		out.close();
//	} 
}
