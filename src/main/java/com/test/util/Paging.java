package com.test.util;

import javax.servlet.http.HttpServletRequest;

import com.test.dto.PagingDTO;

public class Paging {
	public static Paging pageInstance = null;
	int allCount;
	int allPage;
	int newsPerPage = 3;
	int maxPage = 5;
	int firstPage;
	int endPage;
	int nowPage;
	boolean leftOn;
	boolean rightOn;

	public static Paging getInstance() {
		if (pageInstance == null) {
			pageInstance = new Paging();
		}
		return pageInstance;
	}

	public PagingDTO getPaging(int allCount, HttpServletRequest request) {
		PagingDTO dto=new PagingDTO();
		this.allCount = allCount;
		allPage = (allPage / (newsPerPage + 1)) + 1;
		nowPage = Integer.parseInt(request.getParameter("page"));
		firstPage = (nowPage / newsPerPage) * newsPerPage + 1;
		if (allPage > firstPage + newsPerPage - 1)
			endPage = firstPage + newsPerPage - 1;
		else {
			endPage = allPage;
		}
		if (allPage > maxPage) {
			rightOn = true;
		} else {
			rightOn = false;
		}
		if(firstPage>1){
			leftOn=true;
		}
		else
		{
			leftOn=false;
		}
		dto.setAllCount(allCount);
		dto.setAllPage(allPage);
		dto.setEndPage(endPage);
		dto.setFirstPage(firstPage);
		dto.setMaxPage(maxPage);
		dto.setNewsPerPage(newsPerPage);
		dto.setNowPage(nowPage);
		dto.setRightOn(rightOn);
		dto.setLeftOn(leftOn);
		return dto;
	}
}
