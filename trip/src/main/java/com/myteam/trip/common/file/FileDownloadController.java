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
	private static final String COMMUNITY_IMAGE_REPO = "C:\\community\\community_image";
	
	
	@RequestMapping("/board/download.do")
	protected void articleDownload(@RequestParam("imageFileName") String imageFileName,
							@RequestParam("articleNO") String articleNO,
			                 HttpServletResponse response)throws Exception {
		if(!imageFileName.equals("null")) {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO + "\\" +articleNO+"\\"+ imageFileName;
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
	}                  
	
	//맵핑이랑 메서드 이름만 바꿔놨어요 메서드 내용쪽은 맞춰서 수정	 ㅇㅋㅇㅋ
		@RequestMapping("/community/download.do")
		protected void communityDownload(@RequestParam("c_imageFileName") String c_imageFileName,
								@RequestParam("c_no") String c_no,
				                 HttpServletResponse response)throws Exception {
			OutputStream out = response.getOutputStream();
			String downFile = COMMUNITY_IMAGE_REPO +  "\\" + c_no +"\\"+ c_imageFileName;
			File file = new File(downFile);

			response.setHeader("Cache-Control", "no-cache");
			response.addHeader("Content-disposition", "attachment; fileName=" + c_imageFileName);
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
	}
