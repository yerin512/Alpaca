package com.myteam.trip.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.trip.board.dao.BoardDAO;
import com.myteam.trip.board.vo.AImageVO;
import com.myteam.trip.board.vo.ArticleVO;




@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();
        return articlesList;
	}

	
	//다중 파일 인서트
	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int a_no = boardDAO.insertNewArticle(articleMap);
		articleMap.put("a_no", a_no);
		boardDAO.insertNewImage(articleMap);
		return a_no;
	}
	
	
	
	//다중 파일 보이기
	@Override
	public Map viewArticle(int a_no) throws Exception {
		Map articleMap = new HashMap();
		ArticleVO articleVO = boardDAO.selectArticle(a_no);
		List<AImageVO> imageFileList = boardDAO.selectImageFileList(a_no);
		articleMap.put("article", articleVO);
		articleMap.put("imageFileList", imageFileList);
		return articleMap;
	}

	
	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	@Override
	public void removeArticle(int a_no) throws Exception {
		boardDAO.deleteArticle(a_no);
	}
	

	
}
