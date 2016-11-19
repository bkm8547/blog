package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.test.dto.BoardDTO;


public class BoardService {
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List selectNewsList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.selectNewsList");
	}
	public int insertNews(BoardDTO board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.insertNews", board);
	}

	public BoardDTO selectNews(int no) {
		// TODO Auto-generated method stub	
		return sqlSession.selectOne("boardMapper.selectNews", no);
	}
	public int selectAllCount() {
		// TODO Auto-generated method stub	
		return sqlSession.selectOne("boardMapper.selectAllCount");
	}
	public int updateNews(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.updateNews", dto);
	}
	public int deleteNews(BoardDTO dto) {
		// TODO Auto-generated method stub
		return sqlSession.delete("boardMapper.deleteNews", dto);
	}
}