package com.myteam.alpaca.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myteam.alpaca.board.dao.BoardDAO;

import com.myteam.alpaca.board.vo.ArticleVO;






@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();
        return articlesList;
	}
	

	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int articleNO = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		return articleNO;
	}

	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	
	}
	
	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}


	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}







	

	
}
