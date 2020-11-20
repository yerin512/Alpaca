package com.myteam.trip.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myteam.trip.board.vo.AImageVO;
import com.myteam.trip.board.vo.ArticleVO;



@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<ArticleVO> articlesList = articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}

	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int a_no = selectNewArticleNO();
		articleMap.put("a_no", a_no);
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		return a_no;
	}
    
	
	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", articleNO);
		
	}
	
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<AImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int a_no = (Integer)articleMap.get("a_no");
		int imageFileNO = selectNewImageFileNO();
		for(AImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setA_no(a_no);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
	private int selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}
	
	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}


	@Override
	public List selectImageFileList(int a_no) throws DataAccessException {
		List<AImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",a_no);
		return imageFileList;
	}

	

}
