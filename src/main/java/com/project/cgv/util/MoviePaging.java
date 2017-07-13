package com.project.cgv.util;

public class MoviePaging {
	public static final int countPerPage = 8;		// 페이지당 row 개수
	
	private int totalCount; 	// 전체 row 개수
	private int currentPageNumber;	// 현재 페이지 번호
	private int pageTotalCount;	// 총 페이지 개수
	
	private int startPage;
	private int endPage;
	
	private int skip;
	private int qty;

	public MoviePaging() {}
	
	public MoviePaging(int totalCount, int currentPageNumber) {
		this.totalCount = totalCount;
		this.currentPageNumber = currentPageNumber;
		
		calculatePageTotalCount();
		
		startPage = (currentPageNumber - 1) / countPerPage * countPerPage + 1;
		endPage = ((currentPageNumber - 1) / countPerPage + 1) * countPerPage;
		
		skip =  (currentPageNumber-1)*countPerPage;
		qty = countPerPage;
	}
	
	private void calculatePageTotalCount() {
		pageTotalCount = totalCount / countPerPage;
		
		if(totalCount % countPerPage > 0) {
			pageTotalCount++;
		}
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	
	public int getCountPerPage() {
		return countPerPage;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}
	
}
