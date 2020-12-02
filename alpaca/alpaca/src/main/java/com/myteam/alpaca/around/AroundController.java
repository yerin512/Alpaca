package com.myteam.alpaca.around;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myteam.alpaca.board.service.BoardService;
import com.myteam.alpaca.board.vo.ArticleVO;




@Controller
public class AroundController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ArticleVO articleVO;
	
	
	@RequestMapping(value = "/around/aroundMap.do", method = { RequestMethod.GET, RequestMethod.POST })
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<ArticleVO> mapList = boardService.listArticles();
		ModelAndView mav = new ModelAndView(viewName);
		
		
		double locX[] = new double[mapList.size()];
		double locY[] = new double[mapList.size()];
		int price[] = new int[mapList.size()];
		String title[] = new String[mapList.size()];
		String imageFile1[]  = new String [mapList.size()];
		int articleNO[] = new int[mapList.size()];
		
		for(int i=0; i<mapList.size(); i++) {
			locX[i] = mapList.get(i).getLoc_x();
			locY[i] = mapList.get(i).getLoc_y();
			price[i] = mapList.get(i).getPrice();
			title[i] = mapList.get(i).getTitle();
			imageFile1[i] = mapList.get(i).getImageFile1();
			articleNO[i] = mapList.get(i).getArticleNO();
		}
		
		
		mav.addObject("locX",locX);
		mav.addObject("locY",locY);
		mav.addObject("price",price);
		mav.addObject("title",title);
		mav.addObject("imageFile1",imageFile1);
		mav.addObject("articleNO",articleNO);
		
	
		return mav;
	}
	

}