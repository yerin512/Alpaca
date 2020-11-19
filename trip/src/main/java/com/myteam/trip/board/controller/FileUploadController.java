package com.myteam.trip.board.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
/*
@Controller

public class FileUploadController {
    private static final String SAVE_PATH = "c:\\board\\article_img";
 
    
 
    @RequestMapping("upload")
    public ModelAndView upload(
            @RequestParam(value="file1", required = false) MultipartFile mf) {
            ModelAndView mv = new ModelAndView("uploadView");
    
 
 
            String originalFileName = mf.getOriginalFilename();
            long fileSize = mf.getSize();
            String safeFile = SAVE_PATH + System.currentTimeMillis() + originalFileName;
 
            
            try {
                mf.transferTo(newFile(safeFile));
 
               } catch (IllegalStateException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
        }

        return mv
    
}
*/